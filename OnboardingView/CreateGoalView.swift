//
//  CreateGoalView.swift
//  LifeTarget
//
//  Created by HarrisShao on 2025/6/15.
//

import SwiftUI

struct CreateGoalView: View {
    @State var goalText: String = ""
    @State var targetDate: Date = Date()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 15) {
                goalTextView
                targetDatePickerView
            }
            .padding(.vertical, 32)
            .navigationBarItems(leading: colseBtnView, trailing: commitBtnView)
        }
        
    }
    
    private var commitBtnView: some View {
        Button {
            
        } label: {
            Text("确定")
                .bold()
                .foregroundStyle(Color(.white))
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(.green)
                .clipShape(Capsule())
            
        }

    }
    
    private var colseBtnView: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "x.circle.fill")
                .font(.title)
                .foregroundStyle(Color(.systemGray3))
        }

    }
    
    private var goalTextView: some View {
        TextField("请写下你的目标", text: $goalText)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(15)
            .padding(.horizontal)
    }
    
    private var targetDatePickerView: some View {
        VStack {
            HStack {
                Text("达成日期")
                Spacer()
                Text(targetDate.toString())
            }
            DatePicker("",
                       selection: $targetDate,
                       in: Date()...,
                       displayedComponents: .date
            )
                .datePickerStyle(.wheel)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

#Preview {
    CreateGoalView()
}
