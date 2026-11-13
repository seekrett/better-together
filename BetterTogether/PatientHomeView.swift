//
//  PatientHomeView.swift
//  BetterTogether
//
//  Created by Zephyr Consumido on 11/13/26.
//

import SwiftUI

struct PatientHomeView: View {
    
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
                .padding()
                .glassEffect(.regular.tint(.blue).interactive())
        }
    }
    
    var responseOptionsView: some View {
        HStack {
            Button("Mood") {}
            Button(action: {
                viewModel.showOptions = false
            }) {
                Image(systemName: "xmark")
            }
            Button("Symptoms") {}
        }
    }
}

#Preview {
    PatientHomeView()
}
