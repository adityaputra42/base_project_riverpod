import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketController extends StateNotifier<WebSocketChannel?> {
  WebSocketController() : super(null);
  late WebSocketChannel channel;
  StreamController streamController = StreamController.broadcast();

  
  void connectToWebSocket() async {
    const String wsURL = 'stream=';
    channel = WebSocketChannel.connect(Uri.parse(wsURL));
    channel.stream.listen((event) {
      streamController.add(event);
    }, onError: (e) async {
      await Future.delayed(const Duration(seconds: 3));
      connectToWebSocket();
    }, onDone: () async {
      await Future.delayed(const Duration(seconds: 3));
      connectToWebSocket();
    }, cancelOnError: true);
  }

  void disconnect() {
    state?.sink.close();
    state = null;
  }

  @override
  void dispose() {
    state?.sink.close();
    super.dispose();
  }
}

final webSocketControllerProvider =
    StateNotifierProvider<WebSocketController, WebSocketChannel?>((ref) {
  return WebSocketController();
});

final webSocketDataStreamProvider = StreamProvider.autoDispose<String>((ref) {
  final webSocketController = ref.watch(webSocketControllerProvider);

  if (webSocketController != null) {
    return webSocketController.stream.map((event) => event.toString());
  } else {
    return const Stream.empty();
  }
});


// Websocket v1 langsung stream
final websocketProvider = StreamProvider<dynamic>((ref) {
  String webSocketUrl = 'wss://your-websocket-url.com';
  final channel = IOWebSocketChannel.connect(webSocketUrl);
  return channel.stream;
});
