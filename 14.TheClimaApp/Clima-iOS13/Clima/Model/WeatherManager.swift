import Foundation
import UIKit
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager ,_ weather : WeatherModel)
    func didFailWithError(_ error: Error?)
}

struct WeatherManager {
    
    var delegate : WeatherManagerDelegate?
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=86550e3c4792b999768014346e245c1a&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString: urlString)
    }
    
    
    func performRequest(urlString : String){
        // 1. Create a URL
        if let url = URL(string: urlString) {
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            // 3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    if let safeData = data {
                        if let weather = self.parseJSON(weatherdata: safeData) {
                            // print(dataString)
                            print("ANTES DE QUE CONOZCA AL DELEGATE")
                            delegate?.didUpdateWeather(self, weather)
                        }
                    }
                    return
                }
                delegate?.didFailWithError(error)
            }
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherdata: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherdata)
            let weather = WeatherModel(
                conditionId: decodedData.weather[0].id,
                cityName: decodedData.name,
                temperature: decodedData.main.temp
            )
            print(weather.conditionName)
            return weather
        } catch {
            delegate?.didFailWithError(error)
        }
        return nil
    }
    
}

