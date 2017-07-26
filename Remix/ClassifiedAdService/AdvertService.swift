//  Copyright © 2017 cutting.io. All rights reserved.

import Foundation

protocol AdvertService {
    func fetchAdverts(completion: ([Advert]) -> Void)
    func fetchAdvert(for advertID: AdvertID, completion: (Advert?) -> Void)
}
