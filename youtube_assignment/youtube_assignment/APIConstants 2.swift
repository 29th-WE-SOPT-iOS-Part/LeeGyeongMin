import Foundation

struct APIConstants {
    
    // MARK: - Base URL
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    // MARK: - Feature URL
    static let loginURL = baseURL + "/user/login"
    static let joinURL = baseURL + "/user/signup"
}
