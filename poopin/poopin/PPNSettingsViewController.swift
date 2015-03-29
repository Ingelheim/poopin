import UIKit

class SettingsViewController: UIViewController {

    let tableViewDelegate = SettingsViewControllerTableViewDelegate()
    let repositoryManager = PPNRepositoryManager.sharedInstance
    let UIGenerator = PPNUIGenerator.sharedInstance
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableViewDelegate.currentContinent = repositoryManager.currentAccount?.continent as? Int
        println(repositoryManager.currentAccount?.continent)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.02, green: 0.15, blue: 0.35, alpha: 1.0)
        createLogoView()
        createTableView()
        createSaveButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func createSaveButton() {
        var testB = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        testB.frame = CGRectMake((self.view.frame.midX - 50.0), (self.view.frame.maxY - 45.0), 100.0, 35.0)
        testB.backgroundColor = UIColor.clearColor()
        testB.layer.cornerRadius = 5
        testB.layer.borderWidth = 3
        testB.layer.borderColor = UIColor.whiteColor().CGColor
        testB.setTitle("Save", forState: UIControlState.Normal)
        testB.addTarget(self, action: "saveContinent:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(testB)

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
        UIGenerator.generateLogo(self, showSettings: false)
        self.view.addSubview(UIGenerator.logoView!)
    }
    
    func saveContinent(sender:UIButton!)
    {
        println("Button tapped")
        repositoryManager.updateAccount(tableViewDelegate.currentContinent!)
        performSegueWithIdentifier("saveSettings", sender: self)
        
    }
}
