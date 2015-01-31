import UIKit

class PPNMainMenuViewController : UIViewController {
    let repositoryManager = PPNRepositoryManager.sharedInstance
    let UIGenerator = PPNUIGenerator.sharedInstance
    @IBOutlet weak var didYouKnowTextLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.02, green: 0.15, blue: 0.35, alpha: 1.0)
        createLogoView()
        createDidYouKnow()
        createSettingsButton()
    }
    
    private func createLogoView() {
        UIGenerator.generateLogo(self, showSettings: true)
        self.view.addSubview(UIGenerator.logoView!)
        self.view.addSubview(UIGenerator.sectionHeaderView("Whats poopin?"))
    }
    
    private func createDidYouKnow() {
        didYouKnowTextLabel.text = "Digestion can take anywhere from 24 to 72 hours, during which time the food you’ve eaten travels down your esophagus to your stomach, then to your small intestine, your large intestine, and out through the anus."
        didYouKnowTextLabel.textColor = UIColor.whiteColor()
//        didYouKnowTextLabel.font = UIFont.boldSystemFontOfSize(30.0)
        
    }
    
    func goToSettings(sender:UIButton!)
    {
        println("Button tapped")
        performSegueWithIdentifier("goToSettings", sender: self)
        
    }
    
    
    private func createSettingsButton() {
        var testB = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        
        testB.frame = CGRectMake((self.view.frame.midX - 75.0), (self.view.frame.maxY - 45.0), 150.0, 35.0)
        testB.backgroundColor = UIColor.clearColor()
        testB.layer.cornerRadius = 5
        testB.layer.borderWidth = 3
        testB.layer.borderColor = UIColor.whiteColor().CGColor
        testB.setTitle("me poopin", forState: UIControlState.Normal)
//        testB.addTarget(self, action: "saveContinent:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(testB)
        
    }
}
