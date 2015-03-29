import UIKit

class SettingsViewController: UIViewController {

    let tableViewDelegate = SettingsViewControllerTableViewDelegate()
    let repositoryManager = PPNRepositoryManager.sharedInstance
    let UIGenerator = PPNUIGenerator.sharedInstance
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.view.alpha = 1.0
        tableViewDelegate.currentContinent = repositoryManager.currentAccount?.continent as? Int
        println(repositoryManager.currentAccount?.continent)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        navigationItem.titleView = UIGenerator.generateLogoText()
        self.view.addSubview(PPNUIGenerator.sharedInstance.sectionHeaderView("Where you poopin from?"))
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
        testB.layer.borderWidth = 2
        testB.layer.borderColor = UIColor.whiteColor().CGColor
        testB.setTitle("Save", forState: UIControlState.Normal)
        testB.addTarget(self, action: "saveContinent:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(testB)

    }
    
    private func createTableView() {
        var tableView = UITableView(frame: CGRect(x: 0.0, y: 150.0, width: self.view.frame.maxX, height: 300.0))
        tableView.registerNib(UINib(nibName: "PPNContinentSelectionTableViewCell", bundle: nil), forCellReuseIdentifier: "continentCell")
        
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDelegate
        tableView.scrollEnabled = false
        
        self.view.addSubview(tableView)
    }
    
    func saveContinent(sender:UIButton!) {
        repositoryManager.updateAccount(tableViewDelegate.currentContinent!)
        self.view.alpha = 0.0
        performSegueWithIdentifier("saveSettings", sender: self)
    }
}
