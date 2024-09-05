//
//  ShareViewController.swift
//  myShareExtension
//
//  Created by 陳豐文 on 2024/09/04.
//
import UIKit
import Flutter

class ShareViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        showFlutter()
    }

    func showFlutter() {
        let flutterViewController = FlutterViewController(project: nil, nibName: nil, bundle: nil)
        addChild(flutterViewController)
        view.addSubview(flutterViewController.view)
        flutterViewController.view.frame = view.bounds
    }
}