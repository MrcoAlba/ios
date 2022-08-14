import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherBrain = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        
        searchTextField.delegate = self
        weatherBrain.delegate = self
    }
    
}

//MARK: - UITextFieldDelegate

extension WeatherViewController : UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Numero 1")
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Numero 2")
        if textField.text == "" {
            textField.placeholder = "Please type something"
            return false
        }else{
            textField.placeholder = "Search"
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Numero 3")
        weatherBrain.fetchWeather(cityName: textField.text!)
        textField.text = ""
    }
}

//MARK: - WeatherViewController

extension WeatherViewController : WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager ,_ weather : WeatherModel) {
        DispatchQueue.main.async {
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(_ error: Error?){
        print("DIOSSSSSS ERRORRRRRRRR")
        if let errorNow = error {
            print(errorNow)
        }
    }
}


//MARK: - CLLocationManagerDelegate

extension WeatherViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.description)
        if let lastLocation = locations.last {
            
            weatherBrain.fetchWeather(
                latitude : lastLocation.coordinate.latitude,
                longitude : lastLocation.coordinate.longitude
            )
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("ERRORRRRRRRRRR CLLocationManagerDelegate")
        print(error)
    }
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
}
