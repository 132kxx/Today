//
//  MainView.swift
//  Today
//
//  Created by kxx: on 2023/04/03.
//

import SwiftUI

struct MainView: View {
    
    @State var now = Date()
    
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
        VStack(spacing: 30) {
            todayTimer
            
            Text("오늘 한 일")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("앱 개발 10분이라도 했음;;")
            Text("책 한 구절 읽음")

            
            
            Spacer()
            
        }
    }
}
    

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension MainView {
    var todayTimer: some View {
        VStack {
            VStack {
                Text("남은돈")
                
                Text("\(dif.hour ?? 0):\(dif.minute ?? 0):\(dif.second ?? 0)")
                    .fontWeight(.semibold)

            }
            .frame(width: 100)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.horizontal, 50)
        .onReceive(timer) { value in
            self.now = value
        }
    }
    
    
}
