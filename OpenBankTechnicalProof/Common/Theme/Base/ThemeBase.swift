//
//  ThemeBase.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 20/1/22.
//

import UIKit

class ThemeBase<Colors: ColorsBase, Fonts: FontsBase> {
    
    class ErrorStylesBase {
        
        class var backgroundColor: UIColor {
            return Colors.backgroundColor
        }
        class var titleColor: UIColor {
            return Colors.darkBlueColor
        }
        class var textColor: UIColor {
            return Colors.darkGrayTextColor
        }
        class var titleFont: UIFont {
            return Fonts.rubikMedium16
        }
        class var textFont: UIFont {
            return Fonts.rubikRegular14
        }
    }
}
