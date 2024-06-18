//
//  HomeViewModel.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    
    // MARK: - Enum
    
    enum State: Equatable {
        case empty
        case loading
        case loaded([Tasks])
    }
    
    // MARK: - Properties
    
    @Published private(set) var state: State = .empty
    @Published var tasks: [Tasks] = []
    @Published var error: Error?
    @Published var clockedIn: Bool = false
    
    private let apiService: APIService
    private let keychainService: KeychainService
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    init(apiService: APIService, keychainService: KeychainService) {
        self.apiService = apiService
        self.keychainService = keychainService
        getTasks()
    }
    
    // MARK: - Computed Properties
    
    var welcomeMessage: String {
        let userName = UserDefaults.getDefaults(for: Environment.userName)
        let message = "Hi, \(userName)"
        return message
    }
    
    // MARK: - Public methods
    
    func toggleClockIn() {
        withAnimation(.easeInOut) {
            clockedIn.toggle()
        }
    }
}

// MARK: - Private Methods

private extension HomeViewModel {
    
    func resetKeyChain() {
        keychainService.resetAccessToken()
    }
    
    func getTasks() {
        self.state = .loading
        let assignee = UserDefaults.getDefaults(for: Environment.assignee)
        apiService.getAllTasks(assignee: assignee)
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    ()
                case .failure(let error):
                    self.error = error
                }
            } receiveValue: { [weak self] tasks in
                guard let self = self else { return }
                let response = tasks.data
                if response.isEmpty {
                    self.state = .empty
                } else {
                    self.state = .loaded(response)
                }
            }
            .store(in: &cancellables)

    }
}
