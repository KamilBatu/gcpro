import 'package:gcpro/features/auth/data/datasource/auth_datasource.dart';

abstract class AuthRepository {}

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this.authDatasource);
  final AuthDatasource authDatasource;
}
