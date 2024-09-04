//
//  ShareViewController.swift
//  myShareExtension
//
//  Created by 陳豐文 on 2024/09/04.
//
import UIKit
import Social
import Flutter

class ShareViewController: SLComposeServiceViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        captureSharedText()
    }

    func captureSharedText() {
        if let items = extensionContext?.inputItems as? [NSExtensionItem] {
            for item in items {
                if let attachments = item.attachments {
                    for attachment in attachments {
                        if attachment.hasItemConformingToTypeIdentifier("public.text") {
                            attachment.loadItem(forTypeIdentifier: "public.text", options: nil) { (data, error) in
                                if let text = data as? String {
                                    self.sendTextToFlutter(text)
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    func sendTextToFlutter(_ text: String) {
        // Communicate with the main Flutter app via UserDefaults or MethodChannel
        let userDefaults = UserDefaults(suiteName: "group.com.todolist.shareExtension") // Use App Group if needed
        userDefaults?.set(text, forKey: "sharedText")
        userDefaults?.synchronize()
    }
}
