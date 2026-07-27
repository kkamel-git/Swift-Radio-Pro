//
//  AppDelegate.swift
//  Swift Radio
//
//  Created by Matthew Fecher on 7/2/15.
//  Copyright (c) 2015 MatthewFecher.com. All rights reserved.
//

import UIKit
import LuciqSDK

import Capture

import MediaPlayer
import FRadioPlayer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: MainCoordinator?
    
    // CarPlay
    var playableContentManager: MPPlayableContentManager?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
         
        // Luciq – Video-like replay (1 screenshot/sec, normal quality). Configure before start.
        SessionReplay.screenshotCapturingMode = .frequency
        SessionReplay.screenshotCaptureInterval = 1000  // 1 screenshot per second (ms)
        SessionReplay.screenshotQualityMode = .normal

        // Luciq
        Luciq.start(withToken: "be6b64add30a6d98f6eaf6fd3928ddd3", invocationEvents: [.floatingButton, .shake])
        //beta token = 8e45c233b1bc16e2cdafe392ec1e04ed
        //prod token = be6b64add30a6d98f6eaf6fd3928ddd3
        Luciq.welcomeMessageMode = WelcomeMessageMode.disabled // Disable welcome message
        BugReporting.bugReportingOptions = [.emailFieldOptional]
        //BugReporting.bugReportingOptions = [.emailFieldHidden]
        Luciq.setReproStepsFor(.all, with: .enable)
        //Luciq.setUserAttribute("beta", withKey: "Tester")
        //Luciq.setAutoMaskScreenshots([.textInputs, .labels])
        Luciq.identifyUser(withID: "11", email: " ", name: nil)
        let nowPlayingEnhanced = FeatureFlag(name: "now_playing_enhanced")
        Luciq.add(featureFlag: nowPlayingEnhanced)
        //Luciq.removeFeatureFlag("background_playback")
        //let backgroundPlayback = FeatureFlag(name: "background_playback")
        //Luciq.add(featureFlag: backgroundPlayback)
        //BugReporting.extendedBugReportMode = .enabledWithRequiredFields
        //BugReporting.autoScreenRecordingEnabled = true
        

         
        //*****************************************My code******************************************************\\
        //SE beta
            //Instabug.start(withToken: "8e45c233b1bc16e2cdafe392ec1e04ed", invocationEvents: [.floatingButton, .shake])
        //SE prod
            //--Instabug.start(withToken: "be6b64add30a6d98f6eaf6fd3928ddd3", invocationEvents: [.floatingButton, .shake])
            //Instabug.start(withToken: "be6b64add30a6d98f6eaf6fd3928ddd3", invocationEvents: [.floatingButton])
            //Instabug.start(withToken: "be6b64add30a6d98f6eaf6fd3928ddd3", invocationEvents: [.shake, .screenshot])
        //SE beta with no invocation
            //Instabug.start(withToken: "8e45c233b1bc16e2cdafe392ec1e04ed", invocationEvents: [.none])
        
        //Debugging logs
            //Instabug.sdkDebugLogsLevel = .verbose
        
        //Instabug Logs
           /*IBGLog.log("Log statement")
            IBGLog.logVerbose("Verbose statement")
            IBGLog.logInfo("Info statement")
            IBGLog.logWarn("Warning statement")
            IBGLog.logDebug("Debug statement")
            IBGLog.logError("Error statement")*/
        
        //SDK color
            //Instabug.tintColor = .init(red: 212/255, green: 19/255, blue: 42/255, alpha: 1)
            /*IBGTheme *theme = [[IBGTheme alloc] init];
            theme.primaryColor = UIColor.yellowColor;
            theme.backgroundColor = UIColor.systemGrayColor;
            Instabug.theme = theme;
             */
        
        /*let theme = Theme()
        theme.primaryColor = UIColor.init(red: 32/255, green: 211/255, blue: 164/255, alpha: 1)
        //theme.primaryColor = UIColor.systemGreen
        Instabug.theme = theme*/

        
        //Overriding String Values
            //Instabug.setValue("We are happy to hear your feedback", forStringWithKey: kIBGBetaWelcomeMessageWelcomeStepTitle)
            //Instabug.setValue("Shake your device to report a bug", forStringWithKey: kIBGBetaWelcomeMessageHowToReportStepContent)
            //Instabug.setValue("a", forStringWithKey: kIBGReproStepsDisclaimerBody)
            //Instabug.setValue("a", forStringWithKey: kIBGReproStepsDisclaimerLink)
            //Instabug.setValue("Editable Text", forStringWithKey: kIBGCommentFieldPlaceholderForBugReportStringName)
            //Instabug.setValue("Editable Text", forStringWithKey: kIBGReproStepsListHeader)
            //Instabug.setValue("Editable Text", forStringWithKey: kIBGReproStepsListEmptyStateLabel)
            //Instabug.setValue("Editable Text", forStringWithKey: kIBGReproStepsListTitle)
            //Instabug.setValue("Editable Text", forStringWithKey: kIBGReproStepsListItemName)
            //Instabug.setValue("Editable Text", forStringWithKey: kIBGThankYouAlertTitleStringName)
            //Instabug.setValue("Editable Text", forStringWithKey: kIBGCommentFieldPlaceholderForBugReportStringName)
            //Instabug.setValue("Ask Uendi a question", forStringWithKey: kIBGAskAQuestionStringName)
            //Instabug.setValue("Get directed to our bot", forStringWithKey: kIBGReportQuestionDescriptionStringName)
            //Instabug.setValue("Ask us anything and we will reply back with a link to our bot ", forStringWithKey: kIBGCommentFieldPlaceholderForQuestionStringName)
            //Instabug.setValue("Report a bug or open conversation", forStringWithKey: kIBGInvocationTitleStringName)
        
        //User Consent
            /*BugReporting.addUserConsent(withKey: "Screenshots Consent",
                                               description: "Send automatically captured screenshots in this report",
                                               mandatory: false,
                                               checked: false,
                                    actionType: .dropAutoCapturedMedia)*/
        
        //Welcome Message Mode
            //Instabug.welcomeMessageMode = IBGWelcomeMessageMode.live
            //--Instabug.welcomeMessageMode = IBGWelcomeMessageMode.disabled // Disable welcome message
        //Show Welcome Message
            //Instabug.showWelcomeMessage(with: IBGWelcomeMessageMode.beta) // For beta testers
            //Instabug.showWelcomeMessage(with: IBGWelcomeMessageMode.live) // For live users
        
        //Beta auto-screen recording
            //BugReporting.autoScreenRecordingEnabled = true
        
        // Specify which of the feedback, bug, or question options appear in the prompt options
            //BugReporting.promptOptionsEnabledReportTypes = [.bug, .feedback, .question]
            //BugReporting.promptOptionsEnabledReportTypes = [.bug]
            //BugReporting.promptOptionsEnabledReportTypes = [.bug, .question]
        
        //Instabug.show()
        
        //Email and Comment Requirement (Options)
            //BugReporting.bugReportingOptions = [.emailFieldHidden, .emailFieldOptional, .commentFieldRequired, .disablePostSendingDialog, .none]
            //BugReporting.bugReportingOptions = [.emailFieldHidden]
            //--BugReporting.bugReportingOptions = [.emailFieldOptional]
        
        //BugReporting.show(with: .bug, options: [])
        //BugReporting.show(with: .bug, options: [.emailFieldHidden])
        
        //Enable or disable screenshots
        //--Instabug.setReproStepsFor(.all, with: .enable)
        //Instabug.setReproStepsFor(.all, with: .enabledWithNoScreenshots)
        
        //Masking
            //Luciq.setAutoMaskScreenshots([.textInputs ,.labels])
            //Instabug.setAutoMaskScreenshots([.textInputs])
            //Instabug.setAutoMaskScreenshots([.labels])
            //Instabug.setAutoMaskScreenshots([.media])
        
        //Disbale replies
            //Replies.enabled = false
        
        
        //User attribute
          /*  if let bundleID = Bundle.main.bundleIdentifier {
                Instabug.setUserAttribute(bundleID, withKey: "BundleIdentifier")
            } else {
                print("Failed to retrieve the Bundle Identifier.")
            }*/
            //Instabug.removeUserAttribute(forKey: "BundleIdentifier")
            //Instabug.removeUserAttribute(forKey: "User Attribute")
            //Instabug.setUserAttribute("Host", withKey: "User Attribute")
            //Instabug.removeUserAttribute(forKey: "Health Insurance")
            //--Instabug.setUserAttribute("beta", withKey: "Tester")
        
        
        //Identify User or logout
           /* if let bundleID = Bundle.main.bundleIdentifier {
                //Instabug.identifyUser(withID: bundleID, email: " ", name: " ")
                Instabug.identifyUser(withID: "swift", email: " ", name: " ")
                //Instabug.identifyUser(withID: "device ID", email: " ", name: bundleID)
            } else {
                print("Failed to retrieve the Bundle Identifier for SR.")
            }*/
            //Instabug.identifyUser(email: "kkamel@instabug.com", name: "Kareem")
            //Instabug.logOut()
            //Instabug.identifyUser(withID: "123", email: " ", name: "Kareem")
            //Instabug.identifyUser(withID: "123", email: "jdoe@company.com", name: "John")
            //Instabug.identifyUser(withID: "123", email: " ", name: " ")
        
       /* DispatchQueue.main.asyncAfter(deadline: .now() + 20.0) {
            // Code you want to execute after a 2-second delay
            Instabug.captureScreenshot()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // Code you want to execute after a 2-second delay
            Instabug.captureScreenshot()
        }*/

        
        //*****************************************End of my code******************************************************\\

        
        
        
        //Bitdrift
        
         /*
          Logger.start(
           withAPIKey: "GiCR4xin7opN+YD39SNRkClrcLtgNcn6BhUsaPe0BdPNvSILRVFBSTdySUFKdTgo/gQ=",
           sessionStrategy: .fixed(),
         )
          */
         
        
        
        
        //BugSnag
        /*
        Bugsnag.start()
        BugsnagPerformance.start()
        */
        
        
        // FRadioPlayer config
        FRadioPlayer.shared.isAutoPlay = true
        FRadioPlayer.shared.enableArtwork = true
        FRadioPlayer.shared.artworkAPI = iTunesAPI(artworkSize: 600)
        
        // AudioSession & RemotePlay
        activateAudioSession()
        setupRemoteCommandCenter()
        UIApplication.shared.beginReceivingRemoteControlEvents()
        
        // Make status bar white
        UINavigationBar.appearance().barStyle = .black
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().prefersLargeTitles = true
        
        // `CarPlay` is defined only in SwiftRadio-CarPlay target:
        // Build Settings > Swift Compiler - Custom Flags
#if CarPlay
        setupCarPlay()
#endif
        
        // Start the coordinator
        coordinator = MainCoordinator(navigationController: UINavigationController())
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator?.navigationController
        window?.makeKeyAndVisible()
        
        coordinator?.start()
        
        ///  handled exceptions - start
         /*
         let exception = NSException(name: NSExceptionName("handled exception"), reason: "debugging reasons")
         if let nonFatalException = CrashReporting.exception(exception) {
         nonFatalException.userAttributes = ["Premium" : "Member"]
         nonFatalException.report()
         }
         */
        ///  handled exceptions - end
        
        ///  handled error - start
         /*
         enum CustomError : Error{
             case debug
             case test
         }
         do{
             throw CustomError.debug
         } catch{
             if let nonFatal = CrashReporting.error(CustomError.debug) {
                 nonFatal.report()
             }
         }
         */
        ///  handled error - end
        
     
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        
        UIApplication.shared.endReceivingRemoteControlEvents()
        
    }
    
    // MARK: - Remote Controls
    
    private func setupRemoteCommandCenter() {
        // Get the shared MPRemoteCommandCenter
        let commandCenter = MPRemoteCommandCenter.shared()
        
        // Add handler for Play Command
        commandCenter.playCommand.addTarget { event in
            FRadioPlayer.shared.play()
            return .success
        }
        
        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { event in
            FRadioPlayer.shared.pause()
            return .success
        }
        
        // Add handler for Toggle Command
        commandCenter.togglePlayPauseCommand.addTarget { event in
            FRadioPlayer.shared.togglePlaying()
            return .success
        }
        
        // Add handler for Next Command
        commandCenter.nextTrackCommand.addTarget { event in
            StationsManager.shared.setNext()
            return .success
        }
        
        // Add handler for Previous Command
        commandCenter.previousTrackCommand.addTarget { event in
            StationsManager.shared.setPrevious()
            return .success
        }
    }
    
    // MARK: - Activate Audio Session
    
    private func activateAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error {
            if Config.debugLog {
                print("audioSession could not be activated: \(error.localizedDescription)")
            }
        }
    }
}

