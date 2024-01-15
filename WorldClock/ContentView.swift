//
//  ContentView.swift
//  WorldClock
//
//  Created by Tetsuo Kawakami on 2024/01/16.
//

import SwiftUI

struct ContentView: View {

    @State private var tokyoTime = ""
    @State private var londonTime = ""
    @State private var losAngelesTime = ""
    
    private let tokyoTimeZone = TimeZone(identifier: "Asia/Tokyo")!
    private let londonTimeZone = TimeZone(identifier: "Europe/London")!
    private let losAngelesTimeZone = TimeZone(identifier: "America/Los_Angeles")!

    var body: some View {
        VStack {
            Text("Tokyo Time: \(tokyoTime)")
            Text("London Time: \(londonTime)")
            Text("LosAngeles Time: \(losAngelesTime)")
        }
        .padding()
        .onAppear {
            // updateTimes()
            // 更新間隔を設定する場合は、タイマーを使用して自動的に更新できます。
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                updateTimes()
            }
        }
    }
    
    private func updateTimes() {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium

        dateFormatter.timeZone = tokyoTimeZone
        tokyoTime = dateFormatter.string(from: Date())
        
        dateFormatter.timeZone = londonTimeZone
        londonTime = dateFormatter.string(from: Date())
        
        dateFormatter.timeZone = losAngelesTimeZone
        losAngelesTime = dateFormatter.string(from: Date())
    }
}

#Preview {
    ContentView()
}
