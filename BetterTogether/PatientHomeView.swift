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
    @State private var animate = false
    
    var body: some View {
        VStack(spacing: 40) {
            Image("Cloud")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            headline
            if !viewModel.showOptions { replyButton }
                else { responseOptionsView }
        }
    }
    
    var headline: some View {
        VStack {
            Text("Hello, \(viewModel.patientName)!")
            Text("How are you feeling today?")
        }
    }
    
    var replyButton: some View {
        Button {
            print("Reply tapped")
            viewModel.showOptions = true
        } label: {
            Text("Reply")
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(.white)
                .frame(width: 90, height: 90)
                .glassEffect(
                    .regular.tint(.cyan).interactive(),
                    in: Circle()
                )
        }
        .buttonStyle(.plain)
        .background {
            Circle()
                .stroke(.cyan.opacity(0.8), lineWidth: 2)
                .frame(width: 100, height: 100)
                .shadow(color: .cyan.opacity(0.8), radius: 12)
                .shadow(color: .blue.opacity(0.5), radius: 24)
                .scaleEffect(animate ? 1.25 : 1.0)
                .opacity(animate ? 0.2 : 0.9)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5).repeatForever()) {
                animate = true
            }
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
