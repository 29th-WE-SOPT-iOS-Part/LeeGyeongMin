import Foundation


//서버 통신 결과 처리를 위한 열거형
enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
