import Foundation

struct KeyManager {
    private let keyFilePath = Bundle.main.path(forResource: "APIKey", ofType: "plist")
    
    func getKeys() -> NSDictionary? {
        guard let keyFilePath = keyFilePath else {
            print("APIKey.plist not found")
            return nil
        }
        return NSDictionary(contentsOfFile: keyFilePath)
    }
    
    func getValue(key: String) -> String? {
        guard let keys = getKeys(),
              let value = keys[key] as? String else {
            print("Key '\(key)' not found or invalid")
            return nil
        }
        return value
    }
}