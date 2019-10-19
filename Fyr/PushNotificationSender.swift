import UIKit
import Foundation

class PushNotificationSender {  //CHAMAR ESSE MÉTODO QUANDO QUISER MANDAR UMA NOTIFICAÇÃO
//    func sendPushNotificationToPhoneNumber(toPhoneNumber : String, title: String, body: String) {
//        let urlString = "https://fcm.googleapis.com/fcm/send"
//        let url = NSURL(string: urlString)!
////        let token = User(phoneNumber: toPhoneNumber).getToken()
//        let paramString: [String : Any] = ["to" : token,
//                                           "notification" : ["title" : title, "body" : body],
//                                           "data" : ["user" : "test_id"]
//        ]
//        
//        let request = NSMutableURLRequest(url: url as URL)
//        request.httpMethod = "POST"
//        request.httpBody = try? JSONSerialization.data(withJSONObject:paramString, options: [.prettyPrinted])
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("key=AAAADJMGknA:APA91bFGsXni9e7avsrpxM289K80Obg2uJH0zvYqshihn3HWCBCfBcTf0KtYEVU34_CcvDbZ2hz-ukGaQbL_dzUZeRS3mD8HaVpOvz8ijv1zJYXpbTJ9KAEwiiwvAaAAHn2-1q2Q3VO-", forHTTPHeaderField: "Authorization")
//        
//        let task =  URLSession.shared.dataTask(with: request as URLRequest)  { (data, response, error) in
//            do {
//                if let jsonData = data {
//                    if let jsonDataDict  = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
//                        NSLog("Received data:\n\(jsonDataDict))")
//                    }
//                }
//            } catch let err as NSError {
//                print(err.debugDescription)
//            }
//        }
//        task.resume()
//    }
}
