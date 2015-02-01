import UIKit

enum CELL_STATES : Int {
    case LOWER = -1
    case SAME = 0
    case HIGHER = 1
}

class PPNContinentStatsCellWhole : UIView {
    let UIGenerator = PPNUIGenerator.sharedInstance
    
    init(offset: Float) {
        super.init()
        self.frame = CGRectMake(0.0, CGFloat(offset), UIGenerator.maxY, 40.0)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}

class PPNContinentStatsCellLeft : UILabel {
    let UIGenerator = PPNUIGenerator.sharedInstance
    
    init(continentName: String) {
        super.init()
        self.frame = CGRectMake(20.0, 0.0, ((UIGenerator.maxY * 0.6) - 20.0), 40.0)
        self.text = continentName
        self.textAlignment = NSTextAlignment.Left
        self.textColor = UIColor.whiteColor()
        self.font = UIFont.boldSystemFontOfSize(20.0)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}

class PPNContinentStatsCellRight : UILabel {
    let UIGenerator = PPNUIGenerator.sharedInstance
    
    init(poopValue: Int, state: CELL_STATES) {
        super.init()
        self.frame = CGRectMake(((UIGenerator.maxY * 0.6) - 20.0), 0.0, ((UIGenerator.maxY * 0.4) - 20.0), 40.0)
        self.text = String(poopValue)
        self.textAlignment = NSTextAlignment.Right
        self.textColor = getCellColor(state)
        self.font = UIFont.boldSystemFontOfSize(25.0)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private func getCellColor(state: CELL_STATES) -> UIColor {
        switch state {
        case .LOWER:
            return UIColor.redColor()
        case .HIGHER:
            return UIColor.greenColor()
        default:
            return UIColor.whiteColor()
        }
        
    }
}


class PPNContinentStatsCell {
    private var name : String?
    private var viewOffset : Float?
    private var oldValue : Int?
    private var currentValue : Int?
    private var newValue : Int?
    private var leftCellPart : PPNContinentStatsCellLeft?
    private var rightCellPart : PPNContinentStatsCellRight?
    var wholeCell : PPNContinentStatsCellWhole?
    
    init(continentName: String, initialValue: Int, cellOffset: Float) {
        name = continentName
        currentValue  = initialValue
        viewOffset = cellOffset
        createAndReturnWholeCell()
    }
    
    func createAndReturnWholeCell() {
        leftCellPart = PPNContinentStatsCellLeft(continentName: name!)
        rightCellPart = PPNContinentStatsCellRight(poopValue: currentValue!, state: CELL_STATES.SAME)
        
        wholeCell = PPNContinentStatsCellWhole(offset: viewOffset!)
        wholeCell?.addSubview(leftCellPart!)
        wholeCell?.addSubview(rightCellPart!)
        
        println(rightCellPart!)
        
//        return wholeCell!
    }
    
    func updateValuesAndReturnNewCell(updatedValue: Int) {
        oldValue = currentValue
        newValue = updatedValue
        currentValue = newValue
        
        println("OLD: \(oldValue!)")
        println("New: \(newValue!)")
        
        var cellState = CELL_STATES.SAME
        
        if(oldValue! > currentValue!) {
            cellState = CELL_STATES.LOWER
        } else if (oldValue! < currentValue!) {
            cellState = CELL_STATES.HIGHER
        }
        
        println("STATE: \(cellState.rawValue)")
        
        rightCellPart?.removeFromSuperview()
        rightCellPart = PPNContinentStatsCellRight(poopValue: currentValue!, state: cellState)
        
        wholeCell?.addSubview(rightCellPart!)
        
        println(wholeCell?.subviews.count)
    }
}


class PPNPoopinViewController : UIViewController {
    var startingOffset : Float = 210.0
    let mainOffset : Float = 210.0
    
    var continentCells = [
        "Europe" : PPNContinentStatsCell(continentName: "Europe", initialValue: 200, cellOffset: 210.0),
        "N. America" : PPNContinentStatsCell(continentName: "N. America", initialValue: 200, cellOffset: 250.0),
        "S. America" : PPNContinentStatsCell(continentName: "S. America", initialValue: 200, cellOffset: 290.0),
        "Asia" : PPNContinentStatsCell(continentName: "Asia", initialValue: 200, cellOffset: 330.0),
        "Australia" : PPNContinentStatsCell(continentName: "Australia", initialValue: 200, cellOffset: 370),
        "Africa" : PPNContinentStatsCell(continentName: "Africa", initialValue: 200, cellOffset: 410.0)
    ]
    
    var liveStats : [String : AnyObject] =
    [
        "total" : 200,
        "continents" :
        ["Europe" : 200,
        "N. America" : 200,
        "S. America" : 200,
        "Asia" : 200,
        "Australia" : 200,
        "Africa" : 200]
    ]
    
    var liveStats2 : [String : AnyObject] =
    [
        "total" : 100,
        "continents" :
            ["Europe" : 150,
                "N. America" : 200,
                "S. America" : 250,
                "Asia" : 200,
                "Australia" : 200,
                "Africa" : 200]
    ]
    
    
    
    let repositoryManager = PPNRepositoryManager.sharedInstance
    let UIGenerator = PPNUIGenerator.sharedInstance
    var timerLabel : UILabel?
    var currentTime = 0
//    let tableViewDelegate = SettingsViewControllerTableViewDelegate()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        startingOffset = mainOffset
        println(startingOffset)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.02, green: 0.15, blue: 0.35, alpha: 1.0)
        createLogoView()
        createMainPoopinStatLabel()
        createTimerLabel()
        
        for (name, continentCell) in continentCells as [String: PPNContinentStatsCell] {
//            createContinentCell(continent as String, poopValue: poopValue as Int)
            self.view.addSubview(continentCell.wholeCell!)
        }
        
        createSettingsButton()
        
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true);
        
        var watchTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true);
    }
    
    func updateTime() {
        currentTime++
        
        timerLabel?.text = formatTime(currentTime)
    }
    
    func formatTime(time: Int) -> String {
        var minutes = time / 60
        var seconds = time % 60
        var secondsString = String(seconds)
        var minutesString = String(minutes)
        
        if (seconds < 10) {
            secondsString = "0\(seconds)"
        }
        
        if (minutes < 10) {
            minutesString = "0\(minutes)"
        }
        
        return "\(minutesString):\(secondsString)"
    }
    
    func update() {
        for (name, continentCell) in continentCells as [String: PPNContinentStatsCell] {
            //            createContinentCell(continent as String, poopValue: poopValue as Int)
            var randomInt = Int(arc4random_uniform(UInt32(4000))) + 1
            continentCell.updateValuesAndReturnNewCell(randomInt)
            //            self.view.addSubview(continentCell.wholeCell!)
        }
    }
    
    private func createLogoView() {
        UIGenerator.generateLogo(self, showSettings: false)
        self.view.addSubview(UIGenerator.logoView!)
        self.view.addSubview(UIGenerator.sectionHeaderView("Live poopin stats"))
    }
    
    func createMainPoopinStatLabel() {
        var view = UIView()
        view.frame = CGRectMake(0.0, 130.0, self.view.frame.maxX, 80.0)
//        view.backgroundColor = UIColor.redColor()
        
        var mainTextLabel = UILabel(frame: CGRectMake(0.0, 5.0, self.view.frame.maxX, 40.0))
        mainTextLabel.text = "200"
        mainTextLabel.textAlignment = NSTextAlignment.Center
        mainTextLabel.textColor = UIColor.whiteColor()
        mainTextLabel.font = UIFont.boldSystemFontOfSize(40.0)
        
        var subTextLabel = UILabel(frame: CGRectMake(0.0, 40.0, self.view.frame.maxX, 35.0))
        subTextLabel.text = "people are also poopin right now"
        subTextLabel.textAlignment = NSTextAlignment.Center
        subTextLabel.textColor = UIColor.whiteColor()
        subTextLabel.font = UIFont.boldSystemFontOfSize(15.0)
        
        view.addSubview(mainTextLabel)
        view.addSubview(subTextLabel)
        
        self.view.addSubview(view)
    }
    
    func createTimerLabel() {
        timerLabel = UILabel(frame: CGRectMake(0.0, 460.0, self.view.frame.maxX, 50.0))
        timerLabel!.text = "00:00"
        timerLabel!.textAlignment = NSTextAlignment.Center
        timerLabel!.textColor = UIColor.whiteColor()
        timerLabel!.font = UIFont.boldSystemFontOfSize(40.0)
        
        self.view.addSubview(timerLabel!)
    }
    
    private func createSettingsButton() {
        var testB = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        
        testB.frame = CGRectMake((self.view.frame.midX - 100.0), (self.view.frame.maxY - 45.0), 200.0, 35.0)
        testB.backgroundColor = UIColor.clearColor()
        testB.layer.cornerRadius = 5
        testB.layer.borderWidth = 3
        testB.layer.borderColor = UIColor.whiteColor().CGColor
        testB.setTitle("me no poopin", forState: UIControlState.Normal)
        testB.addTarget(self, action: "test:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(testB)
        
    }
    
    func test(sender:UIButton!) {
        for (name, continentCell) in continentCells as [String: PPNContinentStatsCell] {
            //            createContinentCell(continent as String, poopValue: poopValue as Int)
            continentCell.updateValuesAndReturnNewCell(100)
//            self.view.addSubview(continentCell.wholeCell!)
        }
    }
}