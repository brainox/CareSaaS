//
//  LoginViewModel.swift
//  CareSaaS
//
//  Created by Obinna on 15/06/2024.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var username = ""
    @Published var password = ""
    @Published var usernameState: TextFieldState = .neutral
    @Published var passwordState: TextFieldState = .neutral
    @Published var isValidLoginForm = false
    @Published var isSecured = false
    @Published var isChecked = false
    @Published var isSigningIn = false
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    
    init() {
        configureInputs()
    }
    
    // MARK: - Public Methods
    
    func signIn() {
        isSigningIn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.isSigningIn = false
        }
    }
}

// MARK: - Private Methods

private extension LoginViewModel {
    
    var isUsernameValidPublisher: AnyPublisher<Bool, Never> {
        $username
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { username in
                return username.count >= 4
            }
            .eraseToAnyPublisher()
    }
    
    
    var isPasswordValidPublisher: AnyPublisher<Bool, Never> {
        $password
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { password in
                return password.count >= 8
            }
            .eraseToAnyPublisher()
    }
    
    var isLoginFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isUsernameValidPublisher, isPasswordValidPublisher)
            .map { isUsernameValid, isPasswordValid in
                return isUsernameValid && isPasswordValid
            }
            .eraseToAnyPublisher()
    }
    
    var usernameStatePublisher: AnyPublisher<TextFieldState, Never> {
      $username
        .debounce(for: 0.8, scheduler: RunLoop.main)
        .removeDuplicates()
        .map { username in
          if username.isEmpty {
            return .neutral
          }
          
          return username.count >= 4 ? .valid: .invalid
        }
        .eraseToAnyPublisher()
    }
        
    var passwordStatePublisher: AnyPublisher<TextFieldState, Never> {
      $password
        .debounce(for: 0.8, scheduler: RunLoop.main)
        .removeDuplicates()
        .map { password in
          if password.isEmpty {
            return .neutral
          }
          
          return password.count >= 8 ? .valid: .invalid
        }
        .eraseToAnyPublisher()
    }
    
    func configureInputs() {
        isLoginFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValidLoginForm, on: self)
            .store(in: &cancellables)
        
        usernameStatePublisher
            .receive(on: RunLoop.main)
            .assign(to: \.usernameState, on: self)
            .store(in: &cancellables)
            
          passwordStatePublisher
            .receive(on: RunLoop.main)
            .assign(to: \.passwordState, on: self)
            .store(in: &cancellables)
    }
}
