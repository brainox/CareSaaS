//
//  HomeView.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel(apiService: APIClient(), keychainService: KeychainService())
    @State var select: Int = 0
    let items = ["Medication", "Activities"]
    
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
            if select == 0 {
                MedicationView(tasks: viewModel.tasks)
               
            } else {
                ActivitiesView(tasks: viewModel.tasks)
            }
            Spacer()
        }
    }
    
    var topView: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text("Hi, George!")
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
