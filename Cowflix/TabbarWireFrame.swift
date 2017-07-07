import UIKit

class TabbarWireFrame {
    
    static func createTabbar() -> UITabBarController {
        if let tabbbarController =  mainStoryboard.instantiateViewController(withIdentifier:"TabBarController") as? UITabBarController {
            let moduleOne = HomeWireFrame.createHomeModule()
            let moduleTwo = FavoriteWireFrame.createFavoriteModule()
            let moduleThree = RandomWireFrame.createRandomModule()
            
            moduleOne.tabBarItem.title = "Home"
            moduleTwo.tabBarItem.title = "⭐️"
            moduleThree.tabBarItem.title = "Random"
            
            tabbbarController.viewControllers = [moduleOne, moduleTwo, moduleThree]
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
