import 'package:socket_io_client/socket_io_client.dart' as io;

abstract class SocketService {
  Future<void> connect(String url, {Map<String, dynamic>? queryParams});
  void disconnect();
  void sendMessage(String event, dynamic data);
  Stream<dynamic> listen(String event);
  bool get isConnected;
}

class SocketServiceImpl implements SocketService {
  late io.Socket _socket;
  bool _isConnected = false;

  @override
  Future<void> connect(String url, {Map<String, dynamic>? queryParams}) async {
    _socket = io.io(
      url,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .setQuery(queryParams ?? {})
          .enableAutoConnect()
          .build(),
    );

    _socket
      ..onConnect((_) {
        _isConnected = true;
        // print('Connected to WebSocket');
      })
      ..onDisconnect((_) {
        _isConnected = false;
        // print('Disconnected from WebSocket');
      })
      ..connect();
  }

  @override
  void disconnect() {
    _socket.disconnect();
  }

  @override
  void sendMessage(String event, dynamic data) {
    if (_isConnected) {
      _socket.emit(event, data);
    }
  }

  @override
  Stream<dynamic> listen(String event) {
    // TODO: change String to Enum for event

    return Stream<dynamic>.multi((controller) {
      _socket.on(event, (data) => controller.add(data));
      controller.onCancel = () => _socket.off(event);
    });
  }

  @override
  bool get isConnected => _isConnected;
}
