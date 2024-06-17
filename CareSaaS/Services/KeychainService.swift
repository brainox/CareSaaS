//
//  KeychainService.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import Combine
import Foundation
import KeychainAccess

final class KeychainService {

    // MARK: - Types

    private enum Keys {
        static let accessToken = "accessToken"
        static let refreshToken = "refreshToken"
    }

    // MARK: - Properties

    private let CareSaas = Keychain(service: "com.CareSaas")

    // MARK: - Access Token

    @Published private(set) var accessTokenPublisher: String?

    var accessToken: String? {
        accessTokenPublisher
    }

    func setAccessToken(_ accessToken: String) {
        accessTokenPublisher = accessToken
    }

    func resetAccessToken() {
        accessTokenPublisher = nil
    }

    // MARK: - Refresh Token

    @Published private(set) var refreshTokenPublisher: String?

    var refreshToken: String? {
        refreshTokenPublisher
    }

    func setRefreshToken(_ refreshToken: String) {
        refreshTokenPublisher = refreshToken
    }

    func resetRefreshToken() {
        refreshTokenPublisher = nil
    }

    // MARK: -

    private var subscriptions: Set<AnyCancellable> = []

    // MARK: - Initialization

    init() {
        accessTokenPublisher = CareSaas[Keys.accessToken]
        refreshTokenPublisher = CareSaas[Keys.refreshToken]

        setupBindings()
    }

    // MARK: - Helper Methods

    private func setupBindings() {
        $accessTokenPublisher
            .sink(receiveCompletion: { _ in
                ()
            }, receiveValue: { [weak self] accessToken in
                if let accessToken = accessToken {
                    self?.CareSaas[Keys.accessToken] = accessToken
                } else {
                    do {
                        try self?.CareSaas.remove(Keys.accessToken)
                    } catch {
                        print("Unable to Remove Access Token from Keychain \(error)")
                    }
                }
            }).store(in: &subscriptions)

        $refreshTokenPublisher
            .sink(receiveCompletion: { _ in
                ()
            }, receiveValue: { [weak self] refreshToken in
                if let accessToken = refreshToken {
                    self?.CareSaas[Keys.refreshToken] = accessToken
                } else {
                    do {
                        try self?.CareSaas.remove(Keys.refreshToken)
                    } catch {
                        print("Unable to Remove Refresh Token from Keychain \(error)")
                    }
                }
            }).store(in: &subscriptions)
    }

}
