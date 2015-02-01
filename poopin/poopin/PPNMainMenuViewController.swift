import UIKit

class PPNMainMenuViewController : UIViewController, SRWebSocketDelegate {
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
    
    func startPoopin(sender:UIButton!)
    {
        println("Button tapped")
        performSegueWithIdentifier("poopinSegue", sender: self)
        
    }
    
    private func createSettingsButton() {
        var testB = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        
        testB.frame = CGRectMake((self.view.frame.midX - 75.0), (self.view.frame.maxY - 45.0), 150.0, 35.0)
        testB.backgroundColor = UIColor.clearColor()
        testB.layer.cornerRadius = 5
        testB.layer.borderWidth = 3
        testB.layer.borderColor = UIColor.whiteColor().CGColor
        testB.setTitle("me poopin", forState: UIControlState.Normal)
        testB.addTarget(self, action: "startPoopin:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(testB)
        
    }
    
//    SOCKET
    
    func initHandshake() {
//        let time:NSTimeInterval = NSDate().timeIntervalSince1970 * 1000
//        
//        var endpoint = "http://socket.io/1?t=\(time)"
//        
//        var handshakeTask:NSURLSessionTask = session!.dataTaskWithURL(NSURL.URLWithString(endpoint), completionHandler: { (data:NSData!, response:NSURLResponse!, error:NSError!) in
//            if !error {
//                let stringData:NSString = NSString(data: data, encoding: NSUTF8StringEncoding)
//                let handshakeToken:NSString = stringData.componentsSeparatedByString(":")[0] as NSString
//                println("HANDSHAKE \(handshakeToken)")
//                
//                self.socketConnect(handshakeToken)
//            }
//        })
//        handshakeTask.resume()
    }
    
    func socketConnect(token:NSString) {
//        socketio = SRWebSocket(URLRequest: NSURLRequest(URL: NSURL(string: "ws://\(server)/socket.io/1/websocket/\(token)")))
//        socketio!.delegate = self
//        socketio!.open()
    }
    
    func webSocket(webSocket: SRWebSocket!, didReceiveMessage message: AnyObject!) {
//        // All incoming messages ( socket.on() ) are received in this function. Parsed with JSON
//        println("MESSAGE: \(message)")
//        
//        var jsonError:NSError?
//        let messageArray = (message as NSString).componentsSeparatedByString(":::")
//        let data:NSData = messageArray[messageArray.endIndex - 1].dataUsingEncoding(NSUTF8StringEncoding)
//        var json:AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError)
//        
//        if json != nil {
//            let event: NSString = json!["name"] as NSString
//            let args: NSDictionary = (json!["args"] as NSArray)[0] as NSDictionary
//            
//            if (event.isEqualToString("one")) {
//                didReceiveEventOne(args)
//            }
//            else if (event.isEqualToString("two")) {
//                didReceiveEventTwo(args)
//            }
//            else if (event.isEqualToString("three")) {
//                didReceiveEventThree(args)
//            }
//        }
    }
    
    func didReceiveEventOne(args: NSDictionary) {
//        var dict = [
//            "name": "event",
//            "args": [["Method": "One"]]
//        ]
//        var jsonSendError:NSError?
//        var jsonSend = NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions(0), error: &jsonSendError)
//        var jsonString = NSString(data: jsonSend, encoding: NSUTF8StringEncoding)
//        println("JSON SENT \(jsonString)")
//        let str:NSString = "5:::\(jsonString)"
//        socketio?.send(str)
    }
}
