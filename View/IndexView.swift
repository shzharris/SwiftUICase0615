//
//  IndexView.swift
//  LifeTarget
//
//  Created by HarrisShao on 2025/6/15.
//

import SwiftUI

struct IndexView: View {
    
    @ObservedObject var goalViewModel: GoalViewModel
    
    
    
    var body: some View {
        // 视图布局
        ZStack {
            Color(.systemGray6).edgesIgnoringSafeArea(.all)
            goalCardListView
        }
        .onAppear() {
            goalViewModel.fetchGoals()
        }
        
    }
    
    
    private var goalCardListView: some View {
        TabView {
            ForEach(goalViewModel.goals) { goal in
                GoalCardView(
                    goalText: goal.goalText!,
                    targetDate: goal.targetDate! ,
                    currentProgress: Int(goal.currentProgess)
                )
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
    
}

// 目标卡片
struct GoalCardView: View {
    var goalText: String
    var targetDate: Date
    var currentProgress: Int

    var body: some View {
        VStack(spacing: 48) {
            VStack(spacing: 20) {
                goalTextView
                goalLabelView
                untilTargetDayView
            }
            subjectImageView
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.white)
        .cornerRadius(16)
        .padding()
    }
    
    private var goalTextView: some View {
        Text(goalText)
            .font(.system(size: 28))
            .bold()
            .lineLimit(1)
    }
    
    private var goalLabelView: some View {
        Label(targetDate.toString() + "前", systemImage: "calendar")
            .foregroundColor(.gray)
    }
    
    private var untilTargetDayView: some View {
        Text("剩余 \(Date().daysUntilDate(targetDate)) 天")
            .foregroundColor(.white)
            .bold()
            .padding()
            .background(.orange)
            .clipShape(Capsule())
    }
    
    private var subjectImageView: some View {
        Image("donghua")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 320)
    }
    
    
}

#Preview {
    IndexView(goalViewModel: GoalViewModel())
}
