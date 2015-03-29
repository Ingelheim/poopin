import UIKit

class PPNMainMenuViewController : UIViewController {
    let repositoryManager = PPNRepositoryManager.sharedInstance
    let UIGenerator = PPNUIGenerator.sharedInstance
    @IBOutlet weak var didYouKnowTextLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.view.alpha = 1.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        navigationItem.titleView = UIGenerator.generateLogoText()
        self.view.addSubview(PPNUIGenerator.sharedInstance.sectionHeaderView("What's poopin?"))
        createSettingsButton()
    }
    
    func goToSettings(sender:UIButton!) {
        self.view.alpha = 0.0
        performSegueWithIdentifier("goToSettings", sender: self)
    }
    
    func startPoopin(sender:UIButton!) {
        self.view.alpha = 0.0
        performSegueWithIdentifier("poopinSegue", sender: self)
    }
    
    private func createSettingsButton() {
        var testB = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        
        testB.frame = CGRectMake((self.view.frame.midX - 75.0), (self.view.frame.maxY - 45.0), 150.0, 35.0)
        testB.backgroundColor = UIColor.clearColor()
        testB.layer.cornerRadius = 5
        testB.layer.borderWidth = 3
        testB.layer.borderColor = UIColor.whiteColor().CGColor
        testB.setTitle("me poopin", forState: UIControlState.Normal)
        testB.addTarget(self, action: "startPoopin:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(testB)
    }
}
