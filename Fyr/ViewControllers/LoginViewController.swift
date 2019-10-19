//
//  LoginViewController.swift
//  Fyr
//
//  Created by João Raffs on 19/10/19.
//  Copyright © 2019 Joao Raffs. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    var loginExecuter : LoginExecuter = LoginExecuter()
    
    @IBOutlet weak var phoneNumber: UITextField!
    @IBAction func sendButton(_ sender: Any) {
        if let number = phoneNumber.text{
            self.loginExecuter.sendsSMS(phoneNumber: number) { (success) in
                if !success{
                    print("o número está errado")
                }else{
                    ModelRaffs.instance.loginExecuter = self.loginExecuter
                    ModelRaffs.instance.phone = number
                    self.changesScreen()
                }
            }
        }
    }
    
    private func changesScreen(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "verificationCode")
        present(vc!, animated: true)
        self.navigationController?.pushViewController(vc!, animated: true)
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
