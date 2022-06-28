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
                                                               relativeDuration: 0.125,
                                                               animations: {
                                                                
                                                                self.blueView.frame.size.width -= 80
                                                                self.blueView.frame.size.height -= 80
                                                                self.blueView.center.x -= 60
                                            })
                                            
                                            UIView.addKeyframe(withRelativeStartTime: 0.125,
                                                               relativeDuration: 0.25,
                                                               animations: {
                                                                
                                                                self.blueView.center.y -= 120
                                            })
                                            
                                           
                },
                                        completion: nil)
    }
        
            
    }
func viewDidLoad() {
        viewDidLoad()
       
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


