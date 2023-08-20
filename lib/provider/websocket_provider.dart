import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';

final websocketProvider = StreamProvider<dynamic>((ref) {
  String webSocketUrl = 'wss://your-websocket-url.com';
  final channel = IOWebSocketChannel.connect(webSocketUrl);
  return channel.stream;
});
