import UIKit

struct PartData{
    var imageName : String
    var partName : String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
