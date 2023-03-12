//
//  File.swift
//  
//
//  Created by Anh Son Le on 11/03/2023.
//

import Foundation

import Model

public enum RouteDestination: Hashable {
    case dashboard
}

public enum SheetDestination: Hashable {
    case dayDetail(Date, DayWeatherDTO)
}

extension RouteDestination: Identifiable {
    public var id: String {
        String(describing: self)
    }
}
extension SheetDestination: Identifiable {
    public var id: String {
        String(describing: self)
    }
}
