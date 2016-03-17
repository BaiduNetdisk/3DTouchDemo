//
//  AppDelegate.swift
//  3DTouchDemo
//
//  Created by sunyazhou on 16/3/4.
//  Copyright © 2016年 Baidu, Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    var launchedShortcutItem: UIApplicationShortcutItem?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        var shortcupShouldHandling = true
        
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsShortcutItemKey] as? UIApplicationShortcutItem {
            launchedShortcutItem = shortcutItem
            
            shortcupShouldHandling = false
            
            if let shortcutItems = application.shortcutItems where shortcutItems.isEmpty {
                let shortcut1 = UIMutableApplicationShortcutItem(type: "A", localizedTitle: "测试1", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .Search), userInfo:nil)
                
                let shortcut2 = UIMutableApplicationShortcutItem(type: "B", localizedTitle: "测试2", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .CapturePhoto), userInfo:nil)
                
                let shortcut3 = UIMutableApplicationShortcutItem(type: "C", localizedTitle: "测试3", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .Cloud), userInfo:nil)
                
                let shortcut4 = UIMutableApplicationShortcutItem(type: "D", localizedTitle: "测试4", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .Mail), userInfo:nil)
                application.shortcutItems = [shortcut1, shortcut2, shortcut3, shortcut4]
                
            }
        }
        
        
        
        return shortcupShouldHandling
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    //首次启动会调用
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        guard let shortcutItem  = launchedShortcutItem else { return }
        handleShortcutActionByType(shortcutItem)
        launchedShortcutItem = nil
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        let handled = handleShortcutActionByType(shortcutItem)
        completionHandler(handled)
    }
    
    /**
     处理快捷进入的函数
     
     - parameter shortcutItem: UIApplicationShortcutItem
     
     - returns: 是否处理
     */
    func handleShortcutActionByType(shortcutItem : UIApplicationShortcutItem) -> Bool{
        let result:Bool = true
        switch shortcutItem.type {
        case "A":
            let shortcutVC = ShortcutViewController(nibName: "ShortcutViewController", bundle: nil)
            NSLog("shortcut \(shortcutItem.localizedTitle)")
            if window?.rootViewController is UINavigationController {
                if let nvg = window?.rootViewController as? UINavigationController {
                    shortcutVC.title = shortcutItem.type
                    nvg.pushViewController(shortcutVC, animated: true)
                }
            }
        case "B":
            
            NSLog("shortcut \(shortcutItem.localizedTitle)")
            let shortcutVC = ShortcutViewController(nibName: "ShortcutViewController", bundle: nil)
            NSLog("shortcut \(shortcutItem.localizedTitle)")
            if window?.rootViewController is UINavigationController {
                if let nvg = window?.rootViewController as? UINavigationController {
                    shortcutVC.title = shortcutItem.type
                    nvg.pushViewController(shortcutVC, animated: true)
                }
            }
        case "C":
            NSLog("shortcut \(shortcutItem.localizedTitle)")
            let shortcutVC = ShortcutViewController(nibName: "ShortcutViewController", bundle: nil)
            NSLog("shortcut \(shortcutItem.localizedTitle)")
            if window?.rootViewController is UINavigationController {
                if let nvg = window?.rootViewController as? UINavigationController {
                    shortcutVC.title = shortcutItem.type
                    nvg.pushViewController(shortcutVC, animated: true)
                }
            }
        case "D":
            NSLog("shortcut \(shortcutItem.localizedTitle)")
            let shortcutVC = ShortcutViewController(nibName: "ShortcutViewController", bundle: nil)
            NSLog("shortcut \(shortcutItem.localizedTitle)")
            if window?.rootViewController is UINavigationController {
                if let nvg = window?.rootViewController as? UINavigationController {
                    shortcutVC.title = shortcutItem.type
                    nvg.pushViewController(shortcutVC, animated: true)
                }
            }
        default:
            return false
        }
        return result
        
    }
}

