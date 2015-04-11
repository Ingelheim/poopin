import UIKit

class StatsViewWrapper : UIImageView {
    var labels : [UILabel] = [UILabel(), UILabel(), UILabel()]
    var labelColor: UIColor!
    
    init(name: String, color: UIColor, addSublabel: Bool) {
        super.init(image: UIImage(named: name))
        labelColor = color
        addLabelWithSublabel(0, yOffset: 96, labelString: "avg. time", addSublabel: addSublabel)
        addLabelWithSublabel(1, yOffset: 173, labelString: "times / day", addSublabel: addSublabel)
        addLabelWithSublabel(2, yOffset: 250, labelString: "today", addSublabel: addSublabel)
        
        setAvTimeLabel("00:00")
        setTmAverageLabel("0.0x")
        setTmDayLabel("0.0x")
    }
    
    func lightLabelWithFontSizeAndFrame(size: CGFloat, frame: CGRect) -> UILabel {
        var label = UILabel()
        label.frame = frame
        label.font = UIFont(name: "Lato-Light", size: size)
        label.textColor = labelColor
        label.textAlignment = NSTextAlignment.Center
        
        return label
    }
    
    func addLabelWithSublabel(index: Int, yOffset: CGFloat, labelString: String, addSublabel: Bool) {
        var label = lightLabelWithFontSizeAndFrame(26, frame: CGRectMake(0 , yOffset, self.frame.width, 25))
        labels[index] = label
        self.addSubview(label)
        
        if addSublabel {
            var subLabel = lightLabelWithFontSizeAndFrame(18, frame: CGRectMake(0 , label.frame.maxY, self.frame.width, 25))
            subLabel.text = labelString
             self.addSubview(subLabel)
        }
    }
    
    func setAvTimeLabel(time: String) {
        labels[0].text = time
    }
    
    func setTmAverageLabel(time: String) {
        labels[1].text = time
    }
    
    func setTmDayLabel(time: String) {
        labels[2].text = time
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class StatsView : PoopParent {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addOwnStatsWrapper()
        addOtherStatsWrapper()
    }
    
    func addOwnStatsWrapper() {
        var ownStatsWrapper = StatsViewWrapper(name: "own-stats", color: UIColor(red: 0.192, green: 0.443, blue: 0.737, alpha: 1.0), addSublabel: true)
        
        ownStatsWrapper.frame = CGRectMake(self.view.frame.midX - 130, self.view.frame.height / 4, 110, 317)
        
        
        self.view.addSubview(ownStatsWrapper)
    }
    
    func addOtherStatsWrapper() {
        var otherStatsWrapper = StatsViewWrapper(name: "other-stats", color: UIColor.whiteColor(), addSublabel: false)
        
        otherStatsWrapper.frame = CGRectMake(self.view.frame.midX + 20, self.view.frame.height / 4, 110, 317)
        
        
        self.view.addSubview(otherStatsWrapper)
    }
}