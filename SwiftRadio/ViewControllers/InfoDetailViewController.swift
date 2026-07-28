//
//  InfoDetailViewController.swift
//  Swift Radio
//
//  Created by Matthew Fecher on 7/9/15.
//  Copyright (c) 2015 MatthewFecher.com. All rights reserved.
//

import UIKit
import LuciqSDK


class InfoDetailViewController: UIViewController {
    
    @IBOutlet weak var stationImageView: UIImageView!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var stationDescLabel: UILabel!
    @IBOutlet weak var stationLongDescTextView: UITextView!
    @IBOutlet weak var okayButton: UIButton!
    
    var currentStation: RadioStation?

    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        guard currentStation != nil else {
            // Guard against presenting this screen without a station to avoid
            // a force-unwrap crash (e.g. Info button tapped while no station is playing)
            assertionFailure("InfoDetailViewController presented without a currentStation")
            navigationController?.popViewController(animated: false)
            return
        }

        setupStationText()
        setupStationLogo()
        
     /*   let error = NSError(domain: "com.example.app", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Something went wrong"])
        if let nonFatal = CrashReporting.error(error) {
            nonFatal.stackTraceMode = .full
           /* nonFatal.userAttributes = [
                  "hello" : "world"
                ]*/
            let profileDetailsString = "this is user data"
            Instabug.userData = profileDetailsString
            
            nonFatal.report()
        }*/
        

        
   /* let error = NSError(domain: "com.as.er", code: 303, userInfo: [
                    "reason": "This is a test reason",
                    "description": "This is a test error"
                ])
                if let nonfatal = CrashReporting.error(error) {
                    nonfatal.stackTraceMode = .callerThread
                    nonfatal.report()
                }
        */
        
        //BugReporting.show(with: .bug, options: [.emailFieldHidden])
        //Instabug.show()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Set user attribute with screen name
        let screenName = String(describing: type(of: self)).replacingOccurrences(of: "ViewController", with: "")
        Luciq.setUserAttribute(screenName, withKey: "Team Name")
    }
    // MARK: - UI Helpers

    func setupStationText() {
        guard let currentStation = currentStation else { return }

        // Display Station Name & Short Desc
        stationNameLabel.text = currentStation.name
        stationDescLabel.text = currentStation.desc

        // Display Station Long Desc
        if currentStation.longDesc == "" {
            loadDefaultText()
        } else {
            stationLongDescTextView.text = currentStation.longDesc
        }
    }
    
    func loadDefaultText() {
        // Add your own default ext
        stationLongDescTextView.text = "You are listening to Swift Radio. This is a sweet open source project. Tell your friends, swiftly!"
    }
    
    func setupStationLogo() {
        guard let currentStation = currentStation else { return }

        // Display Station Image/Logo
        currentStation.getImage { [weak self] image in
            self?.stationImageView.image = image
        }

        // Apply shadow to Station Image
        stationImageView.applyShadow()
    }
    
    // MARK: - IBActions
    
    @IBAction func okayButtonPressed(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}
