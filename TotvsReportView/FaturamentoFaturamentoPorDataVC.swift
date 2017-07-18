//
//  FaturamentoFaturamentoPorDataVC.swift
//  TotvsReportView
//
//  Created by Felipe Silva on 15/07/17.
//  Copyright © 2017 Felipe Silva. All rights reserved.
//

import UIKit

class FaturamentoFaturamentoPorDataVC: UIViewController, SQLClientDelegate {
    @IBOutlet weak var infoTxtView: UITextView!
    @IBOutlet weak var btnDtDe: UIButton!
    @IBOutlet weak var btnDtAte: UIButton!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var btnGerar: UIButton!
    @IBOutlet weak var btnSalvar: UIButton!
    
    var dtDe = ""
    var dtAte = ""
    
    var controleDeCampo: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func voltarBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnDtDePressed(_ sender: Any) {
        datePicker.isHidden = false
        btnSalvar.isHidden = false
        resultLbl.isHidden = true
        btnGerar.isHidden = true
        controleDeCampo = 1
    }
    
    @IBAction func btnDtAtePressed(_ sender: Any) {
        datePicker.isHidden = false
        btnSalvar.isHidden = false
        resultLbl.isHidden = true
        btnGerar.isHidden = true
        controleDeCampo = 2
    }
    
    @IBAction func btnSalvarPressed(_ sender: Any) {
        datePicker.isHidden = true
        btnSalvar.isHidden = true
        btnGerar.isHidden = false
        
        let formatterToVC = DateFormatter()
        formatterToVC.dateFormat = "dd/MM/yyy"
        
        let formatterToDB = DateFormatter()
        formatterToDB.dateFormat = "yyyyMMdd"
        
        if controleDeCampo == 1{
            btnDtDe.setTitle(formatterToVC.string(from: datePicker.date), for: .normal)
            dtDe = formatterToDB.string(from: datePicker.date)
        }else if (controleDeCampo == 2){
            btnDtAte.setTitle(formatterToVC.string(from: datePicker.date), for: .normal)
            dtAte = formatterToDB.string(from: datePicker.date)
        }
    }
    
    @IBAction func btnGerarPressed(_ sender: Any) {
        if (!dtDe.isEmpty && !dtAte.isEmpty){
            let r = ReportsFaturamento()
            let q = r.FaturamentoPorData(de: dtDe, ate: dtAte)
            
            // ABRE NOVA CONEXAO
            let c = Connection()
            
            // SETA DELEGATE
            c.client.delegate = self
            
            // EXECUTA METODO DE CONEXAO
            c.openConnection(query: q){
                self.resultLbl.isHidden = false
                
                // IMPRIMRE RESULTADO
                for table in c.result as! [[[String:AnyObject]]] {
                    for row in table {
                        for (columnName, value) in row {
                           self.resultLbl.text = ("\(columnName) \(value)")
                        }
                    }
                }
            }
        }
        
    }
    
    // CAPTURA ERROS DO SQL
    func error(_ error: String!, code: Int32, severity: Int32) {
        self.infoTxtView.text = "\(error!)"
    }
    
}
