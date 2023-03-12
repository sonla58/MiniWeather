//
//  File.swift
//  
//
//  Created by Anh Son Le on 11/03/2023.
//

import CoreLocation

import Model
struct Mock: WeatherRepository {
    func weather(from startDate: Date, to endDate: Date, in location: CLLocation) async throws -> [DayWeatherDTO] {
        let dates = stride(from: startDate, to: endDate, by: 86400).map { $0 }
        let colectionCondition = ["cloud.sun.fill", "smoke.fill", "cloud.rain.fill", "cloud.snow.fill", "sun.min.fill"]
        let weathers = dates.map {
            DayWeatherDTO(date: $0,
                          lowTemperature: Double.random(in: 5...10),
                          highTemperature: Double.random(in: 15...25),
                          condition: colectionCondition.randomElement() ?? "clear")
            
        }
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return weathers
    }
}
