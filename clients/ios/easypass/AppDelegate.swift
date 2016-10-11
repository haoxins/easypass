
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: Any]?) -> Bool {
        navigationController = UINavigationController()
        navigationController!.navigationBar.isHidden = true

        let main: UIViewController = ListView()

        self.navigationController!.pushViewController(main, animated: false)

        self.window = UIWindow(frame: UIScreen.main.bounds)

        self.window!.rootViewController = navigationController

        self.window!.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
