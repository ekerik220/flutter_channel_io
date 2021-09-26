// Autogenerated from Pigeon (v1.0.7), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name
// @dart = 2.12
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

import 'package:flutter/foundation.dart' show WriteBuffer, ReadBuffer;
import 'package:flutter/services.dart';

class Profile {
  String? name;
  String? avatarUrl;
  String? email;
  String? mobileNumber;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['name'] = name;
    pigeonMap['avatarUrl'] = avatarUrl;
    pigeonMap['email'] = email;
    pigeonMap['mobileNumber'] = mobileNumber;
    return pigeonMap;
  }

  static Profile decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return Profile()
      ..name = pigeonMap['name'] as String?
      ..avatarUrl = pigeonMap['avatarUrl'] as String?
      ..email = pigeonMap['email'] as String?
      ..mobileNumber = pigeonMap['mobileNumber'] as String?;
  }
}

class BootConfig {
  String? pluginKey;
  String? memberId;
  String? memberHash;
  Profile? profile;
  String? unsubscribed;
  String? trackDefaultEvent;
  String? hidePopup;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['pluginKey'] = pluginKey;
    pigeonMap['memberId'] = memberId;
    pigeonMap['memberHash'] = memberHash;
    pigeonMap['profile'] = profile == null ? null : profile!.encode();
    pigeonMap['unsubscribed'] = unsubscribed;
    pigeonMap['trackDefaultEvent'] = trackDefaultEvent;
    pigeonMap['hidePopup'] = hidePopup;
    return pigeonMap;
  }

  static BootConfig decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return BootConfig()
      ..pluginKey = pigeonMap['pluginKey'] as String?
      ..memberId = pigeonMap['memberId'] as String?
      ..memberHash = pigeonMap['memberHash'] as String?
      ..profile = pigeonMap['profile'] != null
          ? Profile.decode(pigeonMap['profile']!)
          : null
      ..unsubscribed = pigeonMap['unsubscribed'] as String?
      ..trackDefaultEvent = pigeonMap['trackDefaultEvent'] as String?
      ..hidePopup = pigeonMap['hidePopup'] as String?;
  }
}

class _ChannelIOApiCodec extends StandardMessageCodec {
  const _ChannelIOApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is BootConfig) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else 
    if (value is Profile) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else 
{
      super.writeValue(buffer, value);
    }
  }
  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:       
        return BootConfig.decode(readValue(buffer)!);
      
      case 129:       
        return Profile.decode(readValue(buffer)!);
      
      default:      
        return super.readValueOfType(type, buffer);
      
    }
  }
}

class ChannelIOApi {
  /// Constructor for [ChannelIOApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  ChannelIOApi({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _ChannelIOApiCodec();

  Future<String> boot(BootConfig arg_config) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ChannelIOApi.boot', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object>[arg_config]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return (replyMap['result'] as String?)!;
    }
  }

  Future<String> test() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ChannelIOApi.test', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return (replyMap['result'] as String?)!;
    }
  }
}
