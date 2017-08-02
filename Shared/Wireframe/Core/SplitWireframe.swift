//  Copyright © 2017 cutting.io. All rights reserved.

import Foundation

public protocol SplitWireframe: Viewable {
    var master: Viewable? { get set }
    var detail: Viewable? { get set }
}