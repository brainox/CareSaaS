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
    let apiService: APIService
    @Published var clockedIn: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    init(apiService: APIService) {
        self.apiService = apiService
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
    
    func getTasks() {
        let assignee = UserDefaults.getAssignee()
        apiService.getAllTasks(assignee: assignee)
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    ()
                case .failure(let error):
                    print("error is \(error)")
                }
            } receiveValue: { [weak self] tasks in
                guard let self = self else { return }
                print("The tasks are: \(tasks)")
            }
            .store(in: &cancellables)

    }
}
