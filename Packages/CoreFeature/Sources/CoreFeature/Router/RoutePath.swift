//
//  File.swift
//  
//
//  Created by Anh Son Le on 11/03/2023.
//

import Foundation
import Combine

public class RoutePath: ObservableObject {
    @Published public var path: [RouteDestination] = []
    @Published public var sheetPath: SheetDestination?
    private var disposeBag = Set<AnyCancellable>()
    
    public static let share = RoutePath()
    
    private init() {
        $path.sink { routes in
            print("Path: \(routes)")
        }
        .store(in: &disposeBag)
    }
    
    deinit {
        disposeBag.removeAll()
    }
    
    public func navigate(to destination: RouteDestination) {
        path.append(destination)
    }
    
    public func present(with destination: SheetDestination) {
        sheetPath = destination
    }
}
