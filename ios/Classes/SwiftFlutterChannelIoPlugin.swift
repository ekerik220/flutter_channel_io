import Flutter
import UIKit

public class SwiftFlutterChannelIoPlugin: NSObject, FlutterPlugin, ChannelIOApi {
    public func testWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> String? {
        return "test"
    }

    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger: FlutterBinaryMessenger = registrar.messenger()
        let api: ChannelIOApi & NSObjectProtocol = SwiftFlutterChannelIoPlugin()
        ChannelIOApiSetup(messenger, api)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result("iOS " + UIDevice.current.systemVersion)
    }

    public func bootConfig(_ config: BootConfig, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> String? {
        return "test"
    }
}
