//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

public class UINavigationWireframeFactory: NavigationWireframeFactory {

    public init() {}

    public func make() -> NavigationWireframe {
        return UINavigationWireframe()
    }
}

// Implements the NavigationWireframe for use with UIKit components (using a UINavigationController).
public class UINavigationWireframe: UINavigationController, NavigationWireframe {

    private var popCheckpoints = [UIViewController]()

    public init() {
        super.init(nibName: nil, bundle: nil)
        delegate = self
    }

    public required init?(coder aDecoder: NSCoder) {
        preconditionFailure("use init()")
    }

    public func push(view: Navigatable) {
        guard let viewController = view.viewController else { return }
        pushViewController(viewController, animated: true)
    }

    public func popToLastCheckpoint() {
        popToLastCheckpoint(animated: true)
    }

    public func popToLastCheckpoint(animated: Bool) {
        if let popCheckpoint = popCheckpoints.popLast() {
            popToViewController(popCheckpoint, animated: animated)
        } else {
            popToRootViewController(animated: animated)
        }
    }

    public func setPopCheckpoint() {
        guard let popPoint = topViewController else { return }
        popCheckpoints.append(popPoint)
    }
}

extension UINavigationWireframe: UINavigationControllerDelegate {

    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        guard
            let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(fromViewController)
        else {
            return
        }

        guard let navigatable = fromViewController as? Navigatable else { return }

        navigatable.navigationWireframeDidGoBack()
    }
}
