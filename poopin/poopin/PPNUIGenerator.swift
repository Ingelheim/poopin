import UIKit
import Foundation

class PPNUIGenerator {
    var maxX : CGFloat = 0.0
    var maxY : CGFloat =  0.0
    var logoNavBarFrame : CGRect?
    var sectionHeaderFrame : CGRect?
    
    var screenSize: CGRect = UIScreen.mainScreen().bounds
    
    private var logoTextView : UILabel?
    private var logoBackgroundView : UIView?
    
    var logoView : UIView?
    
    private var sharedSpec : [String: AnyObject] =
    [
        "height" : CGFloat(35.0)
    ]
    
    private var logoBackgroundSpec : [String: AnyObject] =
    [
        "backgroundColor" : UIColor(red: 0.02, green: 0.15, blue: 0.35, alpha: 1.0)
        
    ]
    
    private var logoSpec : [String: AnyObject] =
    [
        "text" : "poopin",
        "fontSize" : 40.0,
        "textColor" : UIColor.whiteColor()
        
    ]
    
    private var sectionHeaderSpec : [String: AnyObject] =
    [
        "backgroundColor" : UIColor(red: 0.02, green: 0.30, blue: 0.45, alpha: 1.0)
        
    ]
    
    class var sharedInstance :PPNUIGenerator {
        struct Singleton {
            static let instance =
            PPNUIGenerator()
        }
        
        return Singleton.instance
    }
    
    init() {
        generateLogo()
    }
    
    private func generateFrame() {
        maxX = CGFloat(screenSize.height)
        maxY = CGFloat(screenSize.width)
        
        logoNavBarFrame = CGRect(x: 0.0, y: 0.0, width: 100, height: sharedSpec["height"] as! CGFloat)
        
        sectionHeaderFrame = CGRect(x: 0.0, y: 64.0, width: maxY, height: 30.0)
    }
    
    private func generateLogo() {
        generateLogo(UIViewController(), showSettings: false)
    }
    
    func generateLogo(sendingController: UIViewController, showSettings: Bool) {
        generateFrame()
        logoView = generateLogoBackground()
        logoView?.addSubview(generateLogoText())
        
        if (showSettings) {
            var testButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
            testButton.layer.borderWidth = 3
            testButton.layer.borderColor = UIColor.whiteColor().CGColor
            testButton.setTitle("Settings", forState: UIControlState.Normal)
            testButton.frame = CGRectMake(10.0, 40.0, 80.0, 30.0)
            testButton.addTarget(sendingController, action: "goToSettings:", forControlEvents: UIControlEvents.TouchUpInside)
            
            logoView?.addSubview(testButton)
        }
    }
    
    func generateLogoText() -> UIView {
        var logoText = UILabel(frame: logoNavBarFrame!)
        logoText.text = (logoSpec["text"] as! String)
        logoText.textAlignment = NSTextAlignment.Center
        logoText.textColor = (logoSpec["textColor"] as! UIColor)
        logoText.font = UIFont.boldSystemFontOfSize(32.0)
        
        return logoText
    }
    
    private func generateLogoBackground() -> UIView {
        var logoBackground = UIView(frame: logoNavBarFrame!)
        logoBackground.backgroundColor = (logoBackgroundSpec["backgroundColor"] as! UIColor)
        
        return logoBackground
    }
    
    func sectionHeaderView(name: String) -> UIView {
        var logoText = UILabel(frame: sectionHeaderFrame!)
        logoText.text = name
        logoText.textAlignment = NSTextAlignment.Center
        logoText.textColor = UIColor(red: 0.02, green: 0.15, blue: 0.35, alpha: 1.0)
        logoText.font = UIFont.boldSystemFontOfSize(20.0)
        logoText.backgroundColor = UIColor.whiteColor()
        
        return logoText
    }
    
}