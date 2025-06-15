//
//  OnboardingView.swift
//  LifeTarget
//
//  Created by HarrisShao on 2025/6/15.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var selectTabIndex:Int = 0
    @State var showCreateGoalView: Bool = false
    
    let sheetHeight = UtilsView.screenHeight * 2 / 3
    
    var body: some View {
        VStack(spacing: 48, content: {
            tabPageView
            if selectTabIndex == 2 {
                startBtnView
            }
            
        })
        .sheet(isPresented: $showCreateGoalView) {
            CreateGoalView()
                .presentationDetents([.height(sheetHeight)])
        }
    }
    
    private var tabPageView:some View {
        TabView(selection: $selectTabIndex, content: {
            OnboardingPageView(imageName: "donghua", title: "目标打卡1", description: "看见每一天1").tag(0)
            OnboardingPageView(imageName: "donghua", title: "目标打卡2", description: "看见每一天2").tag(1)
            OnboardingPageView(imageName: "donghua", title: "目标打卡3", description: "看见每一天3").tag(2)
        })
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .animation(.default, value: selectTabIndex)
        
    }
    
    private var startBtnView: some View {
        Button {
            self.showCreateGoalView.toggle()
        } label: {
            Label("Start", systemImage: "paperplane")
                .foregroundStyle(.white)
                .bold()
                .frame(width: 150, height: 50)
                .background(.black)
                .clipShape(Capsule())
        }

    }
}

struct OnboardingPageView: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        VStack(spacing: 32) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 320)
            
            VStack(spacing: 15, content: {
                Text(title)
                    .font(.title)
                    .bold()
                
                Text(description)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.gray)
            })
        }
        .padding(.horizontal)
    }
    
}

#Preview {
    OnboardingView()
}
