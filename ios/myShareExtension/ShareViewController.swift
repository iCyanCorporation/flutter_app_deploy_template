import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {
    override func didSelectPost() {
        if let item = extensionContext?.inputItems.first as? NSExtensionItem,
           let itemProvider = item.attachments?.first {
            if itemProvider.hasItemConformingToTypeIdentifier("public.text") {
                itemProvider.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, error) in
                    if let sharedText = text as? String {
                        let userDefaults = UserDefaults(suiteName: "group.com.todolist.shareExtension")
                        userDefaults?.set(sharedText, forKey: "sharedText")
                        userDefaults?.synchronize()
                    }
                }
            }
        }
        self.extensionContext?.completeRequest(returningItems: nil, completionHandler: nil)
    }
}
