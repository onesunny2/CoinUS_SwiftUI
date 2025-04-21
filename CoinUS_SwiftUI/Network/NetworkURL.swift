//
//  NetworkURL.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/21/25.
//

import Foundation

enum NetworkURL {
    case market(ids: [String])
    
    private var baseURL: String {
        switch self {
        case .market: return "https://api.coingecko.com"
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .market: return .get
        }
    }
    
    private var path: String {
        switch self {
        case .market: return "/api/v3/coins/markets"
        }
    }
    
    private var parameters: [String: String]? {
        switch self {
        case let .market(ids):
            let idsToString = ids.joined(separator: ",")
            return ["vs_currency": "KRW", "ids": idsToString, "sparkline": "true"]
        }
    }
    
    private var headers: [String: String] {
        let headers = ["x-cg-demo-api-key": apiKey]
        return headers
    }
    
    func createURLRequest() throws -> URLRequest {
        // 전체 URL 문자열 조합
               let urlString = baseURL + path
               
               // URL 객체 생성
               guard let url = URL(string: urlString) else {
                   throw URLError(.badURL)
               }
               
               var request = URLRequest(url: url)
               request.httpMethod = method.rawValue
               
               // 헤더 추가
               for (key, value) in headers {
                   request.setValue(value, forHTTPHeaderField: key)
               }
               
               // 파라미터 처리
               if let parameters = parameters {
                   switch method {
                   case .get:
                       // GET 요청에서는 쿼리 파라미터로 추가
                       var components = URLComponents(string: urlString)
                       components?.queryItems = parameters.map {
                           URLQueryItem(name: $0.key, value: "\($0.value)")
                       }
                       if let url = components?.url {
                           request.url = url
                       }
                   case .post, .put:
                       // POST, PUT 요청에서는 JSON 바디로 추가
                       let jsonData = try JSONSerialization.data(withJSONObject: parameters)
                       request.httpBody = jsonData
                   default:
                       break
                   }
               }
               
               return request
    }
}
