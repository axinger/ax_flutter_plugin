import 'dart:async';

import 'package:ax_flutter_plugin/ax_flutter_plugin.dart';
import 'package:flutter/foundation.dart';

class KeyChain {
  static Future<dynamic> get({@required String key}) {
    return AxFlutterPlugin.channel.invokeMethod<dynamic>(
      'key_chain_get',
      <String, dynamic>{
        'key': key,
      },
    );
  }

  static Future<bool> set({@required String key, @required dynamic value}) {
    return AxFlutterPlugin.channel.invokeMethod<bool>(
      'key_chain_set',
      <String, dynamic>{
        'key': key,
        'value': value,
      },
    );
  }

  static Future<dynamic> remove({@required String key}) {
    return AxFlutterPlugin.channel.invokeMethod<dynamic>(
      'key_chain_remove',
      <String, dynamic>{
        'key': key,
      },
    );
  }
}
