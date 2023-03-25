
import UIKit

struct Currency: Equatable {
    static let usd = Currency.init(name: "USD", flag: "🇺🇸")
    static let byn = Currency.init(name: "BYN", flag: "🇧🇾")
    static let eur = Currency.init(name: "EUR", flag: "🇪🇺")
    static let rub = Currency.init(name: "RUB", flag: "🇷🇺")
    
    var name: String
    var flag: String
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.flag == rhs.flag && lhs.name == rhs.name
    }
}
