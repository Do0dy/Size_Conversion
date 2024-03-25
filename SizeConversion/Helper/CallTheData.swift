
import Foundation


class CallTheData{
    
    
    func readJSONFile(completion: @escaping (SizeModel?) -> Void)  {
        
        guard let sizeFileURL = Bundle.main.url(forResource: "Size_Standards", withExtension: "json") else{
            print("not found Json file")
            completion(nil)
            return
        }
            
            do{
                let sizeData = try Data(contentsOf: sizeFileURL)
                //print("data: \(String(describing: String(data: sizeData, encoding: .utf8) ) ?? "Empty" )")

                let decoder = JSONDecoder()
                let sizes = try decoder.decode(SizeModel.self, from: sizeData)
                print("sizes: \(sizes.sizeStandards.count )")
                completion(sizes)
            }catch{
                print(error)
                completion(nil)

            }
        
    }//end
        
        
        
        
        //]var sizes : SizeModel!
//        do{
//            guard let sizeFilePath = Bundle.main.url(forResource: "Size_Standards", withExtension: "json") else {
//                fatalError("Could not find Size_Standards.json")
//            }
//            guard let sizeData = try? Data(contentsOf: sizeFilePath)else {
//                fatalError("Could not find conver data")
//            }
//            
//            guard let sizes = try? JSONDecoder().decode(SizeModel.self, from: sizeData) else {
//                fatalError("There was a problem decoding the data ......")
//            }
//            print(sizes.sizeStandards?.count)
//            completion(sizes)
//
//        }
//        if let sizes = try JSONSerialization.jsonObject(with: sizeData, options: .mutableLeaves) as? [String:Any]{
//            let t = try? JSONDecoder().decode(SizeModel.self, from: sizeData)
//            print("JSON: \(sizes.keys)")
//            print("data: \(String(describing: t))")
//            //completion(try SizeModel(from: sizes ))
//        }else{
//            print("not valid")
//        }
        
//        URLSession.shared.dataTask(with: sizeFilePath){
//            (data , URLResponse, error) in
//            if let data = data{
//                do{
//                    let sizes = try! JSONDecoder().decode(SizeModel.self, from: data)
//                    print("sizes is Empty?  \(String(describing: sizes.sizeStandards?.isEmpty))")
//                    completion(sizes)
//                }
//            }
//        }.resume()
        
        
        

        //print("sizes unit is: \(String(describing: sizes.theUnit))")
//               let jsonData = try String(contentsOfFile: path).data(using: .utf8) {
//                 sizes = try JSONDecoder().decode(SizeModel.self, from: jsonData)
//                print("sizes unit is: \(String(describing: sizes.theUnit))")
        
    }
    

