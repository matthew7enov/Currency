
import UIKit
import Foundation

class ConverterController: UIViewController {
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!

    let converter = Converter()
    var currency1: Currency = .byn {
        didSet {
            Button1.setTitle(currency1.flag + currency1.name, for: .normal)
        }
    }
    var currency2: Currency = .usd {
        didSet {
            Button2.setTitle(currency2.flag + currency2.name, for: .normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        textField1.text = "1"
        if let value = Double(textField1.text ?? "") {
            textField2.text = String(round(converter.convert(currency1: currency1, currency2: currency2, value: value) * 100) / 100)
        }
        Button1.setTitle(currency1.flag + currency1.name, for: .normal)
        Button2.setTitle(currency2.flag + currency2.name, for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "segue1":
            let vc = segue.destination as? CurrencyController
            vc?.didSelectCurrency = { [weak self] currency in
                self?.currency1 = currency
                if let num1 = Double(self!.textField1.text ?? "") {
                    self!.textField2.text = String(round(self!.converter.convert(currency1: self!.currency1, currency2: self!.currency2, value: num1) * 100) / 100)
                }
            }
        case "segue2":
            let vc = segue.destination as? CurrencyController
            vc?.didSelectCurrency = { [weak self] currency in
                self?.currency2 = currency
                if let num2 = Double(self!.textField2.text ?? "") {
                    self!.textField1.text = String(round(self!.converter.convert(currency1: self!.currency2, currency2: self!.currency1, value: num2) * 100) / 100 )
                }
            }
        default: break
        }
    }

    @IBAction func testField1DidEdit(_ sender: Any) {
        if let num1 = Double(textField1.text ?? "") {
            textField2.text = String(round(converter.convert(currency1: currency1, currency2: currency2, value: num1) * 100) / 100)
        }
    }

    @IBAction func testField2DidEdit(_ sender: Any) {
        if let num2 = Double(textField2.text ?? "") {
            textField1.text = String(round(converter.convert(currency1: currency2, currency2: currency1, value: num2) * 100) / 100)
        }
    }
}

