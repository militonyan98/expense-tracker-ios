//
//  SortType.swift
//  ExpenseTrackerApp
//
//  Created by Hermine Militonyan on 6.6.23..
//

import Foundation

enum SortType: String, CaseIterable {
    var id: String { rawValue }
    
    case date, alphabetical, amountAscending, amountDescending, type
}
