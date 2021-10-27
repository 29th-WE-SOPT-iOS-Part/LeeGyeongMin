import UIKit

struct VideoContentData {
    let videoTitle : String
    let videoInfo : String
    let videoImageIconName : String
    let videoCreatorIconName : String
    
    func makeImageForVideo() -> UIImage? {
        return UIImage(named: videoImageIconName)
    }
    
    func makeImageForCreator() -> UIImage? {
        return UIImage(named: videoCreatorIconName)
    }
}
