//
//  DayForecastView.swift
//  MiniWeather
//
//  Created by Anh Son Le on 11/03/2023.
//

import SwiftUI

import Model

struct DayForecastView: View {
    private let date: Date
    private let dailyWeather: DayWeatherDTO?
    
    @Environment(\.dismiss) private var dismiss
    
    init(date: Date, dailyWeather: DayWeatherDTO?) {
        self.date = date
        self.dailyWeather = dailyWeather
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(date.formatted(.dateTime.day().month().year()))
                    .font(.title2)
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            ZStack(alignment: .center) {
                Text(String(describing: dailyWeather))
                    .padding(.horizontal, 20)
            }
            Spacer()
        }
    }
}

struct DayForecastView_Previews: PreviewProvider {
    static var previews: some View {
        DayForecastView(date: Date.now, dailyWeather: nil)
    }
}
