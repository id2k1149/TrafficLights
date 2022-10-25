//
//  ViewController.swift
//  TrafficLights
//
//  Created by Max Franz Immelmann on 10/25/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var blackView: UIView!
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = NowLightIs.green
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.alpha = 0.3
        yellowView.alpha = 0.3
        greenView.alpha = 0.3
    }
    
    override func viewDidLayoutSubviews() {
        blackView.layer.cornerRadius = blackView.frame.width / 2
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
        startButton.layer.cornerRadius = startButton.frame.height / 2
    }
    
    
    @IBAction func StartButtonWasTapped() {
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            currentLight = .yellow
            redView.alpha = 0.3
            yellowView.alpha = 1
        case .yellow:
            currentLight = .green
            yellowView.alpha = 0.3
            greenView.alpha = 1
        case .green:
            currentLight = .red
            redView.alpha = 1
            greenView.alpha = 0.3
        }
    }
}

extension ViewController {
    enum NowLightIs {
        case red, yellow, green
    }
}
