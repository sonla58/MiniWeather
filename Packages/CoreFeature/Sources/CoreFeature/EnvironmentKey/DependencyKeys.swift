//
//  File.swift
//  
//
//  Created by Anh Son Le on 12/03/2023.
//

import SwiftUI

import WeatherRepository

private struct WeatherRepositoryKey: EnvironmentKey {
    static let defaultValue = WeatherRepositoryFactory.make()
}

public extension EnvironmentValues {
    var weatherRepository: WeatherRepository {
      get { self[WeatherRepositoryKey.self] }
      set { self[WeatherRepositoryKey.self] = newValue }
    }
}
