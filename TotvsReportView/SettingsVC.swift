//
//  SettingsVC.swift
//  TotvsReportView
//
//  Created by Felipe Silva on 15/07/17.
//  Copyright © 2017 Felipe Silva. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    @IBOutlet weak var ipTxtField: UITextField!
    @IBOutlet weak var userTxtField: UITextField!
    @IBOutlet weak var passTxtField: UITextField!
    @IBOutlet weak var dbTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        ipTxtField.text = UserDefaults.standard.string(forKey: "ip")
        userTxtField.text = UserDefaults.standard.string(forKey: "user")
        passTxtField.text = UserDefaults.standard.string(forKey: "pass")
        dbTxtField.text = UserDefaults.standard.string(forKey: "db")
    }
    
    @IBAction func voltarBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnSalvarPressed(_ sender: Any) {
        UserDefaults.standard.set(ipTxtField.text, forKey: "ip")
        UserDefaults.standard.set(userTxtField.text, forKey: "user")
        UserDefaults.standard.set(passTxtField.text, forKey: "pass")
        UserDefaults.standard.set(dbTxtField.text, forKey: "db")
    }
    
    @IBAction func testarBtnPressed(_ sender: Any) {
        //let r = ReportsComercial()
        //let q = r.ClientePorCodigo(codigo: "000746")
        
        let r = ReportsFaturamento()
        let q = r.FaturamentoPorData(de: "20170201", ate: "20170228")
        
        let c = Connection()
        
        c.openConnection(query: q){
            print(c.status)
        }
        
    }

}
