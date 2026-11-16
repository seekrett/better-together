//
//  PatientHomeView.swift
//  BetterTogether
//
//  Created by Zephyr Consumido on 11/13/26.
//

import SwiftUI

struct PatientHomeView: View {
    
    @Environment(\.theme) private var theme
    
    @State private var viewModel = PatientHomeViewModel()
    
    var body: some View {
        Text("Hello, \(viewModel.patientName)!")
        Text("How are you feeling today?")
        if !viewModel.showOptions { replyButton }
            else { responseOptionsView }
    }
    
    var replyButton: some View {
        Button(action: {
            viewModel.showOptions = true
        }) {
            Text("Reply")
                .foregroundStyle(.white)
                .frame(width: 90, height: 90)
                .glassEffect(
                    .regular.tint(.cyan).interactive(),
                    in: Circle()
                )
        }
    }
    
    var responseOptionsView: some View {
        HStack {
            Button(action: {
                viewModel.showMoodSheet = true
            }) {
                Text("Mood")
                    .foregroundStyle(.white)
                    .padding()
                    .glassEffect(.regular.tint(.cyan).interactive())
            }
            Button(action: {
                viewModel.showOptions = false
            }) {
                Image(systemName: "xmark")
            }
            Button(action: {
                viewModel.showSymptomsSheet = true
            }) {
                Text("Symptoms")
                    .foregroundStyle(.white)
                    .padding()
                    .glassEffect(.regular.tint(.cyan).interactive())
            }
        }
    }
}

#Preview {
    PatientHomeView()
}
