import RIBs

final class RIBCollectionViewDataSource<RIB: ReusableBuilding>: NSObject, BindableCollectionViewDataSource {

    typealias Content = RIB.Router.Interactable.Content
    typealias Listener = RIB.Listener
    
    private let ribDataSource: RIBDataSource<RIB>

    var listener: Listener? {
        get {
            return self.ribDataSource.listener?.value
        }
        set {
            self.ribDataSource.listener?.value = newValue
        }
    }

    init(rib: RIB, values: [Content] = [], presentationContext: UIViewController?) {

        self.ribDataSource = RIBDataSource(rib: rib,
                                              values: values,
                                              presentationContext: presentationContext)
    }

    private init(ribDataSource: RIBDataSource<RIB>) {

        self.ribDataSource = ribDataSource
    }

    func with(values: [Content]) -> RIBCollectionViewDataSource<RIB> {

        return RIBCollectionViewDataSource(ribDataSource: self.ribDataSource.with(values: values))
    }

    func bind(collectionView: UICollectionView) {

        collectionView.register(UICollectionView.RIBCell.self)
        collectionView.dataSource = self
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return self.ribDataSource.numberOfRowsIn(section: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        return self.ribDataSource.dequeueReusableModuleCell(atIndexPath: indexPath, dequeuer: collectionView)
    }
}
