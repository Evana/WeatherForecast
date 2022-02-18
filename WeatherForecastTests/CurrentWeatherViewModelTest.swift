//
//  CurrentWeatherViewModelTest.swift
//  WeatherForecastTests
//
//  Created by Evana Islam on 18/3/21.
//

import XCTest
import Combine

@testable import WeatherForecast
class CurrentWeatherViewModelTest: XCTestCase {

    private var subscribers: Set<AnyCancellable>!
    var viewModel: CurrentWeatherViewModel?

    override func setUp() {
        super.setUp()
        viewModel = CurrentWeatherViewModel()
        subscribers = []
        viewModel?.onAppear()
        viewModel?.text = "Minto"
    }
    
    override func tearDown() {
        viewModel = nil
        subscribers = []
        super.tearDown()
    }
    
    func testLoadCurrentWeatherData() {
        var error: Error?
        var currentWeather: CurrentWeather?
        let expectation = self.expectation(description: "CurrentWeather")
        viewModel?.service.publisher(q: viewModel?.text ?? "")
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .finished: break
                case.failure(let failureError):
                    error = failureError
                }
                expectation.fulfill()
            } receiveValue: { [weak self] weather in
                currentWeather = weather
                self?.viewModel?.weathers.append(weather)
            }
            .store(in: &subscribers)
        waitForExpectations(timeout: 10)
        XCTAssertNil(error)
        XCTAssertEqual(currentWeather?.name, viewModel?.sortedWeathers.first?.name)
        XCTAssertEqual(currentWeather?.coordinate.latitute, viewModel?.sortedWeathers.first?.coordinate.latitute)
    }
    
    func testCurrentWeatherFailed() {
        viewModel?.text = "qqqq"
        var apiError: Response.Failure.Error?
        var currentWeather: CurrentWeather?
        let expectation = self.expectation(description: "CurrentWeather")
        viewModel?.service.publisher(q: viewModel?.text ?? "")
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion{
                case .finished: break
                case.failure(let failureError):
                    guard let fetchError = failureError as? Response.Error,
                          case let .failure(error) = fetchError
                    else {
                        return
                    }
                    apiError = error
                    self?.viewModel?.error = fetchError
                }
                expectation.fulfill()
            } receiveValue: { [weak self] weather in
                currentWeather = weather
                self?.viewModel?.weathers.append(weather)
            }
            .store(in: &subscribers)
        waitForExpectations(timeout: 10)
        
        XCTAssertNil(currentWeather)
        XCTAssertNotNil(viewModel?.error)
        XCTAssertNotNil(apiError)
        XCTAssertEqual(apiError?.message, "city not found")
    }

}
