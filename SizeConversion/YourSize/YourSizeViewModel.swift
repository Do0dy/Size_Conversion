//
//  YourSizeViewModel.swift
//  SizeConversion
//
//  Created by Dody on 29/09/1445 AH.
//

import Foundation


class YourSizeViewModel{
    
    var theResult: (usSize: String?, euSize: String?)?
    
    init(resultSizes: (usSize: String?, euSize: String?)?){
        self.theResult = resultSizes
    }
}
