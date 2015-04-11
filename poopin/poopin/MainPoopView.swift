import UIKit

class MainPoopView : PoopParent {

    var infoImageView : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createInfoView()
        createStatisticsView()
        createPoopinButton()
        createFlagView()
        addDidYouKnow()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func createInfoView() {
        infoImageView = UIImageView(image: UIImage(named: "info"))
        infoImageView!.frame = CGRectMake(self.view.frame.midX - 20, self.view.frame.height / 3, 40, 40)
        
        self.view.addSubview(infoImageView!)
    }
    
    func createPoopinButton() {
        var poopinButton = UIImageView(image: UIImage(named: "poopin"))
        poopinButton.frame = CGRectMake(self.view.frame.midX - 104, self.view.frame.maxY - 110, 208, 57)
        poopinButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("startPoopin")))
        poopinButton.userInteractionEnabled = true
        
        self.view.addSubview(poopinButton)
    }
    
    func createFlagView() {
        flagImageView = UIImageView(image: UIImage(named: "flag-empty"))
        flagImageView!.frame = CGRectMake(30, 30, 25, 30)
        flagImageView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("slide")))
        flagImageView!.userInteractionEnabled = true
        
        self.view.addSubview(flagImageView!)
    }
    
    func createStatisticsView() {
        statisticsImageView = UIImageView(image: UIImage(named: "line-chart"))
        statisticsImageView!.frame = CGRectMake(self.view.frame.maxX - 60, 30, 30, 30)
        statisticsImageView!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("goToStatistics")))
        statisticsImageView!.userInteractionEnabled = true
        
        self.view.addSubview(statisticsImageView!)
    }
    
    func startPoopin() {
        performSegueWithIdentifier("startPoopin", sender: self)
    }
    
    func goToStatistics() {
        performSegueWithIdentifier("goToStatistics", sender: self)
    }
    
    func addDidYouKnow() {
        var didYouKnowLabel = UILabel(frame: CGRectMake(15, infoImageView!.frame.maxY + 5, self.view.frame.width - 30, 70))
        didYouKnowLabel.text = "Sloths only poop once a week and it's called the poo dance"
        didYouKnowLabel.textAlignment = NSTextAlignment.Center
        didYouKnowLabel.numberOfLines = 0
        
        didYouKnowLabel.font = UIFont(name: "Lato-Light", size: 24.0)
        didYouKnowLabel.textColor = UIColor.whiteColor()
        
        self.view.addSubview(didYouKnowLabel)
    }
}