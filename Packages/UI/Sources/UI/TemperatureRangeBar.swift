//
//  File.swift
//  
//
//  Created by Anh Son Le on 11/03/2023.
//

import SwiftUI

public struct TemperatureRangeBar: View {
    private let outerTemperatureRange: ClosedRange<Double>
    private let innerTemperatureRange: ClosedRange<Double>
    
    
    public init(outerTemperatureRange: ClosedRange<Double>, innerTemperatureRange: ClosedRange<Double>) {
        self.outerTemperatureRange = outerTemperatureRange
        self.innerTemperatureRange = innerTemperatureRange
    }
    
    public var body: some View {
        HStack(alignment: .center) {
            // MARK: - Lowest label
            Text("\(innerTemperatureRange.lowerBound.rounded().formatted())")
                .font(.title3)
                .frame(width: 34, alignment: .center)
            
            // MARK: - Bar
            GeometryReader { geometry in
                // Fill with gradient color from cold to hot
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .leading, endPoint: .trailing))
                  .frame(width: geometry.size.width * CGFloat((innerTemperatureRange.upperBound - innerTemperatureRange.lowerBound) / (outerTemperatureRange.upperBound - outerTemperatureRange.lowerBound)), height: 4)
                  .padding([.leading], geometry.size.width * CGFloat((innerTemperatureRange.lowerBound - outerTemperatureRange.lowerBound) / (outerTemperatureRange.upperBound - outerTemperatureRange.lowerBound)))
            }
            .background(Color.gray.opacity(0.7))
            .frame(height: 4)
            .padding(.horizontal, 8)
            
            // MARK: - Hightest label
            Text("\(innerTemperatureRange.upperBound.rounded().formatted())")
                .font(.title3)
                .frame(width: 34, alignment: .center)
        }
        .frame(maxWidth: .infinity)
    }
}

struct TemperatureRangeBar_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureRangeBar(outerTemperatureRange: -10...30, innerTemperatureRange: 0...25)
            .previewLayout(.fixed(width: 150, height: 50))
    }
}
