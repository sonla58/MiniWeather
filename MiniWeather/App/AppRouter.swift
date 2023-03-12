//
//  AppRouter.swift
//  MiniWeather
//
//  Created by Anh Son Le on 11/03/2023.
//

import SwiftUI

import CoreFeature

struct AppRouter<Content: View>: View {
    let content: Content
    
    @StateObject private var routePath = RoutePath.share
    
    init(content: Content) {
        self.content = content
    }
    
    init(@ViewBuilder builder: () -> Content) {
        self.content = builder()
    }

    var body: some View {
        _AppRouter(content: content)
            .environmentObject(routePath)
    }
}

private struct _AppRouter<Content: View>: View {
    @EnvironmentObject private var routePath: RoutePath
    
    let content: Content
    
    init(content: Content) {
        self.content = content
    }
    
    init(@ViewBuilder builder: () -> Content) {
        self.content = builder()
    }
    
    var body: some View {
        NavigationStack(path: $routePath.path) {
            content
                .navigationDestination(for: RouteDestination.self) { destination in
                    switch destination {
                    case .dashboard: DashboardView()
                    }
                }
                .sheet(item: $routePath.sheetPath) { destination in
                    switch destination {
                    case .dayDetail(let date, let weather): DayForecastView(date: date, dailyWeather: weather)
                    }
                }
        }
    }
}
