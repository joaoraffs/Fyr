
import Foundation
import FirebaseAuth
import Firebase
import FirebaseMessaging

public class Model{
    
    private init(){
    }
    
    public static var instance = Model()

    var phone = ""
    var verificationID = ""
    
    public func savesInUserDefault(){
        UserDefaults.standard.set(phone, forKey: "modelPhone")
        UserDefaults.standard.set(verificationID, forKey: "modelVerificationID")
    }
    
    
}
