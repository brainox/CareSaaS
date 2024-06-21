//
//  RootView.swift
//  CareSaaS
//
//  Created by Obinna on 15/06/2024.
//

import SwiftUI

struct RootView: View {
    
    // MARK: - Properties
    
    private let keychainService = KeychainService()
    
    // MARK: - View Conformance
    
    var body: some View {
        LoginView(viewModel: LoginViewModel(apiService: APIClient(), keychainService: keychainService))
    }
}

#Preview {
    RootView()
}
