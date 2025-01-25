//
//  GameView.swift
//  sdui_app
//
//  Created by Renan Toniolo Rocha on 21/01/25.
//

import UIKit

final class GameView : BaseViewController {
    
    //  MARK: - Properties
    var presenter: GamePresenter!
    var positionX: Int = 0
    var jump_number: Int = 0
    
    internal lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    internal lazy var stackScorreTitleView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    internal lazy var stackScorreValuesView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    internal lazy var stackButtonsView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.backgroundColor = .clear
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // Button
    
    private lazy var buttonUp: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("⬆️", for: .normal)
        button.backgroundColor = .systemBrown
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapUp), for: .touchUpInside)
        button.layer.opacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    private lazy var buttonFront: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("➡️", for: .normal)
        button.backgroundColor = .systemBrown
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapFront), for: .touchUpInside)
        button.layer.opacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    private lazy var buttonBack: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("⬅️", for: .normal)
        button.backgroundColor = .systemBrown
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        button.layer.opacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    // Planet
    
    private lazy var viewSky: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        view.backgroundColor = .black
        view.heightAnchor.constraint(equalToConstant: 160).isActive = true
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var viewGram: UIView = {
        let view = UIView()
        view.backgroundColor = .granGreen
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        view.isOpaque = true
        view.layer.opacity = 0.8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var viewEart: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        view.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view.isOpaque = true
        view.layer.opacity = 0.8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mario")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Label Values
    
    internal lazy var jump: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "0"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return label
    }()
    
    internal lazy var world: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "1-1"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return label
    }()
    
    internal lazy var life: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "1"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return label
    }()
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        self.addSubViews()
        self.setupConstraint()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
        self.view.backgroundColor = .black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setLoading()
        drawViewGame()
    }
    
    // MARK: - Private
    private func addSubViews() {
        self.view.addSubview(stackView)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    private func drawViewGame() {
        let viewsGame: [UIView] = [viewSky, viewGram, viewEart]
        let buttons: [UIButton] = [buttonBack, buttonUp, buttonFront]
        let values_scorre: [UILabel] = [life, world, jump]
        viewsGame.forEach { view in
            stackView.addArrangedSubview(view)
        }
        
        buttons.forEach { button in
            stackButtonsView.addArrangedSubview(button)
        }
        
        viewEart.addSubview(stackButtonsView)
        NSLayoutConstraint.activate([
            stackButtonsView.bottomAnchor.constraint(equalTo: self.viewEart.bottomAnchor, constant: -60),
            stackButtonsView.leadingAnchor.constraint(equalTo: self.viewEart.leadingAnchor, constant: 10),
            stackButtonsView.trailingAnchor.constraint(equalTo: self.viewEart.trailingAnchor, constant: -10)
        ])

        values_scorre.forEach { label in
            stackScorreValuesView.addArrangedSubview(label)
        }
        
        viewSky.addSubview(stackScorreTitleView)
        NSLayoutConstraint.activate([
            stackScorreTitleView.topAnchor.constraint(equalTo: self.viewSky.topAnchor, constant: 60),
            stackScorreTitleView.leadingAnchor.constraint(equalTo: self.viewSky.leadingAnchor, constant: 10),
            stackScorreTitleView.trailingAnchor.constraint(equalTo: self.viewSky.trailingAnchor, constant: -10)
        ])
        
        viewSky.addSubview(stackScorreValuesView)
        NSLayoutConstraint.activate([
            stackScorreValuesView.topAnchor.constraint(equalTo: self.stackScorreTitleView.bottomAnchor, constant: 0),
            stackScorreValuesView.leadingAnchor.constraint(equalTo: self.viewSky.leadingAnchor, constant: 10),
            stackScorreValuesView.trailingAnchor.constraint(equalTo: self.viewSky.trailingAnchor, constant: -10)
        ])
        
        viewSky.addSubview(characterImage)
        NSLayoutConstraint.activate([
            characterImage.centerXAnchor.constraint(equalTo: viewSky.centerXAnchor),
            characterImage.bottomAnchor.constraint(equalTo: viewSky.bottomAnchor, constant: -20),
            characterImage.widthAnchor.constraint(equalToConstant: 36),
            characterImage.heightAnchor.constraint(equalToConstant: 36)
        ])
        
    }
    
    @objc func didTapUp() {

        jump_number = jump_number + 1
        self.jump.text = "\(jump_number)"
        UIView.animateKeyframes(
            withDuration: 1.0,
            delay: 0,
            animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                    self.characterImage.transform = CGAffineTransform(translationX: CGFloat(self.positionX), y: -50)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                    self.characterImage.transform = CGAffineTransform(translationX: CGFloat(self.positionX), y: 0)
                }
            },
            completion: nil
        )
    }

    @objc func didTapFront() {
        positionX += 30
        UIView.animate(
            withDuration: 1.0,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                self.characterImage.transform = CGAffineTransform(translationX: CGFloat(self.positionX), y: 0)
            },
            completion: nil
        )
    }
    
    @objc func didTapBack() {
        positionX -= 30
        UIView.animate(
            withDuration: 1.0,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                self.characterImage.transform = CGAffineTransform(translationX: CGFloat(self.positionX), y: 0)
            },
            completion: nil
        )
    }
}

extension GameView: GameViewInputProtocol {
    func makeCharacterImage(img: String) {
        DispatchQueue.main.async {
            self.characterImage.image = UIImage(named: img)
        }
    }
    
    func makeBackgroundImage(img: String) {
        DispatchQueue.main.async {
            self.viewSky.image = UIImage(named: img)
        }
    }
    
    func makeLabelScorre(component: Component) {
        let label = UILabel()
        label.text = component.value
        
        label.textAlignment = alignmentTextView(alignment: component.style?.textAlignment ?? "center")
        label.textColor = colorType(color: component.style?.color ?? "red")
        label.font = UIFont.boldSystemFont(ofSize: 17)
        
        self.stackScorreTitleView.addArrangedSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func makeLabelScorreValueLife(component: Component) {
        life.text = component.value
        life.textAlignment = alignmentTextView(alignment: component.style?.textAlignment ?? "center")
        life.textColor = colorType(color: component.style?.color ?? "red")
        life.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    func makeLabelScorreValueWorld(component: Component) {
        world.text = component.value
        world.textAlignment = alignmentTextView(alignment: component.style?.textAlignment ?? "center")
        world.textColor = colorType(color: component.style?.color ?? "red")
        world.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    func makeLabelScorreValueJump(component: Component) {
        jump.text = component.value
        jump.textAlignment = alignmentTextView(alignment: component.style?.textAlignment ?? "center")
        jump.textColor = colorType(color: component.style?.color ?? "red")
        jump.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    func makeBackgroundColorEart(color: String) {
        viewEart.backgroundColor = colorType(color: color)
    }
    
    func makeBackgroundColorGram(color: String) {
        viewGram.backgroundColor = colorType(color: color)
    }
}

extension GameView: GameViewOutputProtocol {
    func setFinish() {
        DispatchQueue.main.async {
            self.stackView.isHidden = false
            super.setHiddenViewBase()
        }
    }
    
    func setLoading() {
        DispatchQueue.main.async {
            self.stackView.isHidden = true
            super.setVisibleViewLoading(mesage: "Carregando...", visible: false)
        }
    }
    
    func setError(mesage: String, isError: Bool) {
        DispatchQueue.main.async {
            self.stackView.isHidden = isError
            super.setVisibleViewError(mesage: mesage, visible: !isError)
        }
    }
}
