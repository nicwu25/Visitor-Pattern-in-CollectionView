//
//  ChatRoomLinkCollectionViewCell.swift
//  KOLfanci
//
//  Created by cm0678 on 2022/10/18.
//

import UIKit
import LinkPresentation

class ChatRoomLinkCollectionViewCell: UICollectionViewCell {
    
    private lazy var loadingView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .large
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(red: 140, green: 140, blue: 140)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var linkView: LPLinkView = {
        let view = LPLinkView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(containerView)
        containerView.addSubview(linkView)
        containerView.addSubview(loadingView)
        
        containerView.fillSuperview()
        linkView.fillSuperview()
        
        activate([
            loadingView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        linkView.metadata = LPLinkMetadata()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLink(metadata: LPLinkMetadata) {
        linkView.metadata = metadata
    }
    
    func fetchingMetadata(link: String, completion: @escaping ((LPLinkMetadata) -> Void)) {
        
        guard let url = URL(string: link) else { return }

        let provider = LPMetadataProvider()
        
        DispatchQueue.main.async {
            self.loadingView.startAnimating()
        }
        
        
        provider.startFetchingMetadata(for: url) { [unowned self] metadata, error in
            
            guard let metadata = metadata, error == nil else {
                DispatchQueue.main.async {
                    self.loadingView.stopAnimating()
                }
                return
            }
            
            DispatchQueue.main.async { [unowned self] in
                self.loadingView.stopAnimating()
                self.linkView.metadata = metadata
            }
            
            completion(metadata)
        }
    }
}
