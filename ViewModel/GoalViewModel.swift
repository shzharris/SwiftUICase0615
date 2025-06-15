//
//  GoalViewModel.swift
//  LifeTarget
//
//  Created by HarrisShao on 2025/6/15.
//

import SwiftUI
import CoreData

class GoalViewModel: ObservableObject {
    @Published var goals: [Goal] = []

    func fetchGoals() {
        let context  = Persistence.shared.container.viewContext
        let fetchRequest:NSFetchRequest<Goal> = Goal.fetchRequest()
        
        do {
            goals = try context.fetch(fetchRequest)
            
        } catch {
            print("Failed to fetch goals:\(error.localizedDescription)")
        }
    }
}
