import UIKit

fileprivate extension UIScene {
    var windowScene: UIWindowScene? {
        self as? UIWindowScene
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - UI
    var window: UIWindow?
    private let navigationController = UINavigationController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        scene.windowScene
            .flatMap(UIWindow.init)
            .flatMap({ window in
                self.window = window
                window.makeKeyAndVisible()
                window.backgroundColor = .white
                window.rootViewController = navigationController
                navigationController.pushViewController(ViewController(), animated: true)
            })
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}
