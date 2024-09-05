//
//  ShareViewController.swift
//  myShareExtension
//
//  Created by 陳豐文 on 2024/09/04.
//
import receive_sharing_intent

class ShareViewController: RSIShareViewController {
      
    // Use this method to return false if you don't want to redirect to host app automatically.
    // Default is true
    override func shouldAutoRedirect() -> Bool {
        return true
    }
    
    // Use this to change label of Post button
    // override func presentationAnimationDidFinish() {
    //     super.presentationAnimationDidFinish()
    //     navigationController?.navigationBar.topItem?.rightBarButtonItem?.title = "Send"
    // }
        // 受け取ったテキストデータを Flutter に渡す
    override func viewDidLoad() {
        super.viewDidLoad()

        if let content = self.extensionContext?.inputItems.first as? NSExtensionItem,
           let text = content.attributedContentText?.string {
            // Flutterにデータを渡す処理
            // 受け取ったテキストを UserDefaults などを通して main.dart へ渡す
            let userDefaults = UserDefaults(suiteName: "group.com.todolist.shareExtension")
            userDefaults?.set(text, forKey: "sharedText")
        }

        // 終了処理
        self.extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
    }
}
