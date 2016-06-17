//
//  ViewController.swift
//  SwiftyUtilsDemo
//
//  Created by Tom Baranes on 23/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import UIKit
import SwiftyUtils

class GesturesExampleViewController: UIViewController {
    
    var lastPanViewLocation: CGPoint!;
    var lastPinchScale: CGFloat = 0;
    
    @IBOutlet weak var viewTapGesture: UIView!
    @IBOutlet weak var labelTapGestureCounter: UILabel!
    @IBOutlet weak var viewSwipeGesture: UIView!
    @IBOutlet weak var labelSwipeGestureCounter: UILabel!
    @IBOutlet weak var viewLongPressGesture: UIView!
    @IBOutlet weak var labelLongPressGestureCounter: UILabel!
    @IBOutlet weak var viewPanGesture: UIView!
    @IBOutlet weak var viewPinchGesture: UIView!
    
    // MARK - Counter
    
    var tapCounter: Int = 0 {
        didSet {
            labelTapGestureCounter.text =
                String(format:NSLocalizedString("gestures_example.label.tap_counter", comment: ""), tapCounter)
        }
    }

    var longPressCounter: Int = 0 {
        didSet {
            labelLongPressGestureCounter.text = String(format:NSLocalizedString("gestures_example.label.long_press_counter", comment: ""), longPressCounter)
        }
    }
    
    var swipeCounter: Int = 0 {
        didSet {
            labelSwipeGestureCounter.text = String(format:NSLocalizedString("gestures_example.label.swipe_counter", comment: ""), swipeCounter)
        }
    }
    
    //  MARK - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.convertLocalizables()
        self.handleTapGesture()
        self.handleLongPressGesture()
        self.handleSwipeGesture()
        self.handlePanGesture()
        self.handlePinchGesture()
        
        lastPanViewLocation = viewPanGesture.center
    }

    // MARK - Gestures
    
    func handleTapGesture() {
        let blockTapGesture = BlockTapGestureRecognizer() { _ in
            self.tapCounter += 1
        }
        view.addGestureRecognizer(blockTapGesture)
    }
    
    func handleLongPressGesture() {
        let longPressGesture = BlockLongPressGestureRecognizer(minimumPressDuration: 0.5) { _ in
            self.longPressCounter += 1
        }
        view.addGestureRecognizer(longPressGesture)
    }

    func handleSwipeGesture() {
        let swipeDownGesture = BlockSwipeGestureRecognizer(numberOfTouchesRequired: 1, direction: .down) { _ in
            self.swipeCounter += 1
        }
        
        let swipeUpGesture = BlockSwipeGestureRecognizer(numberOfTouchesRequired: 1, direction: .up) { _ in
            self.swipeCounter += 1
        }
        
        let swipeLeftGesture = BlockSwipeGestureRecognizer(numberOfTouchesRequired: 1, direction: .left) { _ in
            self.swipeCounter += 1
        }
        
        let swipeRightGesture = BlockSwipeGestureRecognizer(numberOfTouchesRequired: 1, direction: .right) { _ in
            self.swipeCounter += 1
        }

        view.addGestureRecognizer(swipeUpGesture)
        view.addGestureRecognizer(swipeDownGesture)
        view.addGestureRecognizer(swipeLeftGesture)
        view.addGestureRecognizer(swipeRightGesture)
    }
    
    func handlePanGesture() {
        let panGesture = BlockPanGestureRecognizer(minimumNumberOfTouches: 1) { gesture in
            if gesture.state == .began {
                self.lastPanViewLocation = gesture.view!.center
            } else {
                let translation = gesture.translation(in: gesture.view?.superview)
                gesture.view?.center = CGPoint(x: self.lastPanViewLocation.x + translation.x,
                                               y: self.lastPanViewLocation.y + translation.y);
            }
        }
        
        viewPanGesture.addGestureRecognizer(panGesture)
    }
    
    func handlePinchGesture() {
        let pinchGesture = BlockPinchGestureRecognizer { (gesture: UIPinchGestureRecognizer) in
            gesture.view?.transform = gesture.view!.transform.scaleBy(x: gesture.scale, y: gesture.scale)
            gesture.scale = 1.0
        }
        viewPinchGesture.addGestureRecognizer(pinchGesture)
    }
}

