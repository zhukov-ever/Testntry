import UIKit

public extension UIView {

    class func loadFromNib() -> Self {
        guard let result = viewFromNib(view: self) else {
            let className = String(describing: self.self)
            fatalError(".xib does not exist for \(className)")
        }
        return result
    }
    
    class func loadFromNibOrInit() -> Self {
        return viewFromNib(view: self) ?? self.init()
    }

}

private func viewFromNib<T: UIView>(view: T.Type) -> T? {
    let bundle = Bundle(for: T.self)
    let className = String(describing: T.self)

    guard bundle.path(forResource: className, ofType: "nib") != nil
        else { return nil }

    guard let nibContent = bundle.loadNibNamed(className, owner: nil)
        else { return nil }

    for element in nibContent {
        if let element = element as? T {
            return element
        }
    }

    return nil
}
