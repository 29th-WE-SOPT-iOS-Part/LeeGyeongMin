import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr(T)
    case serverErr
    case networkFail
}
