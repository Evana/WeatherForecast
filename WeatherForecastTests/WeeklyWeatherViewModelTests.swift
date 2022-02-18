//
//  WeeklyWeatherViewModelTests.swift
//  WeatherForecastTests
//
//  Created by Evana Islam on 17/3/21.
//

import XCTest
import Combine

@testable import WeatherForecast
class WeeklyWeatherViewModelTests: XCTestCase {

    private var subscribers: Set<AnyCancellable>!
    var viewModel: WeeklyWeatherViewModel?

    override func setUp() {
        super.setUp()
        viewModel = WeeklyWeatherViewModel(weather: Mock.currentWeather)
        subscribers = []
        viewModel?.onAppear()
    }
    
    func testLoadWeeklyData() {
        var error: Error?
        var weeklyWeather: WeeklyWeather?
        let expectation = self.expectation(description: "WeeklyWeather")
        viewModel?.service.publisher(q: viewModel?.currentWeather.name ?? "")
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .finished: break
                case.failure(let failureError):
                    error = failureError
                }
                expectation.fulfill()
            } receiveValue: { weather in
                weeklyWeather = weather
            }
            .store(in: &subscribers)
        waitForExpectations(timeout: 2)
        XCTAssertNil(error)
        XCTAssertEqual(weeklyWeather?.city.name, viewModel?.weeklyWeather?.city.name)
        XCTAssertEqual(weeklyWeather?.city.coordinate.latitute, viewModel?.weeklyWeather?.city.coordinate.latitute)
        XCTAssertEqual(weeklyWeather?.city.name, "Minto")
    }
    
    func testWeeklyWeatherFailed() {
        var apiError: Response.Failure.Error?
        var weeklyWeather: WeeklyWeather?
        let expectation = self.expectation(description: "WeeklyWeather")
        viewModel?.service.publisher(q: "qqqq")
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .finished: break
                case.failure(let failureError):
                    guard let fetchError = failureError as? Response.Error,
                          case let .failure(error) = fetchError
                    else {
                        return
                    }
                    apiError = error
                }
                expectation.fulfill()
            } receiveValue: { weather in
                weeklyWeather = weather
            }
            .store(in: &subscribers)
        waitForExpectations(timeout: 10)
        
        XCTAssertNil(weeklyWeather)
        XCTAssertNotNil(apiError)
        XCTAssertEqual(apiError?.message, "city not found")
    }

}
