//
//  ClothesViewModel.swift
//  SizeConversion
//
//  Created by Dody on 27/09/1445 AH.
//

import Foundation


class ClothesViewModel{
    
    //var sizeWithGender: ([male]? , [female]?)
    
    var theGender: String
    
    init(chosenGender: String) {
        self.theGender = chosenGender
//        if ((self.sizeWithGender.0?.isEmpty) != nil) {
//            //if male
//            self.sizeWithGender = (sizeWithGender.0,nil)
//            print(self.sizeWithGender )
//        }else{
//           //if femail
//            self.sizeWithGender = (nil,sizeWithGender.1)

        //}
    }
    
    func getTheChosenSplit(setName:String) {
//        var chooseSet : [Any] = []
//        
////        for i in 0 ..< (self.sizeWithGender){
////            if setName == "Upper split"{
////                chooseSet.append(self.sizeWithGender[i].upperSplit)
////            }else if setName == "Down split"{
////                chooseSet.append(self.sizeWithGender[i])
////            }else{
////                chooseSet.append(self.sizeWithGender[i])
////            }
////        }
//        if setName == "Upper split" {
//                for maleData in sizeWithGender.0 ?? [] {
//                    chooseSet.append(maleData.upperSplit)
//                }
//                for femaleData in sizeWithGender.1 ?? [] {
//                    chooseSet.append(femaleData.upperSplit)
//                }
//            } else if setName == "Down split" {
//                for maleData in sizeWithGender.0 ?? [] {
//                    chooseSet.append(maleData.downSplit)
//                }
//                for femaleData in sizeWithGender.1 ?? [] {
//                    chooseSet.append(femaleData.downSplit)
//                }
//            } else {
//                for maleData in sizeWithGender.0 ?? [] {
//                    chooseSet.append(maleData.shoes)
//                }
//                for femaleData in sizeWithGender.1 ?? [] {
//                    chooseSet.append(femaleData.shoes)
//                }
//            }
//        return chooseSet
    }
    
//    func getTheChoosenFemaleSplit(setName:String) -> ([FemaleUpperSplit]?,[DownSplit]? , [FemaleShoes]?){
//        var chooseSet : ([FemaleUpperSplit]?,[DownSplit]? , [FemaleShoes]?)
//        chooseSet.0 = []
//        chooseSet.1 = []
//        chooseSet.2 = []
//        for i in 0 ... (self.sizeWithGender.1?.count)! - 1{
//            if setName == "Upper split"{
//                chooseSet.0?.append((self.sizeWithGender.1?[i].upperSplit)!)
//            }else if setName == "Down split"{
//                chooseSet.1?.append((self.sizeWithGender.1?[i].downSplit)!)
//            }else{
//                chooseSet.2?.append((self.sizeWithGender.1?[i].shoes)!)
//            }
//        }
//        return chooseSet
//    }
}
