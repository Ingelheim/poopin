import UIKit
import Foundation


class PPNUIGenerator {
    var maxX : CGFloat = 0.0
    var maxY : CGFloat =  0.0
    var logoNavBarFrame : CGRect?
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    private let logoTextView : UILabel?
    private let logoBackgroundView : UIView?
    
    var logoView : UIView?
    
    private let sharedSpec : [String: AnyObject] =
    [
        "height" : CGFloat(100.0)
    ]
    
    private let logoBackgroundSpec : [String: AnyObject] =
    [
        "backgroundColor" : UIColor(red: 0.04, green: 0.32, blue: 0.52, alpha: 1.0)
        
    ]
    
    private let logoSpec : [String: AnyObject] =
    [
        "text" : "poopin",
        "fontSize" : 40.0,
        "textColor" : UIColor.whiteColor()
        
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
        
        logoNavBarFrame = CGRect(x: 0.0, y: 0.0, width: maxY, height: sharedSpec["height"] as CGFloat)
    }
    
    private func generateLogo() {
        generateFrame()
        logoView = generateLogoBackground()
        logoView?.addSubview(generateLogoText())
    }
    
    private func generateLogoText() -> UIView {
        var logoText = UILabel(frame: logoNavBarFrame!)
        logoText.text = (logoSpec["text"] as String)
        logoText.textAlignment = NSTextAlignment.Center
        logoText.textColor = (logoSpec["textColor"] as UIColor)
        logoText.font = UIFont.boldSystemFontOfSize(40.0)
        
        return logoText
    }
    
    private func generateLogoBackground() -> UIView {
        var logoBackground = UIView(frame: logoNavBarFrame!)
        logoBackground.backgroundColor = (logoBackgroundSpec["backgroundColor"] as UIColor)
        
        return logoBackground
    }
    
}