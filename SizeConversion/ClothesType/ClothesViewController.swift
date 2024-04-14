
import UIKit

class ClothesViewController: UIViewController {
    
    var viewModel : ClothesViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setImageBackground()
    }
    // to send what the split is chose
    @IBAction func upperSplitSet(_ sender: Any) {
        self.pushToNext(setGender: self.viewModel.theGender, setType: "upperSplit")
    }
    
    @IBAction func downSplitSet(_ sender: Any) {
       self.pushToNext(setGender: self.viewModel.theGender, setType: "downSplit")
    }
    
    @IBAction func shoesSet(_ sender: Any) {
        self.pushToNext(setGender: self.viewModel.theGender, setType: "shoes")
    }
    
    func pushToNext(setGender: String, setType: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let bodySizeVC = storyboard.instantiateViewController(withIdentifier: "SizesID") as! BodySizeViewController
        bodySizeVC.viewModel = BodySizeViewModel(setGender: setGender, setType: setType)
        navigationController?.pushViewController(bodySizeVC, animated: true)
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
