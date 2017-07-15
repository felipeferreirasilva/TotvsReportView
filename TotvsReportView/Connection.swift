//
//  Conexao.swift
//  TotvsReportView
//
//  Created by Felipe Silva on 14/07/17.
//  Copyright © 2017 Felipe Silva. All rights reserved.
//

import Foundation
import UIKit

class Connection{

    func openConnection(ip: String, user: String, pass: String, db: String, query: String) {
        let client = SQLClient.sharedInstance()!
        client.connect(ip, username: user, password: pass, database: db) { success in
            client.execute(query, completion: { (_ results: ([Any]?)) in
                
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
