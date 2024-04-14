
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

}
    

