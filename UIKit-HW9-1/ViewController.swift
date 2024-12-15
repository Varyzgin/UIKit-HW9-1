//
//  ViewController.swift
//  UIKit-HW9-1
//
//  Created by Дима on 12/15/24.
//

import UIKit

class ViewController: UIViewController {
    let contentArray = Content.data()
    
    private lazy var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = Margins.large.value()
        layout.minimumInteritemSpacing = 0
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        $0.dataSource = self
        $0.register(CellView.self, forCellWithReuseIdentifier: CellView.identifier)
//        $0.contentInset = UIEdgeInsets(top: Margins.large.value(), left: Margins.large.value(), bottom: Margins.large.value(), right: Margins.large.value())
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout()))
  
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
    }


}

extension ViewController : UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellView.identifier, for: indexPath) as? CellView else { return UICollectionViewCell() }
        cell.configure(with: contentArray[indexPath.row])
        return cell
    }
    
    
}
