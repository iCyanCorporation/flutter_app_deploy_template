import UIKit
import Flutter

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        // Retrieve the shared text from UserDefaults
        let userDefaults = UserDefaults(suiteName: "group.com.todolist.shareExtension")
        let sharedText = userDefaults?.string(forKey: "sharedText")

        // Pass the shared text to Flutter using MethodChannel
        let flutterViewController = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "com.icyan.todolist.share", binaryMessenger: flutterViewController.binaryMessenger)
        
        if let text = sharedText {
            channel.invokeMethod("receiveText", arguments: text)
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
