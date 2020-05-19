import 'dart:async';

import 'package:flutter/services.dart';

export 'src/key_chain.dart';

class AxFlutterPlugin {
  static const MethodChannel _channel =
      const MethodChannel('ax_flutter_plugin');

  static MethodChannel get channel {
    return _channel;
  }

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
