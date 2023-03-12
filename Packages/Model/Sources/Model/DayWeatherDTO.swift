import Foundation

public struct DayWeatherDTO {
    public init(date: Date, lowTemperature: Double, highTemperature: Double, condition: String) {
        self.date = date
        self.lowTemperature = lowTemperature
        self.highTemperature = highTemperature
        self.condition = condition
    }
    
    public var date: Date
    public var lowTemperature: Double
    public var highTemperature: Double
    public var condition: String
}

extension DayWeatherDTO: Hashable {}

extension DayWeatherDTO: Equatable {}
