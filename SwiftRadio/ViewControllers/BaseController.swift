//
//  BaseController.swift
//  SwiftRadio
//
//  Created by Fethi El Hassasna on 2022-12-03.
//  Copyright © 2022 matthewfecher.com. All rights reserved.
//

import UIKit
import LuciqSDK

class BaseController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let image = UIImage(named: "background")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Set user attribute with screen name
        let screenName = String(describing: type(of: self)).replacingOccurrences(of: "ViewController", with: "")
        Luciq.setUserAttribute(screenName, withKey: "Team Name")
    }
    
    func setupViews() {
        view.addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }
}
