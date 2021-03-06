import UIKit

class HomeVC: UIViewController,UIGestureRecognizerDelegate, myTableViewDelegate {
    
    // MARK: - TableView
    @IBOutlet weak var videoTableView: UITableView!
    
    // MARK: - CollectionView
    @IBOutlet weak var channelCollectionView: UICollectionView!
    @IBOutlet weak var functionCollectionView: UICollectionView!
    
    // MARK: - View
    @IBOutlet weak var logoVIew: UIView!
    
    // MARK: - ImageView
    @IBOutlet weak var logoImageView: UIImageView!
    
    // MARK: - Button
    @IBOutlet weak var windowSharingButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var userProfileButton: UIButton!
    
    var videoContentList : [VideoContentData] = []
    var channelContentList : [ChannelContentData] = []
    var functionContentList : [FunctionContentData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVideoContentList()
        initChannelContentList()
        initFunctionContentList()
        registerXib()
        initDelegates()
    }

    func registerXib() {
        let xibName = UINib(nibName: videoTableViewCell.identifier, bundle: nil)
        videoTableView.register(xibName, forCellReuseIdentifier: videoTableViewCell.identifier)
    }
    
    func initDelegates(){
        videoTableView.dataSource = self
        videoTableView.delegate = self
        
        channelCollectionView.dataSource = self
        channelCollectionView.delegate = self
        
        functionCollectionView.dataSource = self
        functionCollectionView.delegate = self
    }
    
    func initVideoContentList(){
        videoContentList.append(contentsOf: [
            VideoContentData(videoTitle: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", videoInfo: "WE SOPT ・조회수 100만회 ・ 3주 전", videoImageIconName: "wesoptiOSPart", videoCreatorIconName: "wesoptProfile"),
            VideoContentData(videoTitle: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", videoInfo: "WE SOPT ・조회수 100만회 ・ 3주 전", videoImageIconName: "wesoptiOSPart", videoCreatorIconName: "wesoptProfile"),
            VideoContentData(videoTitle: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", videoInfo: "WE SOPT ・조회수 100만회 ・ 3주 전", videoImageIconName: "wesoptiOSPart", videoCreatorIconName: "wesoptProfile"),
            VideoContentData(videoTitle: "4차 iOS 세미나 : Cocoapods & Networking, REST API", videoInfo: "WE SOPT ・조회수 100만회 ・ 3주 전", videoImageIconName: "wesoptiOSPart", videoCreatorIconName: "wesoptProfile"),
            VideoContentData(videoTitle: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화", videoInfo: "WE SOPT ・조회수 100만회 ・ 3주 전", videoImageIconName: "wesoptiOSPart", videoCreatorIconName: "wesoptProfile")
        ])
    }
    
    func initChannelContentList(){
        channelContentList.append(contentsOf: [
            ChannelContentData(channelName: "iOSPart", channelProfileIconName: "ggamju1"),
            ChannelContentData(channelName: "AndroidPart", channelProfileIconName: "ggamju2"),
            ChannelContentData(channelName: "ServerPart", channelProfileIconName: "ggamju3"),
            ChannelContentData(channelName: "WebPart", channelProfileIconName: "ggamju4"),
            ChannelContentData(channelName: "DesignPart", channelProfileIconName: "ggamju5"),
            ChannelContentData(channelName: "PlanPart", channelProfileIconName: "ggamju6")
        ])
    }
    
    func initFunctionContentList(){
        functionContentList.append(contentsOf: [
            FunctionContentData(functionContentName: "전체"),
            FunctionContentData(functionContentName: "오늘"),
            FunctionContentData(functionContentName: "이어서 시청하기"),
            FunctionContentData(functionContentName: "시청하지 않음"),
            FunctionContentData(functionContentName: "실시간"),
            FunctionContentData(functionContentName: "게시물")
        ])
    }
    
    @IBAction func touchUpToGoLogin(_ sender: Any) {

        let mainSB = UIStoryboard.init(name: "Main", bundle: nil)
        guard let nextVC = mainSB.instantiateViewController(withIdentifier: "NavigationController") as? UINavigationController else {return}
        
        nextVC.modalPresentationStyle = .fullScreen
        
        self.present(nextVC, animated: true, completion: nil)
       
    }
    
    func myTableViewDelegate(videoToPresent: VideoContentData) {
        print("tapped\n\n\n")
        guard let passVC = UIStoryboard(name: "Pass", bundle: nil).instantiateViewController(withIdentifier: "PassVC") as? PassVC else { return }
        passVC.passedVideo = videoToPresent
        passVC.modalPresentationStyle = .fullScreen
        self.present(passVC, animated: true, completion: nil)
    }
    
//    @objc func imageViewTapped(gestureRecognizer: UIGestureRecognizer){
//        guard let passVC = UIStoryboard(name: "Pass", bundle: nil).instantiateViewController(withIdentifier: "PassVC") as? PassVC else { return }
//        passVC.modalPresentationStyle = .fullScreen
//        self.present(passVC, animated: true, completion: nil)
//    }
}

// MARK: - TableView manage
extension HomeVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
}

extension HomeVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoContentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: videoTableViewCell.identifier) as? videoTableViewCell else {return UITableViewCell()}
        
        cell.delegate = self
        cell.setData(videoData: videoContentList[indexPath.row])
        return cell
    }
}

// MARK: - CollectionView manage
extension HomeVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView == channelCollectionView) {
            return channelContentList.count
        }
        else {
            return functionContentList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == channelCollectionView) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCollectionViewCell.identifier, for: indexPath)
                    as? ChannelCollectionViewCell else {return UICollectionViewCell()}

            cell.setData(creatorName: channelContentList[indexPath.row].channelName, creatorProfile: channelContentList[indexPath.row].makeImage())
            return cell
        }

        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FunctionCollectionViewCell.identifier, for: indexPath) as? FunctionCollectionViewCell else {return UICollectionViewCell()}

            cell.setData(functionName: functionContentList[indexPath.row].functionContentName)
            return cell
        }
    }
}


extension HomeVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        
        if (collectionView == channelCollectionView) {
            let cellWidth : CGFloat = 72
            let cellHeight = channelCollectionView.frame.height
            return CGSize(width: cellWidth, height: cellHeight)
        }
        else {
            guard let cell = functionCollectionView.dequeueReusableCell(withReuseIdentifier: FunctionCollectionViewCell.identifier, for: indexPath) as?  FunctionCollectionViewCell else {return .zero}
            
            cell.functionNameLabel.text = functionContentList[indexPath.row].functionContentName
            cell.functionNameLabel.sizeToFit()
            
            let cellWidth = cell.functionBorderView.frame.width + 10
            let cellHeight = functionCollectionView.frame.height
            
            return CGSize(width: cellWidth, height: cellHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
