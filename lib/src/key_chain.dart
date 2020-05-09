import 'dart:async';
import 'package:ax_flutter_plugin/ax_flutter_plugin.dart';

class KeyChain {
  static Future<dynamic> get(
    String key,
  ) async {
    dynamic result = await AxFlutterPlugin.channel.invokeMethod<dynamic>(
      'key_chain_get',
      <String, dynamic>{
        'key': key,
      },
    );
    return result;
  }

  static Future set(String key, dynamic value) async {
    bool result = await AxFlutterPlugin.channel.invokeMethod<bool>(
      'key_chain_set',
      <String, dynamic>{
        'key': key,
        'value': value,
      },
    );
    return result;
  }

  static Future<dynamic> remove(
    String key,
  ) async {
    dynamic result = await AxFlutterPlugin.channel.invokeMethod<dynamic>(
      'key_chain_remove',
      <String, dynamic>{
        'key': key,
      },
    );
    return result;
  }
}
