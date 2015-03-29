import UIKit

class SettingsViewControllerTableViewDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    var repositoryManager: PPNRepositoryManager?
    var currentContinent: Int?
    
    struct Section {
        var title : String
    }
    
    struct Continent {
        var name : String
        var selected : Bool
    }
    
    let continents = [
        Continent(name: "Asia", selected: false),
        Continent(name: "Australia", selected: false),
        Continent(name: "Africa", selected: false),
        Continent(name: "Europe", selected: false),
        Continent(name: "North America", selected: false),
        Continent(name: "South America", selected: true)]
    
    let sections = [Section(title: "Choose your continent")]
    
    override init() {
        repositoryManager = PPNRepositoryManager.sharedInstance
        currentContinent = repositoryManager?.currentAccount?.continent as? Int
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continents.count
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 400, height: 40.0))
        
        view.backgroundColor = UIColor.blackColor()
        return view
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return PPNUIGenerator.sharedInstance.sectionHeaderView("Where you poopin from?")
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("continentCell", forIndexPath: indexPath) as! PPNContinentSelectionTableViewCell
        
        cell.textLabel?.text = continents[indexPath.row].name
        
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.row == currentContinent) {
            cell.setSelected(true, animated: false)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as! PPNContinentSelectionTableViewCell
        currentContinent = indexPath.row
        tableView.reloadData()
    }
    
    func saveContinent(sender:UIButton!)
    {
        repositoryManager?.updateAccount(currentContinent!)
        println("Button tappeddfdf")
    
    }
}