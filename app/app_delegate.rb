class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    @window.backgroundColor = UIColor.blackColor

    @viewController = MainController.alloc.init
    @navigationController = UINavigationController.alloc.initWithRootViewController(@viewController)
    
    applyStylesheet

    @window.rootViewController = @navigationController

    true
  end

  def applyStylesheet
    UIApplication.sharedApplication.setStatusBarStyle(UIStatusBarStyleBlackOpaque)

    navigationBar = UINavigationBar.appearance
    navigationBar.tintColor = UIColor.blackColor

    # remove default drop shadow on the header
    navigationBar.setShadowImage(UIImage.alloc.init.autorelease)

    img = UIImage.imageNamed("bg.jpg")
    imgView = UIImageView.alloc.initWithFrame([[0,44],UIScreen.mainScreen.bounds.size])
    imgView.contentMode = UIViewContentModeScaleAspectFill
    imgView.clipsToBounds = true
    imgView.image = img    
    @navigationController.view.addSubview(imgView)
    @navigationController.view.sendSubviewToBack(imgView)

    # add opencode logo
    w = UIScreen.mainScreen.bounds.size.width
    img = UIImage.imageNamed("logo.png")
    imgView = UIImageView.alloc.initWithFrame([[(w-125)/2,27],[125,30]])
    imgView.image = img
    @navigationController.view.addSubview(imgView)
  end
end
