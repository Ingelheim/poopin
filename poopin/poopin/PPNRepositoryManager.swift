import CoreData
import UIKit

enum Continents : Int {
    case ASIA = 0
    case AUSTRALIA = 1
    case AFRICA = 2
    case EUROPE = 3
    case NORTH_AMERICA = 4
    case SOUTH_AMERICA = 5
    
    static func getContinent(continent: Int) -> String {
        switch continent {
        case 0:
            return "Asia"
        case 1:
            return "Australia"
        case 2:
            return "Africa"
        case 3:
            return "Europe"
        case 4:
            return "N. America"
        default:
            return "S. America"
        }
    }
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
    
    let phoneUID : String?
    var firstVisit : Bool = true
    var currentAccount : Account?
    
    private func createUID() -> String {
        return UIDGenerator.generate()
    }
    
    class var sharedInstance :PPNRepositoryManager {
        struct Singleton {
            static let instance =
            PPNRepositoryManager()
        }
        
        return Singleton.instance
    }
    
    init() {
        phoneUID = UIDevice.currentDevice().identifierForVendor.UUIDString
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
    
    func createAccount(uuid: String) {
        
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("Account", inManagedObjectContext: managedObjectContext!) as Account
        
        newItem.continent = Continents.EUROPE.rawValue
        newItem.uid = uuid
        
        var error : NSError? = nil
        if !self.managedObjectContext!.save(&error) {
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
        
        getAccountByUid(uuid)
    }
    
    func getAllAccounts() {
        let fetchRequest = NSFetchRequest(entityName: "Account")
        
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Account] {
            println(fetchResults)
            for result in fetchResults {
                println(result.uid)
                println(result.continent)
            }
        }
    }
    
    func checkOrCreateUniqueAccount() {
        if let actualPhoneUID = phoneUID {
            println("******* PHONEUID EXISTENT **********")
            
            if let actualAccount = getAccountByUid(actualPhoneUID) {
                firstVisit = false
                currentAccount = actualAccount
                println("******* ACCOUNT EXISTS **********")
            } else {
                createAccount(actualPhoneUID)
                println("******* ACCOUNT CREATED **********")
            }
        }
        getAllAccounts()
    }
    
    func updateAccount(continent: Int) -> Bool {
        if let actualCurrentAccount = currentAccount {
            actualCurrentAccount.continent = continent
            
            var error : NSError? = nil
            if !self.managedObjectContext!.save(&error) {
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                return false
            }
            return true
        }
        
        return false
    }
    
    internal func getAccountByUid(uid: String) -> Account? {
        var fetchRequest = NSFetchRequest(entityName: "Account")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "uid = %@", uid)
        
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Account] {
            if fetchResults.count != 0 {
                currentAccount = fetchResults[0]
                return currentAccount
            }
            
        }
        
        return nil
    }
}