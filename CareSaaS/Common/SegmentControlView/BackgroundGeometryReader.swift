//
//  BackgroundGeometryReader.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI

struct BackgroundGeometryReader: View {
    public init() {}
    
    public var body: some View {
        GeometryReader { geometry in
            return Color
                .clear
                .preference(key: SegmentControlSizePreferenceKey.self, value: geometry.size)
        }
    }
}
