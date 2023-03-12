//
//  DependencyProvider.swift
//  MiniWeather
//
//  Created by Anh Son Le on 12/03/2023.
//

import SwiftUI

import CoreFeature
import WeatherRepository

struct DependencyProvider: ViewModifier {
    func body(content: Content) -> some View {
        content
            .environment(\.weatherRepository, WeatherRepositoryFactory.make())
    }
}

extension View {
    func provideDependencies() -> some View {
        modifier(DependencyProvider())
    }
}
