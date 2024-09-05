import UIKit
import Flutter

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        // FlutterViewController setup
        let flutterViewController = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "com.icyan.todolist.share", binaryMessenger: flutterViewController.binaryMessenger)

        // Handle the shared text passed from the Share Extension
        channel.setMethodCallHandler { (call, result) in
            if call.method == "getSharedText" {
                // Retrieve the shared text from UserDefaults
                let userDefaults = UserDefaults(suiteName: "group.com.todolist.shareExtension")
                let sharedText = userDefaults?.string(forKey: "sharedText")
                
                if let text = sharedText {
                    result(text) // Pass the shared text to Flutter
                } else {
                    result(FlutterError(code: "NO_TEXT", message: "No shared text found", details: nil))
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
