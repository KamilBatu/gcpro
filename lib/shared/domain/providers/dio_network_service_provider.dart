import 'package:gcpro/shared/data/remote/dio_network_service.dart';
import 'package:gcpro/shared/utils/network_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioNetworkServiceNotifier extends StateNotifier<DioNetworkService> {
  DioNetworkServiceNotifier(super.service);

  void updateHeaders(Map<String, String> newHeaders) =>
      state = state.updateHeader(newHeaders);

  void clearHeaders() => state = state.clearHeader();
}

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final networkServiceProvider =
    StateNotifierProvider<DioNetworkServiceNotifier, DioNetworkService>(
  (ref) {
    final Dio dio = ref.watch(dioProvider);
    final networkServiceInterceptor =
        ref.watch(networkServiceInterceptorProvider(dio));

    return DioNetworkServiceNotifier(
      DioNetworkService(
        dio: dio,
        networkServiceInterceptor: networkServiceInterceptor,
      ),
    );
  },
  name: 'networkServiceProvider',
);
