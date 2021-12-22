import Foundation

// MARK: - JoinResponseData
struct JoinResponseData : Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: JoinResultData?
}

// MARK: - JoinResultData
struct JoinResultData: Codable {
    let id: Int
    let name, email: String
}
