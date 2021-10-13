//
//  CustomHeaderView.swift
//  TableviewExmaple
//
//  Created by Dannian Park on 2021/10/14.
//

import UIKit

protocol CustomHeaderDelegate: AnyObject {
    func selectViewTag(_ value: Int)
}

class CustomHeaderView: UIView {
    private let btnAdd: UIButton = {
        let view : UIButton = .init(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("ADD", for: .normal)
        view.backgroundColor = .blue
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return view
    }()
    
    private let lbTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .blue
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 1
        return label
    }()
    
    public weak var delegate : CustomHeaderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = .gray
        self.addSubview(lbTitle)
        self.addSubview(btnAdd)
        NSLayoutConstraint.activate([
            lbTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lbTitle.topAnchor.constraint(equalTo: self.topAnchor),
            lbTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            btnAdd.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            btnAdd.topAnchor.constraint(equalTo: self.topAnchor),
            btnAdd.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            lbTitle.trailingAnchor.constraint(lessThanOrEqualTo: btnAdd.leadingAnchor, constant: 10)
        ])
        btnAdd.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        btnAdd.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        btnAdd.addTarget(self, action: #selector(self.actionBtnAdd(_:)), for: .touchUpInside)
        
        self.tag = -1
    }
    
    public func setData(_ index: Int) {
        self.tag = index
        self.lbTitle.text = "\(index) Header"
    }
    
    @objc private func actionBtnAdd(_ sender: UIButton) {
        self.delegate?.selectViewTag(self.tag)
    }
}
