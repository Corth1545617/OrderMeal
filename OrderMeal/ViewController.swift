//
/**
 **
 ** OrderMeal
 **
 ** Created by: Corth1545617 on 2018/4/12
 ** Copyright © 2018 Righteous and Grace, Inc. All rights reserved.
 **
 */

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var darkBlueBgIV: UIImageView!
    @IBOutlet weak var powerBN: UIButton!
    @IBOutlet weak var cloudIV: UIImageView!
    @IBOutlet weak var rocketIV: UIImageView!
    @IBOutlet weak var hustleLBL: UILabel!
    @IBOutlet weak var onLBL: UILabel!
    @IBOutlet weak var animatedBgV: UIView!
    @IBOutlet weak var againBN: UIButton!
    
    var player:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // prepare the sound of player
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showMessage() {
        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello world", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func powerBtnPressed(_ sender: Any) {
        animatedBgV.isHidden = false
        rocketIV.isHidden = false
        cloudIV.isHidden = false
        
        // play sound
        player.play()
        
        // animation
        UIView.animate(withDuration: 2.3, animations: {
            self.rocketIV.frame = CGRect(x: 0, y: 20, width: self.rocketIV.frame.width, height: self.rocketIV.frame.height)
        }) { (finish) in
            self.hustleLBL.isHidden = false
            self.onLBL.isHidden = false
            self.againBN.isHidden = false
        }
    }
    
    @IBAction func againBtnPressed(_ sender: Any) {
//        self.rocketIV.frame = CGRect(x: 0, y: -300, width: self.rocketIV.frame.width, height: self.rocketIV.frame.height)
        self.rocketIV.frame = CGRect(x: 0, y: 400, width: self.rocketIV.frame.width, height: self.rocketIV.frame.height)
        animatedBgV.isHidden = true
    }
    
    
}

