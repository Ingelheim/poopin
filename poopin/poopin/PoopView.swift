import UIKit

class UpdateableLabel : UILabel {
    
    init(initialValue: String, frame: CGRect) {
        super.init(frame: frame)
        self.text = initialValue
    }
    
    func setStyle(font: UIFont, color: UIColor, alignement: NSTextAlignment) {
        self.font = font
        self.textColor = color
        self.textAlignment = alignement
    }
    
    func updateValue(newValue: String) {
        self.text = newValue
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MainPoopinLabel : UpdateableLabel {
    override init(initialValue: String, frame: CGRect) {
        super.init(initialValue: initialValue, frame: frame)
        self.setStyle(UIFont(name: "Lato-Medium", size: 40)!, color: UIColor.whiteColor(), alignement: .Center)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ContinentPoopinLabel : UpdateableLabel {
    override init(initialValue: String, frame: CGRect) {
        super.init(initialValue: initialValue, frame: frame)
        self.setStyle(UIFont(name: "Lato-Light", size: 24)!, color: UIColor.whiteColor(), alignement: .Right)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ContinentPoopinName : UpdateableLabel {
    override init(initialValue: String, frame: CGRect) {
        super.init(initialValue: initialValue, frame: frame)
        self.setStyle(UIFont(name: "Lato-Light", size: 24)!, color: UIColor.whiteColor(), alignement: .Left)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ContinentCell : UIImageView {
    var valueLabel: ContinentPoopinLabel?
    var nameLabel: ContinentPoopinName?
    
    init(continentName: String, initialValue: String, yOffset: CGFloat, width: CGFloat) {
        super.init(frame: CGRectMake(20, yOffset, width - 40, 40))
        self.image = UIImage(named: "continent-background-clear")
        addContinentPoopinName(continentName, width: width)
        addContinentPoopinLabel(initialValue, width: (width - 80))
    }
    
    func addContinentPoopinLabel(initialValue: String, width: CGFloat) {
        valueLabel = ContinentPoopinLabel(initialValue: initialValue, frame: CGRectMake(self.frame.midX, 0, (width / 2) - 10, self.frame.height))
//        valueLabel?.backgroundColor = UIColor.redColor()
        
        self.addSubview(valueLabel!)
    }
    
    func addContinentPoopinName(name: String, width: CGFloat) {
        nameLabel = ContinentPoopinName(initialValue: name, frame: CGRectMake(10, 0, width / 2, self.frame.height))
        
        self.addSubview(nameLabel!)
    }
    
    func setActive() {
        self.image = UIImage(named: "continent-background-white")
        valueLabel!.textColor = UIColor(red: 0.192, green: 0.443, blue: 0.737, alpha: 1.0)
        nameLabel!.textColor = UIColor(red: 0.192, green: 0.443, blue: 0.737, alpha: 1.0)
    }
    
//    setactice
//    update value

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PoopView : PoopParent {
    var mainPoopinLabel : MainPoopinLabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flagImageView?.removeFromSuperview()
        createDoneButton()
        createMainPoopinLabel()
        createMainPoopinSubViewLabel()
        createContinentView()
    }
    
    func createDoneButton() {
        var doneButton = UIImageView(image: UIImage(named: "done"))
        doneButton.frame = CGRectMake(self.view.frame.midX - 104, self.view.frame.maxY - 110, 208, 57)
        doneButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("donePoopin")))
        doneButton.userInteractionEnabled = true
        
        self.view.addSubview(doneButton)
    }
    
    func donePoopin() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func createMainPoopinLabel() {
        mainPoopinLabel = MainPoopinLabel(initialValue: "3.456", frame: CGRectMake(0, 100, self.view.frame.width, 35))
        
        self.view.addSubview(mainPoopinLabel!)
    }
    
    func createMainPoopinSubViewLabel() {
        var mainPoopinSubViewLabel = UILabel(frame: CGRectMake(0, mainPoopinLabel!.frame.maxY, self.view.frame.width, 30))
        
        mainPoopinSubViewLabel.text = "people are poopin'"
        mainPoopinSubViewLabel.font = UIFont(name: "Lato-Light", size: 24)
        mainPoopinSubViewLabel.textColor = UIColor.whiteColor()
        mainPoopinSubViewLabel.textAlignment = .Center
        
        self.view.addSubview(mainPoopinSubViewLabel)
    }
    
    func createContinentView() {
        var asiaLabel = ContinentCell(continentName: "ASIA", initialValue: "300", yOffset: 190, width: self.view.frame.width)
        self.view.addSubview(asiaLabel)
        
        var africaLabel = ContinentCell(continentName: "AFRICA", initialValue: "300", yOffset: 230, width: self.view.frame.width)
        self.view.addSubview(africaLabel)
        
        var europeLabel = ContinentCell(continentName: "EUROPE", initialValue: "300", yOffset: 270, width: self.view.frame.width)
        self.view.addSubview(europeLabel)
        
        var australiaLabel = ContinentCell(continentName: "AUSTRALIA", initialValue: "300", yOffset: 310, width: self.view.frame.width)
        self.view.addSubview(australiaLabel)
        
        var nAmericaLabel = ContinentCell(continentName: "S. AMERICA", initialValue: "300", yOffset: 350, width: self.view.frame.width)
        self.view.addSubview(nAmericaLabel)
        
        var sAmericaLabel = ContinentCell(continentName: "N. AMERICA", initialValue: "300", yOffset: 390, width: self.view.frame.width)
        self.view.addSubview(sAmericaLabel)
        
        europeLabel.setActive()
    }
}