//
//  MiniWeatherApp.swift
//  MiniWeather
//
//  Created by Anh Son Le on 10/03/2023.
//

import SwiftUI

@main
struct MiniWeatherApp: App {
    var repositoryInjector: DIInjector = RepositoryInjector()
    
    init() {
        repositoryInjector.register()
    }
    
    var body: some Scene {
        WindowGroup {
            AppRouter {
                DashboardView()
            }
            .provideDependencies()
        }
    }
}
