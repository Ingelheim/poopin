import UIKit

class PPNContinentSelectionTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.textLabel?.textColor = UIColor.whiteColor()
        self.backgroundColor = UIColor(red: 0.02, green: 0.15, blue: 0.35, alpha: 1.0)
        println(selected)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if(selected) {
            self.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            self.accessoryType = UITableViewCellAccessoryType.None
        }
    }
}
