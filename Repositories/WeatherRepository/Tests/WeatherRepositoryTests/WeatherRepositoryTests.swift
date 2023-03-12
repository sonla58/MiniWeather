import XCTest
@testable import WeatherRepository

import CoreLocation

final class WeatherRepositoryTests: XCTestCase {
    func testMock() {
        let mock = Mock()
        let startDate = Date()
        let endDate = startDate.addingTimeInterval(86400 * 5)
        let location = CLLocation(latitude: 0, longitude: 0)
        let expectation = XCTestExpectation(description: "WeatherRepositoryTests")
        Task {
            do {
                let weathers = try await mock.weather(from: startDate, to: endDate, in: location)
                XCTAssertEqual(weathers.count, 5)
                expectation.fulfill()
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
        wait(for: [expectation], timeout: 10)
    }
}
