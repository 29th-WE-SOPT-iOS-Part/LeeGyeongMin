import UIKit

struct FunctionContentData {
    let functionContentName : String
    let functionContentIconName : String
    
    func makeImage() -> UIImage?{
        return UIImage(named: functionContentIconName)
    }
}
