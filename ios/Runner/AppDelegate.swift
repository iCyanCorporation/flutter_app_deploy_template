import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  
    var flutterEngine: FlutterEngine?
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      flutterEngine = FlutterEngine(name: "my_flutter_engine")
      flutterEngine?.run()
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
