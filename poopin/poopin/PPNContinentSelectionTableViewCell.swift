import UIKit

class PPNContinentSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var poopEmoji: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.textLabel?.textColor = UIColor.whiteColor()
        self.backgroundColor = UIColor(red: 0.05, green: 0.40, blue: 0.60, alpha: 1.0)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        
//        println("here\(selected)")
        
        super.setSelected(selected, animated: animated)
        poopEmoji.hidden = !selected
    }
}
