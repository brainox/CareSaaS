//
//  SegmentControlSizePreferenceKey.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI

struct SegmentControlSizePreferenceKey: PreferenceKey {
    
    public typealias Value = CGSize
    public static var defaultValue: Value = .zero
    
    public static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}
