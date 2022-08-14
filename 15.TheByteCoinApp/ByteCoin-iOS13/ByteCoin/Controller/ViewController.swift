import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var QuantityLabel: UILabel!
    @IBOutlet weak var CurrencyLabel: UILabel!
    @IBOutlet weak var CurrencyPicker: UIPickerView!
    
    var coinMaganer = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UIPickerViewDataSource
        CurrencyPicker.dataSource = self
        // UIPickerViewDelegate
        CurrencyPicker.delegate = self
        // CoinManagerDelegate
        coinMaganer.delegate = self
    }
}

// MARK: UIPickerViewDataSource

extension ViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinMaganer.currencyArray.count
    }
}

// MARK: UIPickerViewDelegate

extension ViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinMaganer.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinMaganer.currencyArray[row]
        coinMaganer.getCoinPrice(for: selectedCurrency)
    }
}

// MARK: CoinManagerDelegate

extension ViewController : CoinManagerDelegate {
    func didUpdateCoinPrice(_ coinManager: CoinManager, coin: CoinModel) {
        DispatchQueue.main.async {
            self.QuantityLabel.text = coin.priceString
            self.CurrencyLabel.text = coin.currency
        }
    }
    
    func didFailWithCoin(error: Error) {
        print("ERROROOOOOOOOOOOO")
        print(error)
    }
    
    
}
