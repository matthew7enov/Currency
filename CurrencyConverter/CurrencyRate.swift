import UIKit

struct CurrencyRate {
    var currency1: Currency
    var currency2: Currency
    var rate: Double
}

class Converter {
    let rates: [CurrencyRate] = [
        .init(currency1: .usd, currency2: .byn, rate: 1/2.57),
        .init(currency1: .usd, currency2: .eur, rate: 1/0.88),
        .init(currency1: .usd, currency2: .rub, rate: 1/75.98),
        
        .init(currency1: .byn, currency2: .rub, rate: 1/29.52),
        .init(currency1: .byn, currency2: .eur, rate: 1/0.34),
        
        .init(currency1: .eur, currency2: .rub, rate: 1/86.30)
    ]

    func convert(currency1: Currency, currency2: Currency, value: Double) -> Double {
        if currency1 == currency2 {
            return value
        } else if let rate = rates.first(where: { $0.currency1 == currency1 && $0.currency2 == currency2 })?.rate {
            return 1 / rate * value
        } else if let rate = rates.first(where: { $0.currency2 == currency1 && $0.currency1 == currency2 })?.rate {
            return rate * value
        } else {
            return 0
        }
    }
}
