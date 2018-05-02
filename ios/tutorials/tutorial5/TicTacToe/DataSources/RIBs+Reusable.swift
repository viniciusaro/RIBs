import RIBs

protocol ReusableRouting: Routing {
    associatedtype Interactable: ReusableInteractable
    var interactor: Interactable { get }
    var viewController: ViewControllable { get }
}

protocol ReusableInteractable: Interactable {
    associatedtype Content
    func update(with content: Content)
}

protocol ReusableBuilding: Buildable {
    associatedtype Router: ReusableRouting
    associatedtype Listener
    func build(with listener: Listener?) -> Router
}

extension ReusableBuilding {
    func build() -> Router {
        return self.build(with: nil)
    }
}

final class WeakBox<T> {
    var value: T
    init(value: T) {
        self.value = value
    }
}
