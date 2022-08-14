import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoinPrice(_ coinManager: CoinManager, coin: CoinModel)
    func didFailWithCoin(error : Error)
}

struct CoinManager {
    
    var delegate : CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "D54B151F-90C2-4E9E-BE9E-DA8BE73E1343"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    /*
    FULL URL:
     https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=D54B151F-90C2-4E9E-BE9E-DA8BE73E1343
    URL EXPLANATION:
    baseURL     ->  https://rest.coinapi.io/v1/exchangerate/BTC
    forCurrency ->  /USD
    apiKey      ->  ?apikey=D54B151F-90C2-4E9E-BE9E-DA8BE73E1343
    */
    func getCoinPrice(for currency : String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String){
        // 1. Create a URL
        if let url = URL(string: urlString){
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            // 3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    if let safedata = data {
                        if let coin = self.parseJSON(coinData : safedata){
                            delegate?.didUpdateCoinPrice(self, coin: coin)
                        }
                    }
                    return
                }
                delegate?.didFailWithCoin(error: error!)
            }
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(coinData : Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let coin = CoinModel(
                coin: decodedData.asset_id_base,
                currency: decodedData.asset_id_quote,
                price: decodedData.rate
            )
            return coin
        }catch{
            delegate?.didFailWithCoin(error: error)
        }
        return nil
    }
    
}
