//
//  HomeViewModel.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var clockedIn: Bool = false
    
    // MARK: - Public methods
    
    func toggleClockIn() {
        withAnimation(.easeInOut) {
            clockedIn.toggle()
        }
    }
}
