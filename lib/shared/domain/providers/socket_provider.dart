import 'package:gcpro/shared/data/remote/socket_network_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final socketServiceProvider = Provider<SocketService>((ref) {
  return SocketServiceImpl();
});

final priceUpdatesProvider = StreamProvider.autoDispose<List<dynamic>>((ref) {
  final socketService = ref.watch(socketServiceProvider);

  // TODO: Add Filter logic

  return socketService.listen('price_update').map((event) => [event]);
});
