import UIKit

class SettingsViewController: UIViewController {
    let tableViewDelegate = SettingsViewControllerTableViewDelegate()
    var repositoryManager : PPNRepositoryManager?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repositoryManager = PPNRepositoryManager()
        repositoryManager!.createAccount()
        createLogoView()
        createTableView()
        
        self.view.backgroundColor = UIColor(red: 0.05, green: 0.40, blue: 0.60, alpha: 1.0)
        
//        var button = UIButton()
//        button.buttonType
//        button.layer.borderColor = UIColor.redColor()
        
        
//        self.view.addSubview(<#view: UIView#>)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func createTableView() {
        var tableView = UITableView(frame: CGRect(x: 0.0, y: 100.0, width: self.view.frame.maxX, height: 330.0))
        tableView.registerNib(UINib(nibName: "PPNContinentSelectionTableViewCell", bundle: nil), forCellReuseIdentifier: "continentCell")
        
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDelegate
        tableView.scrollEnabled = false
        
        self.view.addSubview(tableView)
    }
    
    private func createLogoView() {
        self.view.addSubview(PPNUIGenerator.sharedInstance.logoView!)
    }
}
