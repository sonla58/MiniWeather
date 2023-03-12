//
//  File.swift
//  
//
//  Created by Anh Son Le on 11/03/2023.
//

import WeatherKit
import CoreLocation

import Model

struct WeatherKitService: WeatherRepository {
    func weather(from startDate: Date, to endDate: Date, in location: CLLocation) async throws -> [DayWeatherDTO] {
        let weather = try await WeatherService.shared.weather(for: location, including: .daily(startDate: startDate, endDate: endDate))
        return weather.forecast.map {
            DayWeatherDTO(from: $0)
        }
    }
    
//    func weather(for location: CLLocation, date: Date) async throws {
//        let weather = WeatherService.shared.weather(for: location, including: .availability)
//        weather.alertAvailability
//    }
}
