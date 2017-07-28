//  Copyright © 2017 cutting.io. All rights reserved.

import Foundation
import Entity

public func makeAdvert(advertID: AdvertID, title: String? = nil, groupID: GroupID? = nil) -> Advert {
    return Advert(advertID: advertID, title: title ?? "dummy title", groupID: groupID ?? "0")
}
