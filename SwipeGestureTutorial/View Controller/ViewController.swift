//
//  ViewController.swift
//  SwipeGestureTutorial
//
//  Created by Mai Hassan on 2/13/19.
//  Copyright © 2019 Mai Hassan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPage = 1
    var currentView = UIView()
    var currentViewController: UIViewController?
    
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var third: UILabel!
    
    @IBOutlet weak var firstContainer: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadExternalView(currentPage: currentPage)
        
        addSwipeGesture()
        setRoundedCorners()
    }
    
    func setRoundedCorners() {
        first.layer.masksToBounds = true
        first.layer.cornerRadius = first.frame.height
        second.layer.masksToBounds = true
        second.layer.cornerRadius = second.frame.height
        third.layer.masksToBounds = true
        third.layer.cornerRadius = third.frame.height
    }
}


// MARK: - Swipe related methods
extension ViewController {
    
    func addSwipeGesture() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            swipedRight()
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            swipedLeft()
        }
    }
    
    func swipedRight() {
        switch currentPage {
        case 3:
            removeCurrentView()
            currentPage -= 1
            changeView(currentPage: currentPage)
            
            break
        case 2:
            removeCurrentView()
            currentPage -= 1
            changeView(currentPage: currentPage)
            
            break
        default:
            return
        }
    }
    
    func swipedLeft() {
        switch currentPage {
        case 2:
            currentPage += 1
            changeView(currentPage: currentPage)
            break
        case 1:
            currentPage += 1
            changeView(currentPage: currentPage)
            
            break
        default:
            return
        }
    }
    
    func changeView(currentPage: Int) {
        loadExternalView(currentPage: currentPage)
        let labelsArr = [first, second, third]
        print(currentPage)
        for index in 0...2 {
            if index == currentPage-1 {
                labelsArr[index]?.backgroundColor = #colorLiteral(red: 0.9027451866, green: 1, blue: 0.8792223306, alpha: 1)
                //                containerArr[index]?.isHidden = false
            } else {
                labelsArr[index]?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                //                containerArr[index]?.isHidden = true
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func removeCurrentView() {
        //        currentView.removeFromSuperview()
        currentViewController?.view.removeFromSuperview()
    }
    
    
    func loadExternalView(currentPage: Int) {
        removeCurrentView()
        switch currentPage {
        case 1:
            //            if let customView = Bundle.main.loadNibNamed("FirstContainer", owner: nil, options: nil)?.first as? FirstContainer {
            //                customView.frame = firstContainer.bounds
            //                firstContainer.addSubview(customView)
            //                firstContainer.bringSubviewToFront(customView)
            //                currentView = customView
            //            }
            let controller: FirstContainer = self.storyboard!.instantiateViewController(withIdentifier: "FirstContainer") as! FirstContainer
            //        controller.ANYPROPERTY=THEVALUE // If you want to pass value
            controller.view.frame = firstContainer.bounds;
            firstContainer.addSubview(controller.view)
            self.addChild(controller)
            controller.didMove(toParent: self)
            currentViewController = controller
            break
        case 2:
            let controller: SecondContainer = self.storyboard!.instantiateViewController(withIdentifier: "SecondContainer") as! SecondContainer
            //        controller.ANYPROPERTY=THEVALUE // If you want to pass value
            controller.view.frame = firstContainer.bounds;
            firstContainer.addSubview(controller.view)
            self.addChild(controller)
            controller.didMove(toParent: self)
            currentViewController = controller
            break
            
        case 3:
            let controller: ThirdContainer = self.storyboard!.instantiateViewController(withIdentifier: "ThirdContainer") as! ThirdContainer
            //        controller.ANYPROPERTY=THEVALUE // If you want to pass value
            controller.view.frame = firstContainer.bounds;
            firstContainer.addSubview(controller.view)
            self.addChild(controller)
            controller.didMove(toParent: self)
            currentViewController = controller
            break
        default:
            return
        }
    }
    
}
