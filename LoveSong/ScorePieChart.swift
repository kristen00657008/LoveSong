//
//  ScorePieChart.swift
//  LoveSong
//
//  Created by User20 on 2019/11/25.
//  Copyright © 2019 User24. All rights reserved.
//

import SwiftUI

struct PieChart: Shape {
    var startAngle: Angle
    var endAngle: Angle
    func path(in rect: CGRect) ->Path {
        Path { (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

struct ScorePieChart: View {
    @ObservedObject var songsData = SongsData()
    var scoreDataPersentages : [Double]
    var angles: [Angle]
    
    init(scoreDataPersentages: [Double]) {
        self.scoreDataPersentages = scoreDataPersentages
        angles = [Angle]()
        var startDegree: Double = 0
        for scoreDataPersentage in scoreDataPersentages {
            angles.append(.degrees(startDegree))
            startDegree += 360 * scoreDataPersentage / 100
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                ForEach(angles.indices) { (index) in
                    if index == 5 {
                        PieChart(startAngle:self.angles[index], endAngle: .zero)
                            .fill(Color.orange)
                        PieChart(startAngle:self.angles[index], endAngle: .zero)
                            .stroke(Color.white, lineWidth: 2)
                    }
                    else {
                        PieChart(startAngle:self.angles[index], endAngle: self.angles[index+1])
                            .fill(Color.orange)
                        PieChart(startAngle:self.angles[index], endAngle: self.angles[index+1])
                            .stroke(Color.white, lineWidth: 2)
                    }
                }
            }
        }
        .navigationBarTitle("圓餅圖")
    }
}

struct ScorePieChart_Previews: PreviewProvider {
    static var previews: some View {
        ScorePieChart(scoreDataPersentages: [0,0,0,0,0,0])
    }
}
