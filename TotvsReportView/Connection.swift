//
//  Conexao.swift
//  TotvsReportView
//
//  Created by Felipe Silva on 14/07/17.
//  Copyright © 2017 Felipe Silva. All rights reserved.
//

import Foundation
import UIKit

class Connection:  SettingsVC, SQLClientDelegate {
    let client = SQLClient.sharedInstance()!
    
    func error(_ error: String!, code: Int32, severity: Int32) {
        print("\(error!) \(code) \(severity)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        client.delegate = self
    }

    func openConnection(ip: String, user: String, pass: String, db: String, query: String) {
        client.delegate = self
        client.connect(ip, username: user, password: pass, database: db) { success in
            if success {
                self.client.execute(query, completion: { (_ results: ([Any]?)) in
                    for table in results as! [[[String:AnyObject]]] {
                        for row in table {
                            for (columnName, value) in row {
                                print("\(columnName) = \(value)")
                            }
                        }
                    }
                    self.client.disconnect()
                })
            }
        }
    }
}
