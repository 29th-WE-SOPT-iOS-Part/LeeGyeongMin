import Foundation

//서버 통신 결과로 받는 응답 body를 디코딩할 데이터 모델

// MARK: - LoginResponseData
struct LoginResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}

// MARK: - LoginResultData
struct LoginResultData: Codable {
    let id: Int
    let name, email: String
}
