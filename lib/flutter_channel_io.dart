import 'dart:async';
import 'channel_io_interface.dart';

class FlutterChannelIo {
  static late ChannelIOApi _api = ChannelIOApi();

  static Future<String> boot() async {
    BootConfig config = BootConfig();
    ChannelIOApi api = ChannelIOApi();
    print(await api.boot(config));
    return "test2";
  }
}
