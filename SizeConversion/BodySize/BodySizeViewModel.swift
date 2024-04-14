//
//  BodySizeViewModel.swift
//  SizeConversion
//
//  Created by Dody on 29/09/1445 AH.
//

import Foundation


class BodySizeViewModel{
    
    private var api: CallTheData!
    private var sizeData : SizeModel?
     
    
    var upperSplit : [upperSplit]?
    var downSplit : [downSplit]?
    var shoes : [shoes]?
    var theGender: String!
    var theSplit: String!
    var resultToProfile: profileDataModel?

    init(setGender: String, setType:String){
        self.theGender = setGender
        self.theSplit = setType
        self.upperSplit = []
        self.downSplit = []
        self.shoes = []
        self.resultToProfile = profileDataModel()
        self.resultToProfile?.theGender = setGender
        self.api = CallTheData()
        callData()
        
    }
    // to get the data
    func callData() {
            DispatchQueue.main.async {
                self.api.readJSONFile { SizeModel in
                         self.sizeData = SizeModel
                    //print(self.sizeData)

               }
            }
    }//end callData()
    
    func setSplitData(){
        if self.theGender == "male"{
            self.upperSplit?.append((self.sizeData?.sizeStandards[0].male.upperSplit)!)
            self.downSplit?.append((self.sizeData?.sizeStandards[0].male.downSplit)!)
            self.shoes?.append((self.sizeData?.sizeStandards[0].male.shoes)!)
            
            self.upperSplit?.append((self.sizeData?.sizeStandards[1].male.upperSplit)!)
            self.downSplit?.append((self.sizeData?.sizeStandards[1].male.downSplit)!)
            self.shoes?.append((self.sizeData?.sizeStandards[1].male.shoes)!)
            
        }else if self.theGender == "female"{
            self.upperSplit?.append((self.sizeData?.sizeStandards[0].female.upperSplit)!)
            self.downSplit?.append((self.sizeData?.sizeStandards[0].female.downSplit)!)
            self.shoes?.append((self.sizeData?.sizeStandards[0].female.shoes)!)
            
            self.upperSplit?.append((self.sizeData?.sizeStandards[1].female.upperSplit)!)
            self.downSplit?.append((self.sizeData?.sizeStandards[1].female.downSplit)!)
            self.shoes?.append((self.sizeData?.sizeStandards[1].female.shoes)!)

        }
    }
    
    //-------------------------------------------------------------------------------------------------

    func theApproximateSizeForUpperSplit(theChest: Int,theWaist:Int)-> (usSize: String?, euSize: String?)?{
        setSplitData()
        var closestUSSize: theBodySize?
        var closestEUISize: theBodySize?
        var chestFrom = 0
        var chestTo = 0
        var waistFrom = 0
        var waistTo = 0
        
        
        //for US
        let bodySizesUS = [
            self.upperSplit?[0].xxs, self.upperSplit?[0].xs, self.upperSplit?[0].s, self.upperSplit?[0].sm, self.upperSplit?[0].m, self.upperSplit?[0].md,self.upperSplit?[0].l, self.upperSplit?[0].lg, self.upperSplit?[0].xl, self.upperSplit?[0].xxl, self.upperSplit?[0].xxxl, self.upperSplit?[0].xxxxl, self.upperSplit?[0].xxxxxl
        ]
    

        for i in 0 ..< bodySizesUS.count{
            if bodySizesUS[i]?.chest?.from != nil {
                chestFrom = (bodySizesUS[i]!.chest!.from)
                chestTo = (bodySizesUS[i]!.chest!.to)
                waistFrom = (bodySizesUS[i]!.waist.from)
                waistTo = (bodySizesUS[i]!.waist.to)
                if closestUSSize == nil {
                    if (chestFrom) >= theChest && theChest <= (chestTo ){
                        if (waistFrom ) >= theWaist || theWaist <= (waistTo ){
                            print("theChest: \(theChest), theWaist: \(theWaist). \n chestFrom: \(chestFrom),chestTo: \(chestTo).\n waistFrom: \(waistFrom), waistTo: \(waistTo) ")
                            closestUSSize = bodySizesUS[i]
                            break
                        }
                    }//if
                }// if
            }
        }// for
        
        //for EU
        let bodySizesEU = [
                self.upperSplit?[1].xxs, self.upperSplit?[1].xs, self.upperSplit?[1].s,
                self.upperSplit?[1].sm, self.upperSplit?[1].m, self.upperSplit?[1].md,self.upperSplit?[1].l, self.upperSplit?[1].lg, self.upperSplit?[1].xl, self.upperSplit?[1].xxl, self.upperSplit?[1].xxxl, self.upperSplit?[1].xxxxl, self.upperSplit?[1].xxxxxl
        ]
                
        for i in 0 ..< bodySizesEU.count{
            if bodySizesEU[i]?.chest?.from != nil {
                chestFrom = (bodySizesEU[i]!.chest!.from)
                chestTo = (bodySizesEU[i]!.chest!.to)
                waistFrom = (bodySizesEU[i]!.waist.from)
                waistTo = (bodySizesEU[i]!.waist.to)
                
                if closestEUISize == nil {
                    if (chestFrom) >= theChest && theChest <= (chestTo ){
                        if (waistFrom ) >= theWaist || theWaist <= (waistTo ){
                            print("theChest: \(theChest), theWaist: \(theWaist). \n chestFrom: \(chestFrom),chestTo: \(chestTo).\n waistFrom: \(waistFrom), waistTo: \(waistTo) ")
                            closestEUISize = bodySizesEU[i]
                            break
                        }
                    }//if
                }// if
            }
        }// for

        print("US size is: \(String(describing: closestUSSize))\n , EU size is: \(String(describing: closestEUISize))")
        self.resultToProfile?.upperSplitSize = (closestUSSize?.usSize, closestEUISize?.euSize)
        return (closestUSSize?.usSize, closestEUISize?.euSize)
    }
        
    //-------------------------------------------------------------------------------------------------

    
    func theApproximateSizeForDownSplit(theWaist:Int,theHip:Int)-> (usSize: String?, euSize: String?)?{
        setSplitData()
        var closestUSSize: theBodySize?
        var closestEUISize: theBodySize?
        var waistFrom = 0
        var waistTo = 0
        var hipFrom = 0
        var hipTo = 0
        
        //print(self.downSplit?[0].xs)
        //for US
        let bodySizesUS = [
                self.downSplit?[0].xs ,self.downSplit?[0].s ,self.downSplit?[0].sm , self.downSplit?[0].m ,self.downSplit?[0].md, self.downSplit?[0].l ,self.downSplit?[0].lg ,self.downSplit?[0].xl, self.downSplit?[0].xxl ,self.downSplit?[0].xxxl,self.downSplit?[0].xxxxl ,self.downSplit?[0].xxxxxl
        ]
    

        for i in 0 ..< bodySizesUS.count{
            if bodySizesUS[i]?.waist.from != nil {
                waistFrom = (bodySizesUS[i]!.waist.from)
                waistTo = (bodySizesUS[i]!.waist.to)
                hipFrom = (bodySizesUS[i]!.hip!.from)
                hipTo = (bodySizesUS[i]!.hip!.to)
                if closestUSSize == nil {
                    if (waistFrom ) >= theWaist && theWaist <= (waistTo){
                        if (hipFrom ) >= theHip || theHip <= (hipTo ){
                            print(" theWaist: \(theWaist),theHip: \(theHip). \n  waistFrom: \(waistFrom), waistTo: \(waistTo).\n hipFrom: \(hipFrom),hipTo: \(hipTo)")
                            closestUSSize = bodySizesUS[i]
                            break
                        }
                    }//if
                }// if
            }
        }// for
        
        //for EU
        let bodySizesEU = [
            self.downSplit?[1].xs,self.downSplit?[1].s,self.downSplit?[1].sm , self.downSplit?[1].m ,self.downSplit?[1].md, self.downSplit?[1].l,self.downSplit?[1].lg,self.downSplit?[1].xl, self.downSplit?[1].xxl,self.downSplit?[1].xxxl,self.downSplit?[1].xxxxl,self.downSplit?[1].xxxxxl
        ]
                
        for i in 0 ..< bodySizesEU.count{
            if bodySizesEU[i]?.waist.from != nil {
                waistFrom = (bodySizesEU[i]!.waist.from)
                waistTo = (bodySizesEU[i]!.waist.to)
                hipFrom = (bodySizesEU[i]!.hip!.from)
                hipTo = (bodySizesEU[i]!.hip!.to)
                
                if closestEUISize == nil {
                    if (waistFrom ) >= theWaist && theWaist <= (waistTo ){
                        if (hipFrom ) >= theHip || theHip <= (hipTo ){
                            print(" theWaist: \(theWaist),theHip: \(theHip). \n  waistFrom: \(waistFrom), waistTo: \(waistTo).\n hipFrom: \(hipFrom),hipTo: \(hipTo)")
                            closestEUISize = bodySizesEU[i]
                            break
                        }
                    }//if
                }// if
            }
        }// for
        
        print("US size is: \(String(describing: closestUSSize))\n , EU size is: \(String(describing: closestEUISize))")
        self.resultToProfile?.downSplitSize = (closestUSSize?.usSize, closestEUISize?.euSize)
        return (closestUSSize?.usSize, closestEUISize?.euSize)
    }
    //-------------------------------------------------------------------------------------------------
    
    func theApproximateSizeForShoes(theLengthOfHeel:Double) -> (usSize: String?, euSize: String?)?{
        setSplitData()
        var usSize: sizeScale?
        var euSize: sizeScale?
        
        // US
        let shoesSizesUS = [
            self.shoes?[0].the22cm , self.shoes?[0].the22AndHalfcm, self.shoes?[0].the23cm, self.shoes?[0].the23AndHalfcm, self.shoes?[0].the24AndHalfcm, self.shoes?[0].the24AndHalfcm, self.shoes?[0].the25AndHalfcm, self.shoes?[0].the25AndHalfcm, self.shoes?[0].the26cm , self.shoes?[0].the26AndHalfcm , self.shoes?[0].the27cm, self.shoes?[0].the27AndHalfcm, self.shoes?[0].the28cm, self.shoes?[0].the28AndHalfcm , self.shoes?[0].the29cm, self.shoes?[0].the29AndHalfcm, self.shoes?[0].the30cm, self.shoes?[0].the30AndHalfcm , self.shoes?[0].the31cm, self.shoes?[0].the31AndHalfcm, self.shoes?[0].the32cm , self.shoes?[0].the32AndHalfcm, self.shoes?[0].the33cm, self.shoes?[0].the33AndHalfcm, self.shoes?[0].the34cm
        ]
        
        for i in 0 ..< shoesSizesUS.count{
            if shoesSizesUS[i]?.sizeInCM == theLengthOfHeel{
                usSize = shoesSizesUS[i]
                break
            }
        }
        
        
        //EU
        let shoesSizesEU = [
            self.shoes?[1].the22cm , self.shoes?[1].the22AndHalfcm, self.shoes?[1].the23cm, self.shoes?[1].the23AndHalfcm, self.shoes?[1].the24AndHalfcm, self.shoes?[1].the24AndHalfcm, self.shoes?[1].the25AndHalfcm, self.shoes?[1].the25AndHalfcm, self.shoes?[1].the26cm , self.shoes?[1].the26AndHalfcm , self.shoes?[1].the27cm, self.shoes?[1].the27AndHalfcm, self.shoes?[1].the28cm, self.shoes?[1].the28AndHalfcm , self.shoes?[1].the29cm, self.shoes?[1].the29AndHalfcm, self.shoes?[1].the30cm, self.shoes?[1].the30AndHalfcm , self.shoes?[1].the31cm, self.shoes?[1].the31AndHalfcm, self.shoes?[1].the32cm , self.shoes?[1].the32AndHalfcm, self.shoes?[1].the33cm, self.shoes?[1].the33AndHalfcm, self.shoes?[1].the34cm
        ]
        
        for i in 0 ..< shoesSizesEU.count{
            if shoesSizesEU[i]?.sizeInCM == theLengthOfHeel{
                euSize = shoesSizesEU[i]
                break
            }
        }
        
        print("us size: \(String(describing: usSize)), eu size \(String(describing: euSize))")
        self.resultToProfile?.shoesSize = (usSize?.usSize, euSize?.euSize)
        return (usSize?.usSize, euSize?.euSize)
    }
   
    
}
