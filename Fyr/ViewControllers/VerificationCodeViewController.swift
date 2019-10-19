//
//  VerificationCodeViewController.swift
//  Fyr
//
//  Created by João Raffs on 19/10/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
class VerificationCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginExecuter =  ModelRaffs.instance.loginExecuter
            
        // Do any additional setup after loading the view.
    }
    public var loginExecuter = LoginExecuter()
    @IBOutlet weak var codeFromSMS: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        if let code = codeFromSMS.text{
            self.loginExecuter.verifiesCode(code: code) { (sucess) in
                if !sucess{
                    print("wrong SMS Code!")
                }else{
                    
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
