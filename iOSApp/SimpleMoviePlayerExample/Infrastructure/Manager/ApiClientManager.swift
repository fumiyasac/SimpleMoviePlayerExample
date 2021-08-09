//
//  ApiClientManager.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/07/22.
//

import Foundation
import RxSwift

// MARK: - Enum

// MEMO: APIリクエストに関するEnum定義
enum HTTPMethod {
    case GET
    case POST
    case PUT
    case DELETE
}

// MEMO: APIエラーメッセージに関するEnum定義
enum APIError: Error {
    case error(String)
}

// MEMO: APIリクエストの状態に関するEnum定義
enum APIRequestState {
    case none
    case requesting
    case success
    case error
}

// MARK: - Class

final class ApiClientManager {
    
    // MEMO: API Mock ServerへのURLに関する情報
    private static let host = "http://localhost:8080/api"
    private static let version = "v1"
    private static let path = "simple_movie"

    private let session = URLSession.shared

    // MARK: - Singleton Instance

    static let shared = ApiClientManager()

    private init() {}

    // MARK: - Enum

    enum EndPoint: String {
        case banners = "banners"
        case news = "news"
        case mainMovies = "main_movies"
        case featuredMovies = "featured_movies"

        func getBaseUrl() -> String {
            return [host, version, path, self.rawValue].joined(separator: "/")
        }
    }

    // MARK: - Function

    func executeAPIRequest<T: Decodable>(endpointUrl: String, withParameters: [String : Any] = [:], httpMethod: HTTPMethod = .GET, responseFormat: T.Type) -> Single<T> {

        var urlRequest: URLRequest
        switch httpMethod {
        case .GET:
            urlRequest = makeGetRequest(endpointUrl)
        case .POST:
            urlRequest = makePostRequest(endpointUrl, withParameters: withParameters)
        default:
            fatalError()
        }
        return handleDataTask(T.self, request: urlRequest)
    }

    // MARK: - Private Function

    private func handleDataTask<T: Decodable>(_ dataType: T.Type, request: URLRequest) -> Single<T> {

        return Single<T>.create(subscribe: { singleEvent in

            // MEMO: API通信結果のハンドリング処理では、成功または失敗かのいずれかのイベントを1度だけ流すことを保証する形にする
            let task = self.session.dataTask(with: request) { data, response, error in
                // MEMO: 通信状態等に起因するエラー発生時のエラーハンドリング
                if let error = error {
                    singleEvent(.failure(error))
                    return
                }
                // MEMO: ステータスコードの精査及びエラーハンドリング
                if let response = response as? HTTPURLResponse, case 400...500 = response.statusCode {
                    singleEvent(.failure(APIError.error("Error: StatusCodeが200~399以外です。")))
                    return
                }

                // MEMO: 取得データの内容の精査及びエラーハンドリング
                guard let data = data else {
                    singleEvent(.failure(APIError.error("Error: レスポンスが空でした。")))
                    return
                }
                // MEMO: 取得できたレスポンスを引数で指定した型の配列に変換して受け取る
                do {
                    let hashableObjects = try JSONDecoder().decode(T.self, from: data)
                    singleEvent(.success(hashableObjects))
                } catch {
                    singleEvent(.failure(APIError.error("Error: JSONからのマッピングに失敗しました。")))
                }
            }
            task.resume()

            return Disposables.create {
                task.cancel()
            }
        })
    }

    // API Mock ServerへのGETリクエストを作成する
    private func makeGetRequest(_ urlString: String) -> URLRequest {
        guard let url = URL(string: urlString) else {
            fatalError()
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let authraizationHeader = "Bearer "
        if !authraizationHeader.isEmpty {
            urlRequest.addValue(authraizationHeader , forHTTPHeaderField: "Authorization")
        }
        return urlRequest
    }

    // API Mock ServerへのPOSTリクエストを作成する
    private func makePostRequest(_ urlString: String, withParameters: [String : Any] = [:]) -> URLRequest {
        guard let url = URL(string: urlString) else {
            fatalError()
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        // MEMO: Dictionaryで取得したリクエストパラメータをJSONに変換している
        do {
            let requestBody = try JSONSerialization.data(withJSONObject: withParameters, options: [])
            urlRequest.httpBody = requestBody
        } catch {
            fatalError("Invalid request body parameters.")
        }
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let authraizationHeader = "Bearer "
        if !authraizationHeader.isEmpty {
            urlRequest.addValue(authraizationHeader , forHTTPHeaderField: "Authorization")
        }
        return urlRequest
    }
}
