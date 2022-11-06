//
//  ProductAppApp.swift
//  ProductApp
//
//  Created by InApp on 05/11/22.
//

import SwiftUI

@main
struct ProductAppApp: App {
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            
            ProductListView()
        }
        .onChange(of: scenePhase) { (newScenePhase) in
             switch newScenePhase {
             case .active:
                 
                 print("scene is now active!")
             case .inactive:
                 print("scene is now inactive!")
             case .background:
                 print("scene is now in the background!")
             @unknown default:
                 print("Apple must have added something new!")
             }
         }
     }
 }

