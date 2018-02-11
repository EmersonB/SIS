import UIKit
import Eureka

final class UserInfoRow: Row<UserInfoCell>, RowType {
    required init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<UserInfoCell>(nibName: "UserInfoCell")
    }
}
