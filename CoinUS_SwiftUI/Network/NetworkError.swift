//
//  NetworkError.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/18/25.
//

import Foundation

enum CoinError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case requestFailed(Error)
    case decodingFailed(Error)
    case serverError(statusCode: Int)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL: return "유효하지 않은 URL입니다."
        case .invalidResponse: return "유효하지 않은 응답입니다."
        case .invalidData: return "유효하지 않은 데이터입니다."
        case .requestFailed(let error): return "요청에 실패했습니다: \(error.localizedDescription)"
        case .decodingFailed(let error): return "응답 디코딩에 실패했습니다: \(error.localizedDescription)"
        case .serverError(let statusCode): return "서버 에러 (상태 코드: \(statusCode))"
        }
    }
}
