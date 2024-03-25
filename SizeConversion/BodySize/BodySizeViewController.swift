//
//  BodySizeViewController.swift
//  SizeConversion
//
//  Created by Dody on 16/09/1445 AH.
//

import UIKit

class BodySizeViewController: UIViewController {

    @IBOutlet weak var input1: UITextField!
    
    @IBOutlet weak var input2: UITextField!
        
    var viewModel : BodySizeViewModel!
    
    var sendToProfile: profileDataModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.viewModel.theSplit!)
        setImageBackground()
        self.sendToProfile = profileDataModel()
        //let tabbar = tabBarController as! homeTabBarViewController
        switch(self.viewModel.theSplit){
        case "upperSplit":
            self.input1.placeholder = "Enter the chest size"
            self.input2.placeholder = "Enter the waist size"
        case "downSplit":
            self.input1.placeholder = "Enter the waist size"
            self.input2.placeholder = "Enter the hip size"
        case "shoes":
            self.input1.placeholder = "Enter the toe to back of heel size"
            self.input2.isHidden = true
        default:
            print("erorr")
            return
        }
    }
    
    func getSizeResult() -> (usSize: String?, euSize: String?)?{
        //UserDefaults.standard.setValue(self.viewModel.theGender, forKey: "theGender")

        if self.input1.text != ""{
            switch(self.viewModel.theSplit){
            case "upperSplit":
                let upperSplitSize = self.viewModel.theApproximateSizeForUpperSplit(theChest: Int(self.input1.text!)!, theWaist: Int(self.input2.text!)!)
                
                //let upArr = [upperSplitSize?.usSize,upperSplitSize?.euSize]
               // UserDefaults.standard.setValue(upArr, forKey: "upperSplitSize")
                return upperSplitSize
                
            case "downSplit":
                self.input1.placeholder = "Enter the waist size"
                self.input2.placeholder = "Enter the hip size"
                let downSplitSize = self.viewModel.theApproximateSizeForDownSplit(theWaist: Int(self.input1.text!)!, theHip: Int(self.input2.text!)!)

                return downSplitSize

            case "shoes":
                self.input1.placeholder = "Enter the toe to back of heel size"
                self.input2.isHidden = true
                let shoesSize = self.viewModel.theApproximateSizeForShoes(theLengthOfHeel: Double(self.input1.text!)!)

                //let shoArr = [shoesSize?.usSize,shoesSize?.euSize]
                //UserDefaults.standard.setValue(shoArr, forKey: "shoesSize")
                
                return shoesSize

            default:
                print("erorr")
            }
        }
        return ("","")

    }

    @IBAction func getTheResult(_ sender: Any) {
        var resultSet: (usSize: String?, euSize: String?)?
        if (((self.input1.text) != "") ){
            resultSet =  getSizeResult()
        }
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        let sendResult = storyboard.instantiateViewController(withIdentifier: "ResultID") as! YourSizeViewController
        sendResult.viewModel = YourSizeViewModel(resultSizes: resultSet)
        navigationController?.pushViewController(sendResult, animated: true)
        
    }
    
    func setImageBackground(){
        let background = UIImage(named: "background")
        let imageView = UIImageView(frame: view.bounds)
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    @IBAction func howToSizeYourBody(_ sender: Any) {
//        let info = UIAlertController(title: "How to size your body", message: "", preferredStyle: .alert)
//        var t = "Measure your foot like the attached picture"
//        let okAction = UIAlertAction(title: "OK", style: .default)
//        
//        info.addAction(okAction)
//        present(info, animated: true, completion: nil)
    }
    
}
