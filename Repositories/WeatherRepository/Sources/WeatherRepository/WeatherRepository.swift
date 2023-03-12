import Foundation
import CoreLocation

import Model

public protocol WeatherRepository {
    func weather(from startDate: Date, to endDate: Date, in location: CLLocation) async throws -> [DayWeatherDTO]
}

// Factory create mock repository
public struct WeatherRepositoryFactory {
    public static func make() -> WeatherRepository {
        WeatherKitService()
    }
    
    public static func mock() -> WeatherRepository {
        Mock()
    }
}
