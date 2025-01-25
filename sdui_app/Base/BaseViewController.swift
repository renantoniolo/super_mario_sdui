//
//  BaseViewController.swift
//  sdui_app
//
//  Created by Renan Toniolo Rocha on 23/01/25.
//

import UIKit

class BaseViewController : UIViewController {
    private lazy var principalView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    private lazy var viewImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "gameOver")
        view.backgroundColor = .black
        view.contentMode = .scaleAspectFit
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var viewLoadImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "loadImage")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = String()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return label
    }()
    
    private lazy var buttonRetry: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tentar novamente", for: .normal)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 0
        button.tintColor = .black
        //button.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        button.layer.opacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 70).isActive = true
        return button
    }()
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.addSubViews()
        self.setupConstraint()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
    }
    
    // Public
    func setVisibleViewError(mesage: String ,visible: Bool) {
        self.principalView.isHidden = visible
        self.buttonRetry.isHidden = visible
        self.viewImage.isHidden = visible
        self.descriptionLabel.text = mesage
        self.viewLoadImage.isHidden = !visible
    }
    
    func setVisibleViewLoading(mesage: String ,visible: Bool) {
        self.principalView.isHidden = visible
        self.viewLoadImage.isHidden = visible
        self.descriptionLabel.text = mesage
        self.viewImage.isHidden = !visible
        self.buttonRetry.isHidden = !visible
    }
    
    func setHiddenViewBase() {
        self.principalView.isHidden = true
    }
    
    // MARK: - Private
    private func addSubViews() {
        self.view.addSubview(principalView)
        self.principalView.addSubview(viewImage)
        self.principalView.addSubview(viewLoadImage)
        self.principalView.addSubview(descriptionLabel)
        self.principalView.addSubview(buttonRetry)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            principalView.topAnchor.constraint(equalTo: self.view.topAnchor),
            principalView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            principalView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            principalView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        NSLayoutConstraint.activate([
            viewImage.centerXAnchor.constraint(equalTo: principalView.centerXAnchor),
            viewImage.centerYAnchor.constraint(equalTo: principalView.centerYAnchor),
            viewImage.widthAnchor.constraint(equalToConstant: 220),
            viewImage.heightAnchor.constraint(equalToConstant: 220)
        ])
        NSLayoutConstraint.activate([
            viewLoadImage.centerXAnchor.constraint(equalTo: principalView.centerXAnchor),
            viewLoadImage.centerYAnchor.constraint(equalTo: principalView.centerYAnchor),
            viewLoadImage.widthAnchor.constraint(equalToConstant: 220),
            viewLoadImage.heightAnchor.constraint(equalToConstant: 220)
        ])
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: self.viewImage.bottomAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: principalView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            buttonRetry.leadingAnchor.constraint(equalTo: self.principalView.leadingAnchor),
            buttonRetry.trailingAnchor.constraint(equalTo: self.principalView.trailingAnchor),
            buttonRetry.bottomAnchor.constraint(equalTo: self.principalView.bottomAnchor)
        ])
    }
}

extension BaseViewController {
    
    func alignmentTextView(alignment: String) -> NSTextAlignment {
        if alignment == "center" {
            return .center
        } else if alignment == "left" {
            return .left
        }
        return .right
    }
    
    func colorType(color: String) -> UIColor {
        if color == "red" {
            return .red
        }
        if color == "green" {
            return .green
        }
        if color == "gray" {
            return .gray
        }
        if color == "darkGray" {
            return .darkGray
        }
        if color == "granGreen" {
            return .granGreen
        }
        if color == "brown" {
            return .brown
        }
        return .white
    }
}
