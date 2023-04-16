//
//  MainView.swift
//  Today
//
//  Created by kxx: on 2023/04/03.
//

import SwiftUI

struct MainView: View {
    
    @State var now = Date()
    @State var showOnboarding: Bool = true
    
    
    var dif: DateComponents {
        let cal = Calendar.current
        let tomorrow = cal.date(byAdding: .day, value: 1, to: Date())!
        let mid = cal.startOfDay(for: tomorrow)
        let remainingTime = cal.dateComponents([.hour, .minute, .second], from: now, to: mid)
        return remainingTime
    }
    
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }
    
    var body: some View {
        
        VStack {
            if showOnboarding {
                OnboardingView(showOnboarding: $showOnboarding)
            } else {
                VStack(spacing: 30) {
                    todayTimer
                    
                    Text("오늘 한 일")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("앱 출시")
                    Text("일단 해보기의 기술 읽기")
                    
                    Spacer()
                }
        }
        }
    }
}
    

struct MainView_Previews: PreviewProvider {
    static var showOnboarding: Bool = true
    static var previews: some View {
        MainView()
    }
}

extension MainView {
    var todayTimer: some View {
        VStack {
            HStack {
                VStack {
                    Text("남은시간")

                    Text("\(dif.hour ?? 0):\(dif.minute ?? 0):\(dif.second ?? 0)")
                        .fontWeight(.semibold)

                }
                .frame(width: 100)
                
                VStack {
                    Text("인타임(m)")

                    Text("\(getMoney())")

                }
                .frame(width: 100)
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.horizontal, 50)
        .onReceive(timer) { value in
            self.now = value
        }
    }
    
    func getMoney() -> Int {
        let money = (dif.hour ?? 0) * 9620 + (dif.minute ?? 0) * 160
        return money
    }
    
}
