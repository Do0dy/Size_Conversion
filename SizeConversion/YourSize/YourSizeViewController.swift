//
//  YourSizeViewController.swift
//  SizeConversion
//
//  Created by Dody on 16/09/1445 AH.
//

import UIKit

class YourSizeViewController: UIViewController {
    
    @IBOutlet weak var resulrsView: UISegmentedControl!
    
    @IBOutlet weak var resultText: UILabel!
    
    var viewModel : YourSizeViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageBackground()
        self.resultText.text = "your size in US Standard is:\n \(String(describing: (self.viewModel.theResult!.usSize)!))"

    }
    
    @IBAction func swichResult(_ sender: Any) {
        let sigValue = self.resulrsView.titleForSegment(at: self.resulrsView.selectedSegmentIndex)
        //print(sigValue)

        if sigValue == "US Standard"{
            self.resultText.text = "your size in US Standard is:\n \(String(describing: (self.viewModel.theResult!.usSize)!))"
        }else{
            self.resultText.text = "your size in EU Standard is:\n \(String(describing: (self.viewModel.theResult!.euSize)!))"
        }
    }
    
    @IBAction func backToHome(_ sender: Any) {
       navigationController?.popToRootViewController(animated: true)
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
}
