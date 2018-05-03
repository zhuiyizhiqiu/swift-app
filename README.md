# swift-app
这是一个有许多动画效果的登陆界面的app
这个项目基于我正在学习的《iOS Animations》这本书，把其中的项目进行的部更改，然后进行了部分优化

用

    func animate(withDuration:Double,delay:Double,options:  UIViewAnimationOptions = [],cloud: UIImageView ){
    
        UIView.animate(withDuration: TimeInterval(withDuration), delay: delay, options: options, animations: {
        
            cloud.alpha = 1.0
            
        }, completion: nil)
        
    }
优化了里面相同的动画书写的繁琐


写了一个登陆成功和登陆失败后的反馈

    @IBAction func log(){
        UIView.animate(withDuration: 2.0, delay: 0, options: [], animations: {
            self.logButton.backgroundColor = UIColor(red: 0.85, green: 0.84, blue: 0.45, alpha: 1.0)
            self.spinner.isHidden = false
            self.spinner.alpha = 1.0
            self.logButton.setTitle("", for: .normal)
        }) { (_) in
            delay(2, completion: {
                if self.usename.text == "zhuiyizhiqiu" && self.password.text == "123456" {
                    self.logButton.backgroundColor = UIColor(red: 116/255, green: 212/255, blue: 98/255, alpha: 1.0)
                    self.spinner.isHidden = true
                    self.showAlert(alMessage: "登陆成功")
                }else{
                    self.logButton.backgroundColor = UIColor(red: 116/255, green: 212/255, blue: 98/255, alpha: 1.0)
                    self.spinner.isHidden = true
                    self.logButton.setTitle("登陆", for: .normal)
                    self.showAlert(alMessage: "登陆失败")
                }
            })
        }
    }
    
提醒信息的封装

    func showAlert(alMessage:String){
        let alert = UIAlertController(title: "提醒信息", message: alMessage, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
    
 背景云的飘动
 
     func cloudAction(cloud: UIImageView){
        let cloudSpeed = 30.0/self.view.bounds.width
        let time = (self.view.frame.size.width - cloud.frame.origin.x) * cloudSpeed
        UIView.animate(withDuration: TimeInterval(time), delay: 0, options: [.curveLinear], animations: {
            cloud.frame.origin.x = self.view.frame.width
        }) { (_) in
            cloud.frame.origin.x = -cloud.frame.width
            self.cloudAction(cloud: cloud)
        }
    }


