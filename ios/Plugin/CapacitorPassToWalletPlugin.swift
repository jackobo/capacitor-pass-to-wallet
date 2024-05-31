import Foundation
import Capacitor
import PassKit

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(CapacitorPassToWalletPlugin)
public class CapacitorPassToWalletPlugin: CAPPlugin {
    private let implementation = CapacitorPassToWallet()

    @objc func addToWallet(_ call: CAPPluginCall) {
            let data = call.getArray("base64PassesContent") ?? [];

            var pkPasses = [PKPass]()

            for passBase64Content in data {
                if let dataPass = Data(base64Encoded: passBase64Content as! String, options: .ignoreUnknownCharacters){
                    if let pass = try? PKPass(data: dataPass){
                        pkPasses.append(pass)
                    }
                }
            }

            if pkPasses.count > 0 {
                if let vc = PKAddPassesViewController(passes: pkPasses) {
                            self.bridge?.viewController?.present(vc, animated: true, completion: nil);
                            call.resolve();
                        }
            } else {
                call.reject("No passes provided");
            }
        }
}