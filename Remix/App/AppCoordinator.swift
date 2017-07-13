//  Copyright © 2017 cutting.io. All rights reserved.

import Foundation

class AppCoordinator {

    private let navigator: Navigator
    private var discovery: DiscoveryCoordinator?

    init(navigator: Navigator) {
        self.navigator = navigator
    }

    func start() {
        let wireframe = DiscoveryListViewFakeWireframe()
        let dependencies = DiscoveryCoordinatorDependencies(navigator: navigator, discoveryListViewWireframe: wireframe)
        discovery = DiscoveryCoordinator(dependencies: dependencies)
        discovery?.start()
    }
}
