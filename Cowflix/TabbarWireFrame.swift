import UIKit

class TabbarWireFrame {
    
    static func createTabbar() -> UITabBarController {
        if let tabbbarController =  mainStoryboard.instantiateViewController(withIdentifier:"TabBarController") as? UITabBarController {
            let moduleOne = HomeWireFrame.createHomeModule()
            let moduleTwo = FavoriteWireFrame.createFavoriteModule()
            let moduleThree = RandomWireFrame.createRandomModule()
            
            moduleOne.tabBarItem.image = UIImage(named: "home_icon")
            moduleOne.tabBarItem.title = "Home"
            moduleTwo.tabBarItem.image = UIImage(named: "favorite")
            moduleTwo.tabBarItem.title = "Favorites"
            moduleThree.tabBarItem.image = UIImage(named: "movie_filter")
            moduleThree.tabBarItem.title = "Random"
            
            tabbbarController.viewControllers = [moduleOne, moduleTwo, moduleThree]
            tabbbarController.tabBar.barStyle = .black
            tabbbarController.tabBar.tintColor = UIColor(colorLiteralRed:0.96, green:0.81, blue:0.89, alpha:1.0)
            return tabbbarController
        }
        return UITabBarController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
