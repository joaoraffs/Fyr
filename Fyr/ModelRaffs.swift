import Foundation
import FirebaseAuth
import Firebase
import FirebaseMessaging

public class ModelRaffs{
    
    private init(){
        loginExecuter = LoginExecuter()
    }
    
    public static var instance = ModelRaffs()
    
    public var loginExecuter : LoginExecuter
    public var phone = ""
    public var verificationID  = ""
}
