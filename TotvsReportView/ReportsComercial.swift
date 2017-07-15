//
//  ReportsComercial.swift
//  TotvsReportView
//
//  Created by Felipe Silva on 14/07/17.
//  Copyright © 2017 Felipe Silva. All rights reserved.
//

import Foundation

class ReportsComercial {
    
    func ClientePorCodigo (codigo: String) -> String {
        let query = "SELECT A1_NOME, A1_BAIRRO FROM SA1010 WHERE D_E_L_E_T_=' ' AND A1_COD='\(codigo)'"
        return query
    }
    
}
