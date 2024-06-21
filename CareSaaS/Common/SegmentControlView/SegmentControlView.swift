//
//  SegmentControlView.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI

public struct SegmentControlView: View {
    
    // MARK: - Properties
    
    private let items: [String]
    @Binding private var selection: Int
    @State private var segmentSize: CGSize = .zero
    @State private var itemTitleSizes: [CGSize] = []
    private let defaultXSpace: CGFloat?
    
    // MARK: - Initialization
    
    public init(
        items: [String],
        selection: Binding<Int>,
        defaultXSpace: CGFloat? = nil
    ) {
        self._selection = selection
        self.items = items
        self.defaultXSpace = defaultXSpace
        self._itemTitleSizes = State(initialValue: [CGSize](repeating: .zero, count: items.count))
    }
    
    // MARK: - View Conformance
    
    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            GeometryReader { geometry in
                Color
                    .clear
                    .onAppear {
                        segmentSize = geometry.size
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: 1)
            
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: xSpace) {
                    ForEach(0 ..< items.count, id: \.self) { index in
                        segmentItemView(for: index)
                    }
                }
                .padding(.bottom, 8)
            }
            
            HStack(spacing: 0) {
                Rectangle()
                    .foregroundColor(selection == 0 ? .primaryHighEmphasis : .primaryDisabled)
                    .frame(maxWidth: .infinity, maxHeight: 2)
                Rectangle()
                    .foregroundColor(selection == 1 ? .primaryHighEmphasis : .primaryDisabled)
                    .frame(maxWidth: .infinity, maxHeight: 2)
            }
        }
    }
    
    @ViewBuilder
    private func segmentItemView(for index: Int) -> some View {
        let isSelected = self.selection == index
        
        Text(items[index])
            .font(.custom(.bold, size: .size13))
            .foregroundColor(isSelected ? .primaryHighEmphasis : .primaryDisabled)
            .background(BackgroundGeometryReader())
            .onPreferenceChange(SegmentControlSizePreferenceKey.self) {
                itemTitleSizes[index] = $0
            }
            .onTapGesture { onItemTap(index: index) }
    }
    
    private func onItemTap(index: Int) {
        guard index < self.items.count else { return }
        self.selection = index
    }
    
    private var xSpace: CGFloat {
        if let defaultXSpace {
            return defaultXSpace
        }
        
        guard !itemTitleSizes.isEmpty, !items.isEmpty, segmentSize.width != 0 else { return 0 }
        let itemWidthSum: CGFloat = itemTitleSizes.map { $0.width }.reduce(0, +).rounded()
        let space = (segmentSize.width - itemWidthSum) / CGFloat(items.count + 1)
        return max(space, 0)
    }
}
