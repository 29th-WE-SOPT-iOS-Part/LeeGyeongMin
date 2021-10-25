import UIKit

class DelegatePracticeVC: UIViewController {

    // MARK: - TextField
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - ImageView
    @IBOutlet weak var partImageView: UIImageView!
    
    // MARK: - PickerView
    @IBOutlet weak var partPickerView: UIPickerView!

    var partList : [PartData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPartData()
        initPartLayout()
        textField.delegate = self
        partPickerView.dataSource = self //pickerview의 데이터를 제어하는 기능을 뷰컨에 위임
        partPickerView.delegate = self
    }
    
    func initPartLayout(){
        partImageView.image = partList[0].makeImage()
        textField.text = partList[0].partName
    }
    
    func initPartData(){
        partList.append(contentsOf: [
            PartData(imageName: "wesoptiOSPart", partName: "iOS"),
            PartData(imageName: "wesoptAndroidPart", partName: "Android"),
            PartData(imageName: "wesoptWebPart", partName: "Web"),
            PartData(imageName: "wesoptServerPart", partName: "Server"),
            PartData(imageName: "wesoptDesignPart", partName: "Design"),
            PartData(imageName: "wesoptPlanPart", partName: "Plan")
        ])
    }
}


extension DelegatePracticeVC : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.endEditing(true)
        return true
    }
}

extension DelegatePracticeVC : UIPickerViewDataSource {
    
    //pickerView의 component 숫자를 지정해주는 메소드
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //pickerView의 각 component의 행의 개수를 지정해주는 메소드
    //알람어플 component 개수 3개, component 0은 row 12, 2는 60 3은 2(AM,PM)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return partList.count
    }
    
    
}

extension DelegatePracticeVC : UIPickerViewDelegate { //진짜 pickerview 안의 내용 동작!
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return partList[row].partName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        partImageView.image = partList[row].makeImage()
        textField.text = partList[row].partName
        
    }
    
}
