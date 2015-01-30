import CoreData
import UIKit

enum Continents : Int {
    case EUROPE = 0
    case AUSTRALIA = 1
    case NORTH_AMERICA = 2
    case SOUTH_AMERICA = 3
    case AFRICA = 4
    case ASIA = 5
}

class PPNRepositoryManager {
    
    class UIDGenerator {
        
        class func generate() -> String {
            let ALPHABET : [Character]  = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" ];
            
            var key : String = ""
            for i in 0...31 {
                var randomInt = Int(arc4random_uniform(UInt32(ALPHABET.count)))
                key.append(ALPHABET[randomInt])
            }
            return key
        }
    }
    
    lazy var managedObjectContext : NSManagedObjectContext? = {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        if let managedObjectContext = appDelegate.managedObjectContext {
            return managedObjectContext
        }
        else {
            return nil
        }
        }()
    
    private func createUID() -> String {
        return UIDGenerator.generate()
    }
    
    func createAccount() {
        
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("Account", inManagedObjectContext: managedObjectContext!) as Account
        
        newItem.continent = Continents.EUROPE.rawValue
        newItem.uid = createUID()
        
        var error : NSError? = nil
        if !self.managedObjectContext!.save(&error) {
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
        
        getAllAccounts()
    }
    
    func getAllAccounts() {
        let fetchRequest = NSFetchRequest(entityName: "Account")
        
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Account] {
        }
    }
}