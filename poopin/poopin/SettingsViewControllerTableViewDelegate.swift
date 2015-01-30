import UIKit

class SettingsViewControllerTableViewDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continents.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("continentCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = continents[indexPath.row].name
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor(red: 0.04, green: 0.32, blue: 0.52, alpha: 1.0)
        
        if continents[indexPath.row].selected {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
    }
}