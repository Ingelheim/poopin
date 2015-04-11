import UIKit

class MainView : UIView {
    var visualEffectView : UIVisualEffectView?
    
    func slideDown(view: UIView) {
        visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light)) as UIVisualEffectView
        var futureFrame = self.frame
        futureFrame.origin.y = 140;
        visualEffectView!.frame = self.frame
        visualEffectView!.alpha = 0.0
        view.addSubview(visualEffectView!)
        
        UIView.animateWithDuration(0.3, animations: {
            self.frame = futureFrame;
            self.visualEffectView!.frame = futureFrame
            self.visualEffectView!.alpha = 1.0
            })
    }
    
    func slideUp() {
        UIView.animateWithDuration(0.3, animations: {
            var frame = self.frame;
            frame.origin.y = 80;
            self.frame = frame;
            self.visualEffectView?.frame = frame
            self.visualEffectView?.alpha = 0.0
            }, completion: {
                (value: Bool) in
                    self.visualEffectView?.removeFromSuperview()
        })
    }
}

class PoopParent : UIViewController {
    var mainView : MainView?
    var expanded = false
    var flagImageView : UIImageView?
    var statisticsImageView : UIImageView?
    var overlayView : UIView?
    
    override func viewDidLoad() {
        createLogo()
        createContinentLabels()
        createMainView()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func createLogo() {
        var logoLabel = UILabel(frame: CGRectMake(0, 17, self.view.frame.width, 50))
        
        logoLabel.text = "poopin'"
        logoLabel.textAlignment = NSTextAlignment.Center
        
        logoLabel.font = UIFont(name: "Lato-Light", size: 40.0)
        logoLabel.textColor = UIColor(red: 0.192, green: 0.443, blue: 0.737, alpha: 1.0)
        
        self.view.addSubview(logoLabel)
    }
    
    func createMainView() {
        mainView = MainView(frame: CGRectMake(0, 80, self.view.frame.width, self.view.frame.height - 70))
        mainView!.backgroundColor = UIColor(red: 0.192, green: 0.443, blue: 0.737, alpha: 1.0)
        
        self.view.addSubview(mainView!)
    }
    
    func createContinentName(frame: CGRect, name: String) -> ContinentPoopinName {
        var continent = ContinentPoopinName(initialValue: name, frame: frame)
        continent.textColor = UIColor(red: 0.192, green: 0.443, blue: 0.737, alpha: 1.0)
        continent.font = UIFont(name: "Lato-Light", size: 20.0)
        
        return continent
    }
    
    func createContinentLabels() {
        var margin = (self.view.frame.width - (45 + 70 + 80 + 105 + 10)) / 4
        var asia = createContinentName(CGRectMake(margin, 85, 45, 25), name: "ASIA")
        var africa = createContinentName(CGRectMake(asia.frame.maxX + margin, 85, 70, 25), name: "AFRICA")
        var europe = createContinentName(CGRectMake(africa.frame.maxX + margin, 85, 80, 25), name: "EUROPE")
        europe.font = UIFont(name: "Lato-Medium", size: 20.0)
        var australia = createContinentName(CGRectMake(europe.frame.maxX + margin, 85, 105, 25), name: "AUSTRALIA")
        
        var nAmerica = createContinentName(CGRectMake(self.view.frame.midX - 112 - margin, 110, 112, 25), name: "N. AMERICA")
        var sAmerica = createContinentName(CGRectMake(self.view.frame.midX + margin, 110, 107, 25), name: "S. AMERICA")
        
        self.view.addSubview(asia)
        self.view.addSubview(africa)
        self.view.addSubview(europe)
        self.view.addSubview(australia)
        self.view.addSubview(nAmerica)
        self.view.addSubview(sAmerica)
    }
    
    func slide() {
        if expanded {
            self.flagImageView?.image = UIImage(named: "flag-empty")!
            mainView?.slideUp()
        } else {
            self.flagImageView?.image = UIImage(named: "flag-full")!
            mainView?.slideDown(self.view)
        }
        
        expanded = !expanded
    }
}