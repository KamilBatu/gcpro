import 'package:gcpro/services/user_cache_service/domain/models/user_core.dart';
import 'package:gcpro/services/user_cache_service/domain/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier(
    this.userRepository,
  ) : super(const UserState.initial());
  final UserCacheRepository userRepository;

  Future<void> getUser() async {
    if (!state.isLoading) {
      state = state.copyWith(isLoading: true, error: false);

      final response = await userRepository.getUser();

      response.fold(
        (failure) => null,
        (data) {
          state = state.copyWith(
            user: data,
            isLoading: false,
          );
        },
      );
    } else {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> updateUser(Map<String, String> data) async {
    if (!state.isLoading) {
      state = state.copyWith(isLoading: true, error: false);

      final response = await userRepository.updateUser(data);

      response.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            error: true,
            message: failure.message,
          );
        },
        (success) {
          state = state.copyWith(
            user: state.user?.copyWith(
              phoneNumber: data["phoneNumber"],
              email: data["email"],
            ),
            isLoading: false,
          );
        },
      );
    }
  }

  Future<void> deleteUser() async {
    if (!state.isLoading) {
      state = state.copyWith(isLoading: true, error: false);

      final response = await userRepository.deleteUser();

      if (response) {
        state = state.copyWith(
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: true,
          message: 'Error deleting user',
        );
      }
    }
  }
}

enum UserStateEnum {
  emailUpdated,
  phoneNumberUpdated,
  passwordUpdated,
  error,
  loading,
  initial
}

class UserState extends Equatable {
  const UserState({
    this.user,
    this.state = UserStateEnum.initial,
    this.isLoading = false,
    this.error = false,
    this.message = '',
  });

  const UserState.initial({
    this.user,
    this.state = UserStateEnum.initial,
    this.isLoading = false,
    this.error = false,
    this.message = '',
  });
  final UserCore? user;
  final bool error;
  final UserStateEnum state;
  final String message;
  final bool isLoading;

  UserState copyWith({
    UserCore? user,
    UserStateEnum? state,
    bool? isLoading,
    bool? error,
    String? message,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      state: state ?? this.state,
      user: user ?? this.user,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return '''
UserState(user: $user, hasData: $error, message: 
$message, isLoading: $isLoading, state: $state)''';
  }

  @override
  List<Object?> get props => [user, error, message, state];
}
