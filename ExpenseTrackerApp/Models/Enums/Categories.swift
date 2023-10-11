//
//  Categories.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 30.5.23..
//

import Foundation

enum Categories: String, CaseIterable, Identifiable {
    case bills, salary, food, shopping, entertainment, cafes, car, hygiene, health, pets, vacation, other
    
    var id: Categories { self }
}
