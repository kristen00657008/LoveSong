//
//  BarChart.swift
//  LoveSong
//
//  Created by User11 on 2019/11/28.
//  Copyright © 2019 User24. All rights reserved.
//

import SwiftUI

struct BarChart: View {
    @State private var height: [CGFloat] = [0,0,0,0,0,0,0]
    var scoreCount: [Double] = [50,15,23,54,10,50]
    var body: some View
    {
        HStack{
            ForEach(0..<scoreCount.count){ (index) in
                VStack{
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 25, height: self.height[index])
                        .animation(.linear(duration: 1))
                        .onAppear
                        {
                            self.height[index] = CGFloat(self.scoreCount[index]) * 10
                        }
                    Text(String(index))
                        .font(Font.system(size: 25))
                
                }.padding(.trailing,15)
            }
        }
        
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart(scoreCount: [20,15,23,54,10,50])
    }
}
