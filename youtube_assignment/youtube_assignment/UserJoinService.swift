import Foundation
import Alamofire

struct UserJoinService {
    static let shared = UserJoinService()
    
    func join(name : String, email: String, password: String, completion: @escaping (NetworkResult<Any>)-> (Void)) {
        
        let url = APIConstants.joinURL
        
        let header : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body : Parameters = [
            "email" : email,
            "name" : name,
            "password" : password
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeLoginStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidLoginData(data: data)
        case 400: return isValidLoginData(data: data)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidLoginData(data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(JoinResponseData.self, from: data)
        else {return .pathErr(0)}
        return .success(decodedData)
    }
}
