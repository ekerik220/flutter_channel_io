import 'package:pigeon/pigeon.dart';

enum BootStatus {
  SUCCESS,
  NOT_INITIALIZED,
  NETWORK_TIMEOUT,
  NOT_AVAILABLE_VERSION,
  SERVICE_UNDER_CONSTRUCTION,
  REQUIRE_PAYMENT,
  ACCESS_DENIED,
  UNKNOWN_ERROR
}

enum Language { KOREAN, JAPANESE, ENGLISH }

enum ChannelButtonPosition { LEFT, RIGHT }


class Profile {
  String? name;
  String? avatarUrl;
  String? email;
  String? mobileNumber;
  // Map<String?, String?>? propertyKey;
}

class BootConfig {
  String? pluginKey;
  String? memberId;
  String? memberHash;
  Profile? profile;
  // Language? language;
  String? unsubscribed;
  String? trackDefaultEvent;
  String? hidePopup;
  // ChannelButtonOption? channelButtonOption;
}

class ChannelButtonOption {
  ChannelButtonPosition? position;
  int? xMargin;
  int? yMargin;
}

class User {
  String? id;
  String? memberId;
  String? name;
  String? avatarUrl;
  Map<String?, String?>? profile;
  String? alert;
  List<String?>? tags;
  String? language;
  bool? unsubscribed;
}

class PopupData {
  String? chatId;
  String? message;
  String? name;
  String? avatarUrl;
}

class UserData {
  Language? language;
  List<String?>? tags;
  Profile? profile;
  Profile? profileOnce;
  bool? unsubscribed;
}

@HostApi()
abstract class ChannelIOApi {
  String boot(BootConfig config);

  String test();
}
