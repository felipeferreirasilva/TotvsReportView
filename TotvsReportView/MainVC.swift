//
//  ViewController.swift
//  TotvsReportView
//
//  Created by Felipe Silva on 14/07/17.
//  Copyright © 2017 Felipe Silva. All rights reserved.
//

import UIKit

class MainVC: UIViewController, SQLClientDelegate {

    func error(_ error: String!, code: Int32, severity: Int32) {
        print("\(error!) \(code) \(severity)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = SQLClient.sharedInstance()!
        client.delegate = self
        client.connect("192.168.25.175", username: "sa", password: "sa", database: "Prod") { success in
            client.execute("SELECT A1_NOME FROM SA1010 WHERE D_E_L_E_T_='' AND A1_COD='000749' ", completion: { (_ results: ([Any]?)) in
                for table in results as! [[[String:AnyObject]]] {
                    for row in table {
                        for (columnName, value) in row {
                            print("\(columnName) = \(value)")
                        }
                    }
                }
                client.disconnect()
            })
        }

        
    }
}

