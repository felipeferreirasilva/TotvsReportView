//
//  Conexao.swift
//  TotvsReportView
//
//  Created by Felipe Silva on 14/07/17.
//  Copyright © 2017 Felipe Silva. All rights reserved.
//

//192.168.25.175

import Foundation
import UIKit

class Connection:  SettingsVC, SQLClientDelegate {
    private var _result: [Any] = []
    private var IP = UserDefaults.standard.string(forKey: "ip")!
    private var USER = UserDefaults.standard.string(forKey: "user")!
    private var PASS = UserDefaults.standard.string(forKey: "pass")!
    private var DB = UserDefaults.standard.string(forKey: "db")!
    
    var result: [Any]{
        get{
            return _result
        }set{
            _result = newValue
        }
    }
    
    func error(_ error: String!, code: Int32, severity: Int32) {
        print("\(error!) \(code) \(severity)")
    }

    func openConnection(query: String, completed: @escaping DownloadComplete) {
        let client = SQLClient.sharedInstance()!
        client.delegate = self
        client.connect(IP, username: USER, password: PASS, database: DB) { success in
            if (success) {
                client.execute(query, completion: { (_ results: ([Any]?)) in
                self._result = results!
                client.disconnect()
                completed()
                })
            }
        }
    }
}
