import UIKit

struct ChannelContentData {
    let channelName : String
    let channelProfileIconName : String
    
    func makeImage() -> UIImage?{
        return UIImage(named: channelProfileIconName)
    }
}
