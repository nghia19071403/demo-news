//
//  ListenViewController.swift
//  API news
//
//  Created by hoàng trọng nghĩa on 16/06/2022.
//
import UIKit

class ListenViewController: UIViewController {
    

    let layer = CALayer()
    @IBOutlet weak var tapToFlyUp: UIButton!
    @IBOutlet weak var blueView: UIImageView!
    @IBAction func tapToFly(_ sender: Any) {
       
            UIView.animateKeyframes(withDuration: 10.0,
                                    delay: 0,
                                    options: [],
                                    animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0.0,
                                   relativeDuration: 0.75,
                                   animations: {
                    
                    self.blueView.center.x -= 300
                })
                
                UIView.addKeyframe(withRelativeStartTime: 0.150,
                                   relativeDuration: 0.125,
                                   animations: {
                    
                    self.blueView.center.y -= 150
                })
                UIView.addKeyframe(withRelativeStartTime: 0.2,
                                   relativeDuration: 0.125,
                                   animations: {
                    
                    self.blueView.center.x = 350
                })
                UIView.addKeyframe(withRelativeStartTime: 0.250,
                                   relativeDuration: 0.125,
                                   animations: {
                    
                    self.blueView.center.y -= 150
                })
                UIView.addKeyframe(withRelativeStartTime: 0.3,
                                   relativeDuration: 0.125,
                                   animations: {
                    
                    self.blueView.center.x -= 300
                })
                UIView.addKeyframe(withRelativeStartTime: 0.350,
                                   relativeDuration: 0.125,
                                   animations: {
                    
                    self.blueView.center.y -= 150
                })
                UIView.addKeyframe(withRelativeStartTime: 0.4,
                                   relativeDuration: 0.125,
                                   animations: {
                    
                    self.blueView.center.x = 350
                })
                UIView.addKeyframe(withRelativeStartTime: 0.450,
                                   relativeDuration: 0.125,
                                   animations: {
                    
                    self.blueView.center.y -= 100
                })
                UIView.addKeyframe(withRelativeStartTime: 0.5,
                                   relativeDuration: 0.125,
                                   animations: {
                    
                    self.blueView.center.x -= 300
                })
                UIView.addKeyframe(withRelativeStartTime: 0.550,
                                   relativeDuration: 0.125,
                                   animations: {
                    
                    self.blueView.center.x = 350
                })
                
                UIView.addKeyframe(withRelativeStartTime: 0.6,
                                   relativeDuration: 0.125,
                                   animations: {

                    self.blueView.center.y = 250
                })
                UIView.addKeyframe(withRelativeStartTime: 0.650,
                                   relativeDuration: 0.125,
                                   animations: {

                    self.blueView.center.x -= 300
                })
                UIView.addKeyframe(withRelativeStartTime: 0.7,
                                   relativeDuration: 0.125,
                                   animations: {

                    self.blueView.center.y = 350
                })
                UIView.addKeyframe(withRelativeStartTime: 0.750,
                                   relativeDuration: 0.125,
                                   animations: {

                    self.blueView.center.x = 350
                })
                UIView.addKeyframe(withRelativeStartTime: 0.8,
                                   relativeDuration: 0.125,
                                   animations: {

                    self.blueView.center.y = 400
                })
                UIView.addKeyframe(withRelativeStartTime: 0.850,
                                   relativeDuration: 0.125,
                                   animations: {

                    self.blueView.center.x -= 300
                })
                UIView.addKeyframe(withRelativeStartTime: 0.9,
                                   relativeDuration: 0.125,
                                   animations: {

                    self.blueView.center.y = 700
                })
                UIView.addKeyframe(withRelativeStartTime: 0.950,
                                   relativeDuration: 0.125,
                                   animations: {

                    self.blueView.center.x = 350
                })
                
            },
                                    completion: nil)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        }
    }
 

  
