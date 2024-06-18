//
//  HomeViewModel.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    
    // MARK: - Properties
    
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
        let assignee = UserDefaults.getAssignee()
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
                self.tasks = tasks.data
            }
            .store(in: &cancellables)

    }
}
