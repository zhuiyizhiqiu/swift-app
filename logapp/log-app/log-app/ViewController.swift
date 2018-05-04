//
//  ViewController.swift
//  log-app
//
//  Created by 彭军涛 on 2018/5/3.
//  Copyright © 2018年 彭军涛. All rights reserved.
//

import UIKit

func delay(_ seconds: Double,completion: @escaping () -> Void){
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

class ViewController: UIViewController {

    @IBOutlet weak var usename: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var logButton: UIButton!
    
    @IBOutlet weak var cloud1: UIImageView!
    @IBOutlet weak var cloud2: UIImageView!
    @IBOutlet weak var cloud3: UIImageView!
    @IBOutlet weak var cloud4: UIImageView!
    
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    let status = UIImageView(image: UIImage(named: "banner"))
    let label = UILabel()
    let messages = ["登陆ing....",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        logButton.layer.cornerRadius = 8.0
        logButton.layer.masksToBounds = true
        
        spinner.frame = CGRect(x:logButton.bounds.width / 2, y: logButton.bounds.height / 2 - 5, width: 5, height: 5)
        spinner.stopAnimating()
        spinner.alpha = 0.0
        logButton.addSubview(spinner)
        
        logButton.setTitle("登陆", for: .normal)
        logButton.backgroundColor = UIColor(red: 116/255, green: 212/255, blue: 98/255, alpha: 1.0)
        
        cloudAction(cloud: cloud1)
        cloudAction(cloud: cloud2)
        cloudAction(cloud: cloud3)
        cloudAction(cloud: cloud4)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cloud1.alpha = 0.0
        cloud2.alpha = 0.0
        cloud3.alpha = 0.0
        cloud4.alpha = 0.0
        
        usename.center.x -= view.bounds.width
        password.center.x -= view.bounds.width
        
        logButton.center.y += 30
        logButton.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 0.5, delay: 0.7, options: [], animations: {
//            self.cloud1.alpha = 1.0
//            //延时也可以达到效果
////            delay(0.2, completion: {
////                self.cloud2.alpha = 1.0
////            })
////            delay(0.4, completion: {
////                self.cloud3.alpha = 1.0
////            })
////            delay(0.6, completion: {
////                self.cloud4.alpha = 1.0
////            })
//        }, completion: nil)
        
        animate(withDuration: 0.5, delay: 0.5, options: [], cloud: self.cloud1)
        animate(withDuration: 0.5, delay: 0.7, options: [], cloud: self.cloud2)
        animate(withDuration: 0.5, delay: 0.9, options: [], cloud: self.cloud3)
        animate(withDuration: 0.5, delay: 1.1, options: [], cloud: self.cloud4)
        
        animate(withDuration: 0.5, delay: 0.3, options: [.curveEaseOut], textFiled: self.usename)
        animate(withDuration: 0.5, delay: 0.4, options: [.curveEaseOut], textFiled: self.password)
        
        UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.logButton.center.y -= 30
            self.logButton.alpha = 1.0
        }, completion: nil)
        
    }
    
    func animate(withDuration:Double,delay:Double,options:  UIViewAnimationOptions = [],cloud: UIImageView ){
        UIView.animate(withDuration: TimeInterval(withDuration), delay: delay, options: options, animations: {
            cloud.alpha = 1.0
        }, completion: nil)
    }
    
    func animate(withDuration:Double,delay:Double,options:  UIViewAnimationOptions = [],textFiled: UITextField ){
        UIView.animate(withDuration: TimeInterval(withDuration), delay: delay, options: options, animations: {
            textFiled.center.x += self.view.bounds.width
        }, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func log(){
        view.endEditing(true)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.logButton.bounds.size.width += 40
            self.spinner.center.x = self.logButton.bounds.width / 2
            self.spinner.isHidden = false
            self.spinner.alpha = 1.0
            self.spinner.startAnimating()
            self.logButton.setTitle("", for: .normal)
        }, completion: nil)
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [], animations: {
            self.logButton.backgroundColor = UIColor(red: 0.85, green: 0.84, blue: 0.45, alpha: 1.0)

        }) { (_) in
            delay(2, completion: {
                if self.usename.text == "zhuiyizhiqiu" && self.password.text == "123456" {
                    self.logTap(alMessage: "登陆成功", logButton: self.logButton, setTitle: "登陆")
                }else{
                    self.logTap(alMessage: "登陆失败", logButton: self.logButton, setTitle: "登陆")
                }
            })
        }
    }
    
    func logTap(alMessage:String,logButton: UIButton,setTitle:String){
         self.logButton.backgroundColor = UIColor(red: 116/255, green: 212/255, blue: 98/255, alpha: 1.0)
        self.spinner.isHidden = true
        self.spinner.stopAnimating()
        self.showAlert(alMessage: alMessage)
        self.logButton.setTitle(setTitle, for: .normal)
        logButton.bounds.size.width -= 40
    }
    
    func showAlert(alMessage:String){
        let alert = UIAlertController(title: "提醒信息", message: alMessage, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
    
    func cloudAction(cloud: UIImageView){
        let cloudSpeed = 60.0/self.view.bounds.width
        let time = (self.view.frame.size.width - cloud.frame.origin.x) * cloudSpeed
        UIView.animate(withDuration: TimeInterval(time), delay: 0, options: [.curveLinear], animations: {
            cloud.frame.origin.x = self.view.frame.width
        }) { (_) in
            cloud.frame.origin.x = -cloud.frame.width
            self.cloudAction(cloud: cloud)
        }
    }

}

