//
//  LittleLemonService.swift
//  LittleLemonApp
//
//  Created by Roman Dashchakivskyi on 15.06.2024.
//

import Foundation

protocol LittleLemonAPIServiceProtocol {
    func fetchMenu() async throws -> Menu
}

class LittleLemonAPIService: LittleLemonAPIServiceProtocol {
    static let shared = LittleLemonAPIService()
    private let session: URLSession = .shared

    func fetchMenu() async throws -> Menu {
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        return try await fetchData(from: url)
    }

    private func fetchData<T: Decodable>(from url: URL) async throws -> T {
        let (data, _) = try await session.data(from: url)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}

