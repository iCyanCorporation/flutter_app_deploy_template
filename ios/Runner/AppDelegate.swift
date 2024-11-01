import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterViewController
    let methodChannel = FlutterMethodChannel(name: "com.icyan.todolist/share",
                                             binaryMessenger: controller.binaryMessenger)

    methodChannel.setMethodCallHandler { (call, result) in
      if call.method == "getSharedText" {
        // Retrieve shared text from UserDefaults (or other shared data sources)
        let userDefaults = UserDefaults(suiteName: "group.com.todolist.shareExtension")
        userDefaults?.set("Shared text from LINE", forKey: "sharedText")
        if let sharedText = userDefaults?.string(forKey: "sharedText") {
          result(sharedText)
        } else {
          result(FlutterError(code: "NO_DATA", message: "No shared text found", details: nil))
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
