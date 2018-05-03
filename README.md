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


