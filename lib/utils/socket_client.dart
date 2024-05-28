import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;
//http://192.168.137.1:3000
  SocketClient._internal() {
    socket = IO.io('https://type-racer-d6cffa3c56c9.herokuapp.com/', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();
    socket!.on('connect', (_) {
      print('Connected to the server');
    });
    socket!.on('disconnect', (_) {
      print('Disconnected from the server');
    });
        socket!.onConnectError((data) {
      print('Connect error: $data');
    });
    socket!.onError((data) {
      print('Error: $data');
    });

  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
