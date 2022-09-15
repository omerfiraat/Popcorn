//
//  AnimationViewController.swift
//  Popcorn
//
//  Created by Ömer Firat on 29.11.2020.
//  Copyright © 2020 Omer Firat. All rights reserved.
//

import UIKit
import Lottie

class AnimationViewController: UIViewController {
    @IBOutlet weak var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            self.performSegue(withIdentifier: "animationToMain", sender: self)
        })
        
        animationView!.frame = view.bounds
                
        // 3. Set animation content mode
        
        animationView!.contentMode = .scaleAspectFit
        
        // 4. Set animation loop mode
        
        animationView!.loopMode = .loop
        
        // 5. Adjust animation speed
        
        animationView!.animationSpeed = 0.5
        
        view.addSubview(animationView!)
        
        // 6. Play animation
        
        animationView!.play()
        // Do any additional setup after loading the view.
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
