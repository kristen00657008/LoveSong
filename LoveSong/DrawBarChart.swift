//
//  DrawBarChart.swift
//  LoveSong
//
//  Created by User20 on 2019/11/29.
//  Copyright © 2019 User24. All rights reserved.
//

import SwiftUI

struct DrawBarChart: View {
    var scoreCount: [Double]
    var body: some View {
        HStack
        {
            ZStack(alignment: .leading)
            {
                Path
                {
                    (path) in
                    path.move(to: CGPoint(x: -15, y: 250))
                    path.addLine(to: CGPoint(x: -15, y: 575))
                    path.addLine(to: CGPoint(x: 300, y: 575))
                }
                .stroke(Color.black, lineWidth: 2)
                starText().offset(x: -50)
                BarChart(scoreCount: scoreCount).offset(y:85)
            }
        }
        .offset(x: 70, y:50)
    }
}

struct starText: View
{
    var body: some View
    {
        Group
        {
            Text("0").offset(x:15, y:170)
            Text("10").offset(y:115)
            Text("20").offset(y:65)
            Text("30").offset(y:15)
            Text("40").offset(y:-35)
            Text("50").offset(y:-85)
            Text("60").offset(y:-135)
        }
        .font(Font.system(size: 25))
    }
}
struct BarChart: View {
    @State private var height: [CGFloat] = [0,0,0,0,0,0,0]
    var scoreCount: [Double] = [0,0,0,0,0,0]
    var body: some View
    {
        HStack{
            ForEach(0..<scoreCount.count){ (index) in
                VStack{
                    Text(String(Int(self.scoreCount[index])))
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 25, height: self.height[index])
                        .animation(.linear(duration: 1))
                        .onAppear
                        {
                            self.height[index] = CGFloat(self.scoreCount[index]) * 5
                        }
                    Text(String(index))
                        .font(Font.system(size: 25))
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 20, height:20)
                        .foregroundColor(Color.yellow)
                        .offset(y:-10)
                }
                .padding(.trailing,10)
                .offset(x:10, y: 102 + CGFloat(self.scoreCount[index] * -2.5))
            }
        }
    }
}

struct DrawBarChart_Previews: PreviewProvider {
    static var previews: some View {
        DrawBarChart(scoreCount:  [10,20,30,40,50,60])
    }
}
