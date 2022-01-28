//
//  DiceeUIView.swift
//  Dicee_NoSB
//
//  Created by Raúl Pavón on 28/01/22.
//

import UIKit

class DiceeUIView: UIView {
    
    enum DiceeUIViewConstraints {
        enum btRoll {
            static let fontSize: CGFloat = 30
            static let top: CGFloat = 80
            static let width: CGFloat = 100
        }
        enum imgLogo {
            static let top: CGFloat = 80
            static let heigth: CGFloat = 128
            static let width: CGFloat = 240
        }
        enum imgDice {
            static let top: CGFloat = 86
            static let leading: CGFloat = 51
            static let heigth: CGFloat = 120
            static let width: CGFloat = 120
            static let trailing: CGFloat = -51
        }
    }
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imgBackground: UIImageView = {
        let image = UIImageView(image: UIImage(named: GlobalConstants.Images.greenBackground))
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let imgLogo: UIImageView = {
        let image = UIImageView(image: UIImage(named: GlobalConstants.Images.diceLogo))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let imgDicee1: UIImageView = {
        let image = UIImageView(image: UIImage(named: GlobalConstants.Images.dice1))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let imgDicee2: UIImageView = {
        let image = UIImageView(image: UIImage(named: GlobalConstants.Images.dice1))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var btRoll: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString(GlobalConstants.Dicee.button, comment: ""), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hex: GlobalConstants.Colors.red)
        button.titleLabel?.font = UIFont.systemFont(ofSize: DiceeUIViewConstraints.btRoll.fontSize)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func initComponents() {
        addComponents()
        setAutolayout()
    }
    
    private func addComponents() {
        addSubview(mainContainer)
        addSubview(imgBackground)
        addSubview(imgLogo)
        addSubview(imgDicee1)
        addSubview(imgDicee2)
        addSubview(btRoll)
    }
    
    private func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imgBackground.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            imgBackground.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            imgBackground.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            imgBackground.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor),
            
            imgLogo.topAnchor.constraint(equalTo: imgBackground.safeAreaLayoutGuide.topAnchor, constant: DiceeUIViewConstraints.imgLogo.top),
            imgLogo.centerXAnchor.constraint(equalTo: centerXAnchor),
            imgLogo.heightAnchor.constraint(equalToConstant: DiceeUIViewConstraints.imgLogo.heigth),
            imgLogo.widthAnchor.constraint(equalToConstant: DiceeUIViewConstraints.imgLogo.width),
            
            imgDicee1.topAnchor.constraint(equalTo: imgLogo.bottomAnchor, constant: DiceeUIViewConstraints.imgDice.top),
            imgDicee1.leadingAnchor.constraint(equalTo: imgBackground.leadingAnchor, constant: DiceeUIViewConstraints.imgDice.leading),
            imgDicee1.widthAnchor.constraint(equalToConstant: DiceeUIViewConstraints.imgDice.width),
            imgDicee1.heightAnchor.constraint(equalToConstant: DiceeUIViewConstraints.imgDice.heigth),
            
            imgDicee2.topAnchor.constraint(equalTo: imgDicee1.topAnchor),
            imgDicee2.trailingAnchor.constraint(equalTo: imgBackground.trailingAnchor, constant: DiceeUIViewConstraints.imgDice.trailing),
            imgDicee2.widthAnchor.constraint(equalToConstant: DiceeUIViewConstraints.imgDice.width),
            imgDicee2.heightAnchor.constraint(equalToConstant: DiceeUIViewConstraints.imgDice.heigth),
            
            btRoll.topAnchor.constraint(equalTo: imgDicee1.bottomAnchor, constant: DiceeUIViewConstraints.btRoll.top),
            btRoll.centerXAnchor.constraint(equalTo: centerXAnchor),
            btRoll.widthAnchor.constraint(equalToConstant: DiceeUIViewConstraints.btRoll.width),
        ])
    }
    
    func setBtRollTarget(target: Any?, action: Selector) {
        btRoll.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func didTapRoll() {
        let diceArray = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix") ]
        //let diceArray = [ UIImage(named: "DiceOne"), UIImage(named: "DiceTwo"), UIImage(named: "DiceThree"), UIImage(named: "DiceFour"), UIImage(named: "DiceFive"), UIImage(named: "DiceSix") ]
        imgDicee1.image = diceArray.randomElement()
        imgDicee2.image = diceArray[Int.random(in: 0...diceArray.count - 1)]
    }
}
