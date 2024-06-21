//
//  HomeView.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel = HomeViewModel(apiService: APIClient(), keychainService: KeychainService())
    @State var select: Int = 0
    let items = ["Medication", "Activities"]
    
    // MARK: - View Conformance
    
    var body: some View {
        content
            .padding()
            .alert(viewModel.error?.localizedDescription ?? "Error", isPresented: Binding(value: $viewModel.error)) {
                Button("OK"){}
            }
    }
    
    var content: some View {
        VStack {
            topView
            clockSection
            SegmentControlView(items: items, selection: $select)
                .padding(.vertical, 24)
            switch viewModel.state {
            case .empty:
                Text("No Data")
                    .apply(theme: .bodyMediumSolidEmphasis)
            case .loading:
                ProgressView()
                    .progressViewStyle(.circular)
            case .loaded(let array):
                if select == 0 {
                    medicationView
                } else {
                    activitiesView
                }
            }
            Spacer()
        }
    }
    
    var medicationView: some View {
        List(viewModel.tasks, id: \.id) { task in
            ListCellView(title: task.action ,
                         assignee: task.taskAssignments.first?.assignee.firstName ?? "",
                         door: task.workStatus ,
                         bed: task.supportLevel ,
                         time: task.timeOfDay )
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
        }
        .listRowSpacing(15)
        .listStyle(.plain)
    }
    
    var activitiesView: some View {
        List(viewModel.tasks, id: \.id) { task in
            ListCellView(title: task.action ,
                         assignee: task.taskAssignments.first?.assignee.firstName ?? "",
                         door: task.workStatus ,
                         bed: task.supportLevel ,
                         time: task.timeOfDay )
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
        }
        .listRowSpacing(15)
        .listStyle(.plain)
    }
    
    var topView: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(viewModel.welcomeMessage)
                    .apply(theme: .labelPrimarySubTitle)
                Text("Clock-in to begin your task")
                    .apply(theme: .bodyMediumSecondaryEmphasis)
            }
            Spacer()
            Image("notification", bundle: nil)
        }
        .padding(.bottom, 20)
    }
    
    @ViewBuilder
    var clockSection: some View {
        if viewModel.clockedIn {
            clockOutSection
        } else {
            clockInButton
        }
    }
    
    var clockInButton: some View {
        VStack {
            CustomButton(title: "Clock-in", color: .primaryHighEmphasis) {
                viewModel.toggleClockIn()
            }
        }
    }
    
    var clockOutSection: some View {
        HStack {
            takeABreakButton
            Spacer()
            clockOutButton
        }
    }
    
    var takeABreakButton: some View {
        CustomButton(title: "Take a Break", color: .backgroundYellow)
    }
    
    var clockOutButton: some View {
        CustomButton(title: "Clock-out", color: .backgroundRed) {
            viewModel.toggleClockIn()
        }
    }
}

//#Preview {
//    HomeView()
//}
