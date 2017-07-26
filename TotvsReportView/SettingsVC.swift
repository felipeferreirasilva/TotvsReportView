//
//  SettingsVC.swift
//  TotvsReportView
//
//  Created by Felipe Silva on 15/07/17.
//  Copyright © 2017 Felipe Silva. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController, SQLClientDelegate {
    @IBOutlet weak var tipoDbTxtField: UIButton!
    @IBOutlet weak var ipTxtField: UITextField!
    @IBOutlet weak var portaTxtField: UITextField!
    @IBOutlet weak var userTxtField: UITextField!
    @IBOutlet weak var passTxtField: UITextField!
    @IBOutlet weak var dbTxtField: UITextField!
    @IBOutlet weak var infoTxtView: UITextView!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CHAMA METODO PARA OCULTAR TECLADO AO TOCAR FORA DA TELA
        self.hideKeyboardWhenTappedAround()
        
        ipTxtField.text = UserDefaults.standard.string(forKey: "ip")
        portaTxtField.text = UserDefaults.standard.string(forKey: "porta")
        userTxtField.text = UserDefaults.standard.string(forKey: "user")
        passTxtField.text = UserDefaults.standard.string(forKey: "pass")
        dbTxtField.text = UserDefaults.standard.string(forKey: "db")
    }
    
    @IBAction func voltarBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnSalvarPressed(_ sender: Any) {
        UserDefaults.standard.set(ipTxtField.text, forKey: "ip")
        UserDefaults.standard.set(portaTxtField.text, forKey: "porta")
        UserDefaults.standard.set(userTxtField.text, forKey: "user")
        UserDefaults.standard.set(passTxtField.text, forKey: "pass")
        UserDefaults.standard.set(dbTxtField.text, forKey: "db")
        
        infoTxtView.text = "Configuração Salva"
    }
    
    @IBAction func testarBtnPressed(_ sender: Any) {
        // CRIA RELATORIO DE TESTE
        //let r = ReportsComercial()
        //let q = r.ClientePorCodigo(codigo: "000746")
        
        // CRIA RELATORIO DE TESTE
        let r = ReportsFaturamento()
        let q = r.FaturamentoPorData(de: "20170201", ate: "20170228")
       
        // ABRE NOVA CONEXAO
        let c = SQLConnection()
        
        // SETA DELEGATE
        c.client.delegate = self
        
        // EXECUTA METODO DE CONEXAO
        c.openConnection(query: q){
            self.infoTxtView.text = "Conectado com Sucesso"
        }
        
    }
    
    // CAPTURA ERROS DO SQL
    func error(_ error: String!, code: Int32, severity: Int32) {
        self.infoTxtView.text = "\(error!)"
    }

}
