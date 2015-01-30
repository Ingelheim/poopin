import UIKit

class SettingsViewController: UIViewController {
    let tableViewDelegate = SettingsViewControllerTableViewDelegate()
    var repositoryManager : PPNRepositoryManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repositoryManager = PPNRepositoryManager()
        repositoryManager!.createAccount()
        
        var tableView = UITableView(frame: CGRect(x: 0.0, y: 100.0, width: self.view.frame.maxX, height: 400.0))
        tableView.registerNib(UINib(nibName: "PPNContinentSelectionTableViewCell", bundle: nil), forCellReuseIdentifier: "continentCell")

        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDelegate
        tableView.scrollEnabled = false

        self.view.addSubview(tableView)
        self.view.addSubview(PPNUIGenerator.sharedInstance.logoView!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
