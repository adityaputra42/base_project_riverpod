import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:web_socket_channel/io.dart';

class Websocket {
  late IOWebSocketChannel channel;
  StreamController streamController = StreamController();
  final String? baseUrl = "";
  var websocketConected = false;
  bool loading = false;
  bool timeout = false;
  static final Websocket instance = Websocket();

  void onInit() async {
    streamController = StreamController.broadcast();
    connectToWebSocket();
  }

  void connectToWebSocket() async {
    final String wsURL = '$baseUrl/?stream=';
    log(wsURL);
    channel = IOWebSocketChannel.connect(wsURL);
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

  Future<void> subscribeOrderDetail(String uid) async {
    channel.sink.add(json.encode({
      "event": "subscribe",
      "streams": [uid]
    }));
    log(channel.stream.toString());
  }

  Future<void> unSubscribeOrder(String uid) async {
    channel.sink.add(json.encode({
      "event": "unsubscribe",
      "streams": [uid]
    }));
  }

  void onClose() {
    channel.sink.close();
  }
}
