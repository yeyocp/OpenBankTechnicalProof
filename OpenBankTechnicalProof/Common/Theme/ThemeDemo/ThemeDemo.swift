//
//  ThemeDemo.swift
//  OpenBankTechnicalProof
//
//  Created by Sergio Castaño Panchuelo on 20/1/22.
//

import UIKit

class ThemeDemo: ThemeBase<ColorsDemo, FontsDemo> {
    
    class ErrorStyles: ErrorStylesBase {
        
        //You can override the ThemeBase properties. Example:
        //override class backgroundColor: UIColor {
        //    return ColorsDemo.darkBlueColor
        //}
    }
    
    class GeneralButton: GeneralButtonBase {}
}
