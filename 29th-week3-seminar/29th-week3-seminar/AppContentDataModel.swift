import UIKit

struct AppContentData{
    let appName : String
    let description : String
    let appIconName : String
    
    func makeImage() -> UIImage? {
        return UIImage(named: appIconName)
    }
}
