import UIKit

class PPNMainMenuViewController : UIViewController {
    let repositoryManager = PPNRepositoryManager.sharedInstance
    let UIGenerator = PPNUIGenerator.sharedInstance
    @IBOutlet weak var didYouKnowTextLabel: UILabel!
    
    @IBAction func settingsButtonClicked(sender: AnyObject) {
        self.view.alpha = 0.0
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
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
        createStatisticsView()
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
        testB.layer.borderWidth = 2
        testB.layer.borderColor = UIColor.whiteColor().CGColor
        testB.setTitle("me poopin", forState: UIControlState.Normal)
        testB.addTarget(self, action: "startPoopin:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(testB)
    }
    
    private func createStatisticsView() {
        createUserLabel()
        createWorldLabel()
        createWatchLabel()
        createCalendarLabel()
        createUserWatchLabel()
        createWorldWatchLabel()
        createUserCalendarLabel()
        createWorldCalendarLabel()
    }
    
    private func createUserLabel() {
        var maxHeight = (self.view.frame.height) / 4
        
        
        
        var userImageView = UIImageView(frame: CGRectMake((((self.view.frame.width / 4) * 3) / 2) - 10, maxHeight + 10, 40, 40))
        userImageView.image = UIImage(named: "user")
        
        self.view.addSubview(userImageView)
    }
    
    private func createWorldLabel() {
        var maxHeight = (self.view.frame.height) / 4
        
        var userImageView = UIImageView(frame: CGRectMake(((self.view.frame.width / 4) * 3) - 10 , maxHeight + 10, 40, 40))
        userImageView.image = UIImage(named: "globe")
        
        self.view.addSubview(userImageView)
    }
    
    private func createWatchLabel() {
        var maxHeight = (self.view.frame.height) / 4
        
        var userImageView = UIImageView(frame: CGRectMake(20 , maxHeight + 80, 40, 40))
        userImageView.image = UIImage(named: "clock")
        
        self.view.addSubview(userImageView)
    }
    
    private func createCalendarLabel() {
        var maxHeight = (self.view.frame.height) / 4
        
        var userImageView = UIImageView(frame: CGRectMake(20 , maxHeight + 160, 40, 40))
        userImageView.image = UIImage(named: "calendar")
        
        self.view.addSubview(userImageView)
    }
    
    private func createUserWatchLabel() {
        var maxHeight = (self.view.frame.height) / 4
        
        var label = UILabel(frame: CGRectMake(((self.view.frame.width / 4) * 3) - 20 , maxHeight + 70, 60, 60))
        label.textAlignment = NSTextAlignment.Center
        label.text = "00:00"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "Lato-Regular", size: 20.0)
        
        self.view.addSubview(label)
    }
    
    private func createWorldWatchLabel() {
        var maxHeight = (self.view.frame.height) / 4
        
        var label = UILabel(frame: CGRectMake(((self.view.frame.width / 4) * 3 / 2) - 20 , maxHeight + 70, 60, 60))
        label.textAlignment = NSTextAlignment.Center
        label.text = "00:00"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "Lato-Regular", size: 20.0)
        
        self.view.addSubview(label)
    }
    
    private func createUserCalendarLabel() {
        var maxHeight = (self.view.frame.height) / 4
        
        var label = UILabel(frame: CGRectMake(((self.view.frame.width / 4) * 3 / 2) - 20 , maxHeight + 150, 60, 60))
        label.textAlignment = NSTextAlignment.Center
        label.text = "10.5x"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "Lato-Regular", size: 20.0)
        
        self.view.addSubview(label)
    }
    
    private func createWorldCalendarLabel() {
        var maxHeight = (self.view.frame.height) / 4
        
        var label = UILabel(frame: CGRectMake(((self.view.frame.width / 4) * 3) - 20 , maxHeight + 150, 60, 60))
        label.textAlignment = NSTextAlignment.Center
        label.text = "10.5x"
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "Lato-Regular", size: 20.0)
        
        self.view.addSubview(label)
    }
}
