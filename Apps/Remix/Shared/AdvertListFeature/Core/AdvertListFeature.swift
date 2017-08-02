//  Copyright © 2017 cutting.io. All rights reserved.

import Wireframe
import Entity
import Service

class AdvertListFeature {

    struct Dependencies {
        let advertService: AdvertService
        let groupService: GroupService
        let advertListViewFactory: AdvertListViewFactory
    }

    private let deps: Dependencies

    init(dependencies: Dependencies) {
        deps = dependencies
    }

    func makeCoordinatorUsing(navigationWireframe: NavigationWireframe) -> AdvertListCoordinator {
        let coordinatorDeps = AdvertListCoordinator.Dependencies(
            navigationWireframe: navigationWireframe,
            interactor: makeInteractor(),
            formatter: makeFormatter(),
            viewFactory: deps.advertListViewFactory
        )
        return AdvertListCoordinator(dependencies: coordinatorDeps)
    }

    private func makeInteractor() -> AdvertListInteractor {
        return AdvertListInteractor(advertService: deps.advertService, groupService: deps.groupService)
    }

    private func makeFormatter() -> AdvertListFormatter {
        return AdvertListFormatter()
    }
}
