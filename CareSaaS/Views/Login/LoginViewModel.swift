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
    @Published var showAlert = false
    @Published var error: Error?
    @Published var usernameState: TextFieldState = .neutral
    @Published var passwordState: TextFieldState = .neutral
    @Published var isValidLoginForm = false
    @Published var isSecured = false
    @Published var isChecked = false
    @Published var isSigningIn = false
    @Published private(set) var isSignedIn = false
    
    private let keychainService: KeychainService
    private let apiService: APIService
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    
    init(apiService: APIService, keychainService: KeychainService) {
        self.apiService = apiService
        self.keychainService = keychainService
        setupBindings()
        resetKeyChain()
        configureInputs()
    }
    
    // MARK: - Public Methods
    
    func signIn() {
        isSigningIn = true
        error = nil
        
        apiService.signIn(email: username, password: password)
            .sink { [weak self] completion in
                guard let self = self else { return }
                self.password = ""
                self.isSigningIn = false
                switch completion {
                case .finished:
                    ()
                case .failure(let error):
                    self.error = error
                }
            } receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.keychainService.setAccessToken(response.userToken?.accessToken ?? "")
            }
            .store(in: &cancellables)


//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
////            self.isSigningIn = false
////            self.error = APIError.unreachable
//            self.keychainService.setAccessToken("AnyAccessToken")
//        }
    }
}

// MARK: - Private Methods

private extension LoginViewModel {
    
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
            .debounce(for: 0.5, scheduler: RunLoop.main)
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
        .debounce(for: 0.5, scheduler: RunLoop.main)
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
}

// MARK: - Keychain Configuration

private extension LoginViewModel {
    
    func resetKeyChain() {
        keychainService.resetAccessToken()
    }
    
    private func setupBindings() {
        keychainService.$accessTokenPublisher
            .map { $0 != nil }
            .assign(to: &$isSignedIn)
    }
}
