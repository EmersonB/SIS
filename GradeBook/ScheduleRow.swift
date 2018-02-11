import UIKit
import Eureka

final class ScheduleRow: Row<ScheduleInfoCell>, RowType {
    required init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<ScheduleInfoCell>(nibName: "ScheduleInfoCell")
    }
}

