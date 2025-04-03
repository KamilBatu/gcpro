import 'package:gcpro/features/auth/data/datasource/auth_datasource.dart';
import 'package:gcpro/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:gcpro/features/auth/presentation/providers/state/auth_notifier.dart';
import 'package:gcpro/features/auth/presentation/providers/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authDatasourceProvider = Provider<AuthDatasource>((ref) {
  return AuthRemoteDatasource();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final datasource = ref.watch(authDatasourceProvider);
  return AuthRepositoryImpl(datasource);
});

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthNotifier(repository);
});
