import RIBs
import SnapKit

final class RIBDataSource<RIB: ReusableBuilding> {

    typealias Content = RIB.Router.Interactable.Content
    typealias Listener = RIB.Listener

    private let rib: RIB
    private let values: [Content]
    private let presentationContext: UIViewController?

    weak var listener = WeakBox<Listener?>(value: nil)

    init(rib: RIB, values: [Content], presentationContext: UIViewController?) {

        self.rib = rib
        self.values = values
        self.presentationContext = presentationContext
    }

    func with(values: [Content]) -> RIBDataSource<RIB> {

        return RIBDataSource(rib: self.rib,
                             values: values,
                             presentationContext: self.presentationContext)
    }

    func numberOfRowsIn(section: Int) -> Int {

        return self.values.count
    }

    func dequeueReusableModuleCell<Dequeuer: RIBDequeable>(atIndexPath indexPath: IndexPath, dequeuer: Dequeuer) -> Dequeuer.RIBCell {

        let cell = dequeuer.dequeueReusableModuleCell(for: indexPath)

        if cell.router == nil {
            cell.router = self.routerFor(contentView: cell)
        }

        let value = self.values[indexPath.row]
        (cell.router?.interactable as? RIB.Router.Interactable)?.update(with: value)

        return cell
    }
}

extension RIBDataSource {

    private func routerFor(contentView: ReusableCoordinatorContainerView) -> RIB.Router {

        let router = self.rib.build(with: self.listener?.value)
        let viewController = router.viewController.uiviewController
        let presentationContext = self.presentationContext

        viewController.willMove(toParentViewController: presentationContext)
        presentationContext?.addChildViewController(viewController)
        contentView.contentView.addSubview(viewController.view)
        viewController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        viewController.didMove(toParentViewController: presentationContext)

        return router
    }
}

