import 'package:flutter_riverpod/flutter_riverpod.dart';

final providerContainerProvider = Provider<ProviderContainer>(
  (ref) {
    // Provide a single instance of ProviderContainer
    return ProviderContainer();
  },
  name: 'providerContainerProvider',
);
