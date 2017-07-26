//
//  Conexao.swift
//  TotvsReportView
//
//  Created by Felipe Silva on 14/07/17.
//  Copyright © 2017 Felipe Silva. All rights reserved.
//

//192.168.25.175

import Foundation

class Connection {
    private var _client = SQLClient.sharedInstance()!
    private var _result: [Any] = []
    private var IP = UserDefaults.standard.string(forKey: "ip")!
    private var PORT = 1433
    private var USER = UserDefaults.standard.string(forKey: "user")!
    private var PASS = UserDefaults.standard.string(forKey: "pass")!
    private var DB = UserDefaults.standard.string(forKey: "db")!
    
    var client: SQLClient{
        get{
            return _client
        }set{
            _client = newValue
        }
    }
    
    var result: [Any]{
        get{
            return _result
        }set{
            _result = newValue
        }
    }
    
    func openConnection(query: String, completed: @escaping DownloadComplete) {
        self._client.connect("\(IP):\(PORT)", username: USER, password: PASS, database: DB) { success in
            if (success) {
                self.client.execute(query, completion: { (_ results: ([Any]?)) in
                self._result = results!
                self.client.disconnect()
                completed()
                })
            }
        }
    }
}
