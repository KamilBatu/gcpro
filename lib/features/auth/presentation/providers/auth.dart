import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthState {
  final String? token;
  final DateTime? expiryDate;
  final String? userId;

  AuthState({this.token, this.expiryDate, this.userId});

  bool get isAuthenticated =>
      token != null &&
      expiryDate != null &&
      expiryDate!.isAfter(DateTime.now());

  AuthState copyWith({String? token, DateTime? expiryDate, String? userId}) {
    return AuthState(
      token: token ?? this.token,
      expiryDate: expiryDate ?? this.expiryDate,
      userId: userId ?? this.userId,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  Timer? _authTimer;

  AuthNotifier() : super(AuthState()) {
    _tryAutoLogin(); // Attempt to restore state on initialization
  }

  String? get token {
    if (state.token != null &&
        state.expiryDate != null &&
        state.expiryDate!.isAfter(DateTime.now())) {
      print('Token valid until: ${state.expiryDate}');
      return state.token;
    }
    print('Token expired or null');
    return null;
  }

  String? get userId => state.userId;

  Future<void> _saveToPrefs(
    String token,
    String userId,
    DateTime expiryDate,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('userId', userId);
    await prefs.setString('expiryDate', expiryDate.toIso8601String());
  }

  Future<void> _clearPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> _tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final userId = prefs.getString('userId');
    final expiryDateString = prefs.getString('expiryDate');

    if (token == null || userId == null || expiryDateString == null) {
      return; // No saved data, remain unauthenticated
    }

    final expiryDate = DateTime.parse(expiryDateString);
    if (expiryDate.isBefore(DateTime.now())) {
      return; // Token expired
    }

    state = AuthState(token: token, userId: userId, expiryDate: expiryDate);
    _setupAutoLogout();
    print('Auto-login successful, token expires: $expiryDate');
  }

  void _handleAuthResponse(Map<String, dynamic> responseData) {
    final newState = state.copyWith(
      token: responseData['idToken'],
      userId: responseData['localId'],
      expiryDate: DateTime.now().add(
        Duration(seconds: int.parse(responseData['expiresIn'])),
      ),
    );
    state = newState; // State assignment triggers Riverpod listeners
    _saveToPrefs(newState.token!, newState.userId!, newState.expiryDate!);
    print('Auth response handled, expiry: ${state.expiryDate}');
    _setupAutoLogout();
  }

  Future<void> register(String email, String password) async {
    const apiKey = 'AIzaSyCWDZbeHiJNZLSFxj9VowCI8M_pYTulxjg';
    final url = Uri.parse(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey',
    );

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
      );

      final responseData = json.decode(response.body);
      print(responseData);
      if (response.statusCode >= 400) {
        throw Exception(responseData['error']['message']);
      }

      _handleAuthResponse(responseData);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    const apiKey = 'AIzaSyCWDZbeHiJNZLSFxj9VowCI8M_pYTulxjg';
    final url = Uri.parse(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey',
    );

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
      );

      final responseData = json.decode(response.body);
      if (response.statusCode >= 400) {
        throw Exception(responseData['error']['message']);
      }

      _handleAuthResponse(responseData);
    } catch (error) {
      rethrow;
    }
  }

  void signOut() {
    print('Signing out...');
    state = AuthState(); // Reset state triggers Riverpod listeners
    _clearPrefs();
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    print('Sign out complete, token: ${state.token}');
  }

  void _setupAutoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timeToExpiry = state.expiryDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), signOut);
    print('Auto-logout set for $timeToExpiry seconds');
  }

  @override
  void dispose() {
    _authTimer?.cancel();
    super.dispose();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
