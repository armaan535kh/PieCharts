//
//  ContentView.swift
//  PieCharts
//
//  Created by Armaan Khan  on 14/09/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Chart {
                    ForEach(MockData.revenueStreams) { stream in
                        SectorMark(angle: .value("Stream", stream.value),
                                   //innerRadius: .ratio(0.618),
                                   outerRadius: stream.name == "Sponsors" ? 180:120,
                                   angularInset: 1.0
                        )
                        .foregroundStyle(stream.color)
                        .cornerRadius(6)
                    }
                }
                .chartLegend(.hidden)
            }
            .padding()
            .navigationTitle("Revenue")
        }
    }
}

#Preview {
    ContentView()
}

struct RevenueStream: Identifiable {
    let id = UUID()
    let name: String
    let value: Double
    let color: Color
}

struct MockData {
    static var revenueStreams: [RevenueStream] = [
        .init(name: "Adsense", value: 806, color: .teal),
        .init(name: "Courses", value: 17855, color: .pink),
        .init(name: "Sponsors", value: 4000, color: .indigo),
        .init(name: "Consulting", value: 2500, color: .purple)
        ]
}
