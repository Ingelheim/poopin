import UIKit
import Foundation

class SocketExample: UIViewController {
    var label : UILabel?
    let socket = SocketIOClient(socketURL: "http://localhost:8080")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startAndRegisterSocket()
        label = UILabel(frame: self.view.frame)
        label!.text = "TEST"
        label!.textAlignment = NSTextAlignment.Center
        
        self.view.addSubview(label!)
    }
    
    func startAndRegisterSocket() {
        socket.connect()
        
        socket.on("connect") {data in
            println("socket connected")
            self.sendInitialMessage()
        }
        
        socket.on("updatePoopinStats") {data in
            if let reason = data as? NSDictionary {
                println("Data received \(reason)")
//                self.label!.text = reason["test"] as? String
            }
        }
    }
    
    func sendInitialMessage() {
        socket.emit("initialConnection")
    }
}
