import 'dart:async';
import 'channel_io_interface.dart';

class FlutterChannelIo {
  static late ChannelIOApi _api = ChannelIOApi();

  static Future<String> boot() async {
    BootConfig config = BootConfig();
    return await _api.boot(config);
  }
}
