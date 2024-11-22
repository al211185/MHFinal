//
//  AppDelegate.swift
//  MonsterhIGH
//
//  Created by alumno on 11/8/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    class SceneDelegate: UIResponder, UIWindowSceneDelegate {
        
        var window: UIWindow?
        
        func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            
            // Crear la ventana
            let window = UIWindow(windowScene: windowScene)
            
            // Crear una instancia de ViewController (el ViewController inicial)
            let viewController = ViewController()  // Tu ViewController principal
            
            // Crear un UINavigationController con ViewController como root
            let navigationController = UINavigationController(rootViewController: viewController)
            
            // Establecer el rootViewController como el UINavigationController
            window.rootViewController = navigationController
            self.window = window
            window.makeKeyAndVisible()
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
        
        
    }
    
}
