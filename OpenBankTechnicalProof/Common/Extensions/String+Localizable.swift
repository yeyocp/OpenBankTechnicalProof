//
//  String+Localizable.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 20/1/22.
//

import Foundation

extension String {
    func localizable(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, comment: "")
    }
}
