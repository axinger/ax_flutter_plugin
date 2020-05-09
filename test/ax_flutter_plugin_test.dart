import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ax_flutter_plugin/ax_flutter_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('ax_flutter_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await AxFlutterPlugin.platformVersion, '42');
  });
}
