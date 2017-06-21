import UIKit

class TabbarWireFrame {
    
    static func createTabbar() -> UITabBarController {
        if let tabbbarController =  mainStoryboard.instantiateViewController(withIdentifier:"TabBarController") as? UITabBarController {
            let moduleOne = HomeWireFrame.createHomeModule()
            let moduleTwo = FavoriteWireFrame.createFavoriteModule()
            
            moduleOne.tabBarItem.title = "Home"
            moduleTwo.tabBarItem.title = "Favorites"
            
            tabbbarController.viewControllers = [moduleOne, moduleTwo]
            tabbbarController.tabBar.barStyle = .black
            tabbbarController.tabBar.tintColor = UIColor.orange
            return tabbbarController
        }
        return UITabBarController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
