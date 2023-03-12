import Foundation

public enum InjectingMode {
    case new
    case shared
}

public struct DIContainer {
    private(set) static var factories: [ObjectIdentifier : () -> Any] = [:]
    
    private(set) static var shared: [ObjectIdentifier: Any] = [:]
    
    private init() {}
    
    public static func register<T>(_ type: T.Type = T.self, _ factory: @escaping () -> T) {
        self.factories[ObjectIdentifier(type)] = factory
    }
    
    public static func register<T>(_ type: T.Type, _ factory: @autoclosure @escaping () -> T) {
        self.factories[ObjectIdentifier(type)] = factory
    }
    
    public static func locate<T>(_ type: T.Type, locatingMode: InjectingMode) -> T {
        let key = ObjectIdentifier(type)
        
        switch locatingMode {
        case .new:
            return self.factories[key]!() as! T
        case .shared:
            guard let sharedInstance = self.shared[key] as? T else {
                let instance = self.factories[key]!() as! T
                
                self.shared[key] = instance
                
                return instance
            }
            
            return sharedInstance
        }
    }
}

@propertyWrapper
public struct Injectable<Service> {
    
    public let mode: InjectingMode
    
    public init(_ mode: InjectingMode = .shared) {
        self.mode = mode
    }
    
    public var wrappedValue: Service {
        get {
            return DIContainer.locate(Service.self, locatingMode: mode)
        }
    }
}
