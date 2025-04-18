//
//  NetworkManager.swift
//  CoinUS_SwiftUI
//
//  Created by Lee Wonsun on 4/18/25.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let session: URLSession
    private let decoder = JSONDecoder()
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10.0
        self.session = URLSession(configuration: configuration)
    }
    
    func request<T: Decodable>(url: URL, method: HTTPMethod = .get) async throws -> T {
          // URLRequest 생성
          var request = URLRequest(url: url)
          request.httpMethod = method.rawValue
          request.addValue("application/json", forHTTPHeaderField: "Accept")
          
          // 네트워크 요청 수행
          let (data, response) = try await session.data(for: request)
          
          // 응답 확인
          guard let httpResponse = response as? HTTPURLResponse else {
              throw CoinError.invalidResponse
          }
          
          // 상태 코드 확인
          guard (200...299).contains(httpResponse.statusCode) else {
              throw CoinError.serverError(statusCode: httpResponse.statusCode)
          }
          
          // JSON 디코딩
          do {
              let decoder = JSONDecoder()
              
              return try decoder.decode(T.self, from: data)
          } catch {
              throw CoinError.decodingFailed(error)
          }
      }
}
