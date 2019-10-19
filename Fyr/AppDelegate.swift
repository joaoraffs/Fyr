//
//  AppDelegate.swift
//  Fyr
//
//  Created by João Raffs on 19/10/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()

        Messaging.messaging().delegate = self
        

        if #available(iOS 10.0, *){
            UNUserNotificationCenter.current().delegate = self as! UNUserNotificationCenterDelegate
             let option : UNAuthorizationOptions = [.alert, .badge, .sound]
            
             UNUserNotificationCenter.current().requestAuthorization(options: option) { (bool, error) in
            
                }
        }else{
            let settings: UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        application.registerForRemoteNotifications()
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        let pushManager = PushNotificationManager(userID: "oLo32swP1kcLpoV7pFUCjig3dg22")
        pushManager.registerForPushNotifications()
        
//        Model.instance.retrievesFromUserDefault()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
            let firebaseAuth = Auth.auth()
            firebaseAuth.setAPNSToken(deviceToken, type: AuthAPNSTokenType.unknown)
            
        }
        
        
        func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
            let firebaseAuth = Auth.auth()
            if (firebaseAuth.canHandleNotification(userInfo)){
                print(userInfo)
                return
            }
        }
        
        func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
            print("my token:\(fcmToken)")
        }
        
        func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
            
        }
        
        
    //    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data){
    ////        print("token : \(token)")
    //    }
    //
    //    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    //        <#code#>
    //    }

        func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
        {
            completionHandler([.alert, .badge, .sound])
        }


}

