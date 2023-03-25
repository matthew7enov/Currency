import UIKit

class CurrencyController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var didSelectCurrency: ((Currency) -> Void)?

    let currencies: [Currency] = [.usd, .byn, .eur, .rub]

    let idCell = "curCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension CurrencyController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
        cell.textLabel?.text = currencies[indexPath.row].name + currencies[indexPath.row].flag
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.popViewController(animated: true)
        didSelectCurrency?(currencies[indexPath.row])
    }
}
