//
//  ColorsConstants.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 25/1/22.
//

import Foundation
import UIKit

struct ColorsConstants {
    static let mainColor: UIColor = UIColor(named: "MainColor") ?? UIColor()
    static let shadowColor: UIColor = .black
    static let navigationTextColor: UIColor = .white
    static let errorBackgroundColor: UIColor = UIColor(named: "ErrorBackgroundColor") ?? UIColor()
    static let errorDescriptionColor: UIColor = UIColor(named: "ErrorDescriptionColor") ?? UIColor()
    static let loaderBackgroundColor: UIColor = .black.withAlphaComponent(0.8)
    static let loadingLabelColor: UIColor = UIColor(named: "LabelSecondaryColor") ?? UIColor()
    static let noInternetBackgroundColor: UIColor = UIColor(named: "MainColor") ?? UIColor()
    static let noInternetTextColor: UIColor = .white
    static let labelMainColor: UIColor = UIColor(named: "LabelMainColor") ?? UIColor()
    static let labelSecondaryColor: UIColor = UIColor(named: "LabelSecondaryColor") ?? UIColor()
}
