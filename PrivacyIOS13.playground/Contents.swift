import UIKit
import CoreBluetooth



class Security: UIViewController, CBCentralManagerDelegate {
    let centralManager = CBCentralManager(delegate: self, queue: <#T##DispatchQueue?#>, options: nil)
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        let authorizationStatus = central.authorization
        
        switch authorizationStatus {
        case .notDetermined:
            <#code#>
        default:
            <#code#>
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        func authorizationController(controller _:ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
            if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
                let realUserStatus = credential.realUserStatus
                switch realUserStatus {
                case .unsupported:
                   // ...
                case .unknown:
                  //  ...
                case .likelyReal
                    //...
    
                }
            }
        }
    }
    
}
