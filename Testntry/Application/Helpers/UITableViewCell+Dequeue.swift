import UIKit

extension UITableView {

    private func identifier(cellType: Any) -> String {
        return String(describing: cellType)
    }

    public func register<T: UITableViewCell>(cellType: T.Type) {
        let identifier = self.identifier(cellType: T.self)
        register(UINib(nibName: identifier, bundle: nil),
                 forCellReuseIdentifier: String(describing: identifier))
    }

    public func register<T: UITableViewHeaderFooterView>(viewType: T.Type) {
        let identifier = self.identifier(cellType: T.self)
        register(UINib(nibName: identifier, bundle: nil),
                 forHeaderFooterViewReuseIdentifier: identifier)
    }

    public func dequeue<T: UITableViewCell>(indexPath: IndexPath) -> T {
        let identifier = self.identifier(cellType: T.self)
        let anyCell = dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        guard let cell = anyCell as? T else { fatalError() }
        return cell
    }

    public func dequeue<T: UITableViewHeaderFooterView>(section: Int) -> T {
        let identifier = self.identifier(cellType: T.self)
        let anyView = dequeueReusableHeaderFooterView(withIdentifier: identifier)
        guard let view = anyView as? T else { fatalError() }
        return view
    }

}
