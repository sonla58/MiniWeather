//
//  File.swift
//  
//
//  Created by Anh Son Le on 11/03/2023.
//

import Foundation

#if canImport(WeatherKit)
import WeatherKit

extension DayWeatherDTO {
    @available(iOS 16.0, *)
    public init(from dayWeatherKit: DayWeather) {
        self.date = dayWeatherKit.date
        self.lowTemperature = dayWeatherKit.lowTemperature.value
        self.highTemperature = dayWeatherKit.highTemperature.value
        self.condition = dayWeatherKit.symbolName
    }
}
#endif
