//
//  ViewController.swift
//  TotvsReportView
//
//  Created by Felipe Silva on 14/07/17.
//  Copyright © 2017 Felipe Silva. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let r = ReportsComercial()
        //let q = r.ClientePorCodigo(codigo: "000746")
        
        let r = ReportsFaturamento()
        let q = r.FaturamentoPorData(de: "20170201", ate: "20170228")
        
        let c = Connection()
        c.openConnection(ip: "192.168.25.175", user: "sa", pass: "sa", db: "Prod", query: q)
        
    }
    
}

