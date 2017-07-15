//
//  Reports.swift
//  TotvsReportView
//
//  Created by Felipe Silva on 14/07/17.
//  Copyright © 2017 Felipe Silva. All rights reserved.
//

import Foundation

class ReportsFaturamento {
    
    func FaturamentoPorData(de: String, ate: String) -> String {
        let query = "SELECT SUM(F2_VALMERC) FROM SF2010 WHERE D_E_L_E_T_=' ' AND F2_EMISSAO>='\(de)' AND F2_EMISSAO<='\(ate)'"
        return query
    }
    
}
