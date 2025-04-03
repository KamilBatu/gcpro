import 'package:flutter_riverpod/flutter_riverpod.dart';

enum UsernameType { email, phone }

final usernameTypeProvider = AutoDisposeStateProvider<UsernameType>(
  (ref) {
    return UsernameType.email;
  },
  name: 'usernameTypeProvider',
);
