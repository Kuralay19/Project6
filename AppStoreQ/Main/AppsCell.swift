//
//  AppsCell.swift
//  AppStoreQ
//
//  Created by Smart Castle M1A2004 on 09.12.2023.
// command + n = create new file
import UIKit
class AppsCell: UICollectionViewCell {
    var appData: FeedModel? {
        didSet{
            DispatchQueue.main.async {
                self.horizontalCollectionView.reloadData()
            }
        }
    }
    lazy var horizontalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var didSelectHandler: ((Int) -> ())?
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupCollectionView()
        setupUI()
    }
    func setupCollectionView() {
        horizontalCollectionView.delegate = self
        horizontalCollectionView.dataSource = self
        horizontalCollectionView.backgroundColor = .white
        horizontalCollectionView.register(AppRowCell.self, forCellWithReuseIdentifier: "cellid")
        horizontalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        horizontalCollectionView.isPagingEnabled = true
        if let flowlayout = horizontalCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.scrollDirection = .horizontal
        }
    }
    func setupUI() {
        addSubview(horizontalCollectionView)
        horizontalCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        horizontalCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        horizontalCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        horizontalCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension AppsCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! AppRowCell
        cell.configure(appData?.results [indexPath.item])
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let perCellHeight = 90.0
        
        let cellWidth = collectionView.frame.width - 10
        return CGSize(width: cellWidth, height: perCellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectHandler?(indexPath.item)
    }
}
