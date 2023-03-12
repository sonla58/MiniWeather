//
//  RepositoryInjector.swift
//  MiniWeather
//
//  Created by Anh Son Le on 13/03/2023.
//

import Foundation

import WeatherRepository
import DI

protocol DIInjector {
    func register()
}

struct RepositoryInjector: DIInjector {
    func register() {
        DIContainer.register(WeatherRepository.self) {
            WeatherRepositoryFactory.mock()
        }
    }
}
