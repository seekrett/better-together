//
//  PatientHomeViewModel.swift
//  BetterTogether
//
//  Created by Zephyr Consumido on 11/13/26.
//
import Foundation

@MainActor
@Observable
final class PatientHomeViewModel {
    var patientName: String = "JOHN DOE"
    var showOptions: Bool = false
    var showMoodSheet: Bool = false
    var showSymptomsSheet: Bool = false
}
