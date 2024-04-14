
import UIKit

class GenderViewController: UIViewController {
    
    var viewModel : GenderViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = GenderViewModel()
        setImageBackground()
        
    }
    
    @IBAction func chooseMaleSetAndGoNext(_ sender: Any) {
        //to send male set in all size Standards to next view
            let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
            let sendGenderSet = storyboard.instantiateViewController(withIdentifier: "ClothesID") as! ClothesViewController
            sendGenderSet.viewModel = ClothesViewModel(chosenGender: "male")
            navigationController?.pushViewController(sendGenderSet, animated: true)

    }
    
    @IBAction func chooseFemaleSetAndGoNext(_ sender: Any) {
        //to send female set in all size Standards to next view
            let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
            let sendGenderSet = storyboard.instantiateViewController(withIdentifier: "ClothesID") as! ClothesViewController
            sendGenderSet.viewModel = ClothesViewModel(chosenGender: "female")
            navigationController?.pushViewController(sendGenderSet, animated: true)
        
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

