import Foundation

struct CoinModel {
    let coin : String
    let currency : String
    let price : Double
    var priceString : String {
        return String(format: "%.1f", price)
    }
}
