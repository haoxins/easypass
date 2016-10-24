
import LocalAuthentication
import UIKit

class BaseView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan

        authTouchId()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func initView() {
        // noop
    }

    func authTouchId() {
        var err: NSError?
        let ctx = LAContext()

        let ok = ctx.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &err)
        if !ok {
            alert("Error", message: "can't use TouchID")
            return
        }

        ctx.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "who are you ?", reply: {
            (success, error) -> Void in
            if success {
                self.initView()
                return
            }

            self.alert("Error", message: error!.localizedDescription)
        })
    }

    func alert(_ title: String, message: String) {
        self.present(newAlert(title: title, message: message), animated: true, completion: nil)
    }

}

func newAlert(title: String, message: String, ok: String = "OK") -> UIAlertController {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: ok, style: .default, handler: nil)
    alertController.addAction(alertAction)
    return alertController
}
