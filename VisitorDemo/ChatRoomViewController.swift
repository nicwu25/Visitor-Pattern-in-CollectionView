//
//  ViewController.swift
//  VisitorDemo
//
//  Created by cm0678 on 2022/12/6.
//

import UIKit
import SDWebImage

class ChatRoomViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: getCollectionViewLayout())
        collectionView.register(ChatRoomCreateInfoCollectionViewCell.self, forCellWithReuseIdentifier: ChatRoomCreateInfoCollectionViewCell.reuseIdentifier)
        collectionView.register(CharRoomCommentInfoCollectionViewCell.self, forCellWithReuseIdentifier: CharRoomCommentInfoCollectionViewCell.reuseIdentifier)
        collectionView.register(ChatRoomContentCollectionViewCell.self, forCellWithReuseIdentifier: ChatRoomContentCollectionViewCell.reuseIdentifier)
        collectionView.register(ChatRoomLinkCollectionViewCell.self, forCellWithReuseIdentifier: ChatRoomLinkCollectionViewCell.reuseIdentifier)
        collectionView.register(ChatRoomPhotoCollectionViewCell.self, forCellWithReuseIdentifier: ChatRoomPhotoCollectionViewCell.reuseIdentifier)
        collectionView.register(ChatRoomEmojiCollectionViewCell.self, forCellWithReuseIdentifier: ChatRoomEmojiCollectionViewCell.reuseIdentifier)
        collectionView.register(ChatRoomDateCollectionViewCell.self, forCellWithReuseIdentifier: ChatRoomDateCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.backgroundColor = .bg80
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let viewModel = ChatRoomMessageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(collectionView)
        collectionView.fillSafeAreaSuperview()
    }
}

extension ChatRoomViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.getNumberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getNumberOfRowsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let visitable = viewModel.getVisitable(indexPath: indexPath),
              let cellType = visitable.accept(visitor: ChatRoomMessageCellVisitor()) else { return UICollectionViewCell() }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath)
        visitable.accept(visitor: ChatRoomMessageCellConfiguratorVisitor(cell: cell))
        return cell
    }
}

extension ChatRoomViewController {
    
    private func getCollectionViewLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, layoutEnvironment) in
            
            guard let rows = self?.viewModel.getRows(atSection: sectionIndex) else { return nil }
            
            let nestedGroupSubitems: [NSCollectionLayoutGroup] = rows.compactMap{ $0.accept(visitor: ChatRoomMessageCollectionViewLayoutVisitor()) }
            let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                                  heightDimension: .estimated(1000)),
                                                               subitems: nestedGroupSubitems)
            let section = NSCollectionLayoutSection(group: nestedGroup)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
            
            return section
        }
        
        return layout
    }
}
