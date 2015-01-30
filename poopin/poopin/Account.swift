import Foundation
import CoreData

@objc(Account)
class Account: NSManagedObject {

    @NSManaged var uid: String
    @NSManaged var continent: NSNumber
}
