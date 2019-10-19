//
//  LoginExecuter.swift
//  Unio
//
//  Created by João Raffs on 02/09/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//
import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase
import FirebaseMessaging

// QUEM FOR USAR ESSA CLASSE E ESSES MÉTODOS DEVE COLOCAR COMO PARAMETRO O QUE FAZER CASO DÊ ERRO.

/// EXEMPLO DE IMPLEMENTAÇÃO LÁ EMBAIXO (NO FINAL)
public class LoginExecuter{
    
    public var successInSMS = false
    public var successInVerificationCode = false
//    public var eventManager = EventManager()
    public init(){}
    
    public func sendsSMS(phoneNumber: String,callback:@escaping ((Bool) -> ()))
    {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if error != nil {
                print("entrou no error no aprimeiro auth")
                callback(false)
            }else{
                self.successInSMS = true
                print("entrou no else")
                Model.instance.phone = phoneNumber
                Model.instance.verificationID = verificationID!
                UserDefaults.standard.set(verificationID, forKey: "modelVerificationID")
                callback(true)
            }
            
//            self.eventManager.trigger(eventName: "sendsSMSFinished")
        }
    }
    
    public func verifiesCode(code: String,callback:@escaping ((Bool) -> ())) {
        let verificationID = UserDefaults.standard.object(forKey: "VerificationID") as? String
        
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID as! String,
            verificationCode: code)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            print("ENTROU NO AUTH")
            if let error = error {
                print("entrou no erro")
                callback(false)
            }else{
                print("entrou no else")
                callback(true)
//                Model.instance.savesDataInUserDefaults()
            }
//            self.eventManager.trigger(eventName: "verifiesCodeFinished")
        }
    }

    
/*             let loginExecuter = LoginExecuter()
 loginExecuter.verifiesCode(code: code, callback:{ // INSIRA AQUI O CODIGO
 success in
 if success{
 print("DEU CERTO!")
 }else{
 print("Deu errado bro")
 }
 })
 
 */
}
