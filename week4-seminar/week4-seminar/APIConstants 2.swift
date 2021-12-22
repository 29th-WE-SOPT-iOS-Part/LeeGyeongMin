import Foundation

//API 주소 모음 struct

struct APIConstants{
    
    // MARK: - Base URL
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    // MARK: - Feature URL
    static let loginURL = baseURL + "/user/login"
    static let readUserURL = baseURL + "/user/"
}
