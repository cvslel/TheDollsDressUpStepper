//
//  ViewController.swift
//  TheDollsDressUpStepper
//
//  Created by Cenker Soyak on 3.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let images: [String] = ["doll5", "doll1","doll2","doll3","doll4","doll5",]
    let dressCounter = UIStepper()
    let dollImages = UIImageView()
    let counterLabel = UILabel()
    var currentImageIndex = 0
    var currentLabelValue: Double = 0
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 2
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        createUI()
    }
    
    func setupUI(){
        view.addSubview(dividerView)
        dividerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(200)
            make.width.equalToSuperview()
            make.height.equalTo(2)
        }
    }
    
    func createUI(){
        dressCounter.tag = 0
        dressCounter.minimumValue = 0
        dressCounter.maximumValue = 25
        dressCounter.stepValue = 5
        dressCounter.layer.cornerRadius = 8
        dressCounter.backgroundColor = .systemPink
        dressCounter.addTarget(self, action: #selector(stepperValueChanged), for: UIControl.Event.valueChanged)
        view.addSubview(dressCounter)
        dressCounter.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.left.equalTo(view.snp.left).offset(165)
            make.height.equalTo(33)
        }
        
        dollImages.image = UIImage(named: images[0])
        view.addSubview(dollImages)
        dollImages.snp.makeConstraints { make in
            make.top.equalTo(dividerView.snp.top).offset(80)
            make.left.equalTo(view.snp.left).offset(30)
            make.right.equalTo(view.snp.right).offset(-30)
            make.height.equalTo(400)
        }
        
        counterLabel.text = String(Int(dressCounter.value))
        counterLabel.textAlignment = .center
        view.addSubview(counterLabel)
        counterLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(50)
            make.left.equalTo(view.snp.left).offset(45)
            make.right.equalTo(view.snp.right).offset(-45)
            make.height.equalTo(20)
        }
    }
    @objc func stepperValueChanged(){
        currentLabelValue = dressCounter.value
        counterLabel.text = String(Int(currentLabelValue))
        dollImages.image = UIImage(named: images[Int(currentLabelValue) / 5])
    }
}
