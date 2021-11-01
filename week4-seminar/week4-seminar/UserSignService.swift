import Foundation
import Alamofire

struct UserSignService{
    static let shared = UserSignService() //singleton 객체 (앱 어디서든 접근 가능하게)
    
    //escaping closure---
    func login(email: String, password: String, completion: @escaping (NetworkResult<Any>) -> (Void)){
        
        let url = APIConstants.loginURL //통신할 API 주소
        
        let header : HTTPHeaders = [ //요청 헤더
            "Content-Type" : "application/json"
        ]
        
        let body : Parameters = [ //요청 body (Dictionary Type)
            "email" : email,
            "password" : password
        ]
        
        let dataRequest = AF.request(url, method: .post, //HTTP Method
                                     parameters: body, //요청 바디
                                     encoding: JSONEncoding.default,
                                     headers: header //요청 헤더
        )
        
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
    
    func readUserData(userId : Int,completion: @escaping (NetworkResult<Any>) -> (Void)){
        //URL을 통한 요청이라 URL이랑 header만 있으면 된다
        let url = APIConstants.readUserURL + "\(userId)"
        let header : HTTPHeaders = [ //요청 헤더
            "Content-Type" : "application/json"
        ]
        
        let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default,
                                     headers: header)
        
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
        
//위 방법과 똑같은 closure 구현방법
//        dataRequest.responseData(completionHandler: { response in
//
//        })
        
        //get과 post큰 차이는 header의 유무, url 전달 body의 유무
    }
    
    private func judgeLoginStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode{
        case 200: return isVaildLoginData(data: data)
        case 400: return .pathErr //client 오류 (존재하지 않는 이메일이나 맞지 않는 비번) -> 우리쪽 문제
        case 500: return .serverErr //서버 오류 (서버쪽 문제)
        default: return .networkFail
        }
    }
    
    private func isVaildLoginData(data: Data) -> NetworkResult<Any>{
        //json 해독해서 swift로 번역하여 처리하기 위함
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LoginResponseData.self, from: data)
        else {return .pathErr}
        return .success(decodedData)
        
    }
}

