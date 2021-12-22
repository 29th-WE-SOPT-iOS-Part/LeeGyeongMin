import Foundation

// MARK: - LoginResponseData
struct LoginResponseData : Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}

// MARK: - LoginResultData
struct LoginResultData : Codable {
    let id: Int
    let name, email: String
}
