//
//  Binding+Extensions.swift
//  CareSaaS
//
//  Created by Obinna on 17/06/2024.
//

import SwiftUI

extension Binding where Value == Bool {
    
    init<T>(value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}
