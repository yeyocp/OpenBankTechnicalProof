//
//  ThemeBase.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 20/1/22.
//

import UIKit

class ThemeBase<Colors: ColorsBase, Fonts: FontsBase> {
    
    class GeneralButtonBase {
        class var textColor: UIColor {
            return Colors.coloredBackgroundTextColor
        }
        class var backgroundColor: UIColor {
            return Colors.darkBlueColor
        }
        class var textFont: UIFont {
            return Fonts.fontBold16
        }
    }
    
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
            return Fonts.fontMedium16
        }
        class var textFont: UIFont {
            return Fonts.fontRegular14
        }
    }
}
