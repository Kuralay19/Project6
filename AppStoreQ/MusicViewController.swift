//
//  Music.swift
//  AppStoreQ
//
//  Created by Smart Castle M1A2004 on 06.01.2024.
//

import UIKit
class MusicViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellid1 = "cellid1"
    var feedModel: FeedModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchData()
    }
    func setupCollectionView() {
        collectionView.isPagingEnabled = false
        collectionView.backgroundColor = .white
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: cellid1)
    }
 
    func fetchData() {
        Service.shared.getMusics() { (res, err) in
            if let err = err {
                print("Failed to fetch apps: ", err)
                return
            }
            
            self.feedModel = res?.feed
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}
extension MusicViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedModel?.results.count ?? 0 
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid1", for: indexPath) as! AppRowCell
        cell.configure(feedModel?.results[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width - 20, height: 90)
    }
}

