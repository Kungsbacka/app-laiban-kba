//
//  LaibanKbaApp.swift
//  LaibanKba
//
//  Created by Tomas Green on 2022-09-16.
//

import SwiftUI
import Laiban
import Shout
import AppSettings

typealias LaibanSettings = AppSettings<AppConfig>
let isPreview:Bool = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != nil
let defaultLogger = Shout("Default")

@main struct LaibanKbaApp: App {
    @StateObject var appState = AppState()
    var body: some Scene {
        WindowGroup {
            appState.assistant.containerView {
                if appState.setupCompleted {
                    RootView()
                } else {
                    LBFullscreenContainer { p in
                        VStack {
                            Spacer()
                            Text("Håller på att göra mig redo, jag är snart klar!")
                                .frame(maxWidth:.infinity,alignment: .leading)
                                .padding(p.spacing[.m])
                                .font(p.font, ofSize: .n)
                                .primaryContainerBackground()
                        }
                    }
                    .actionBarButtons([])
                }
            }
            .environmentObject(appState)
            .environmentObject(appState.assistant)
        }
    }
}
