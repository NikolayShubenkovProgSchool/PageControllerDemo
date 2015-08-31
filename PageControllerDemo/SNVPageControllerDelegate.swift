//
//  SNVPageControllerDelegate.swift
//  PageControllerDemo
//
//  Created by Nikolay Shubenkov on 31/08/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

import UIKit

enum SNVError: ErrorType {
    case ControllerNotFound(description:String)
}

@objc class SNVPageControllerDelegate: NSObject, UIPageViewControllerDataSource {
    
    var viewIdsToViewControllers:[String:UIViewController] = [String:UIViewController]()
    var viewControllerIdentifiers : [String] = []
    var storyBoard : UIStoryboard
    var lastPresentedControler : UIViewController?
    
    init(pageController:UIPageViewController,viewControllersIds:[String],storyboard:UIStoryboard){
        assert(viewControllersIds.count > 0)
        self.viewControllerIdentifiers +=  viewControllersIds
        self.storyBoard = storyboard
        super.init()
        pageController.dataSource = self
        
        var controllers:[UIViewController] = []
        for identifier in self.viewControllerIdentifiers {
            self.viewIdsToViewControllers[identifier] = self.storyBoard.instantiateViewControllerWithIdentifier(identifier)
            controllers.append(self.viewIdsToViewControllers[identifier]!)
        }
        self.lastPresentedControler = controllers[0]
        pageController.setViewControllers([self.lastPresentedControler!], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
    }
    
    //MARK: PageController DataSource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        do {
            let index = try self.indexOfController(viewController)
            if (index >= self.viewControllerIdentifiers.count - 1){
                return nil
            }
            let identifier = self.viewControllerIdentifiers[index + 1]
            return self.viewIdsToViewControllers[identifier]
        } catch SNVError.ControllerNotFound(let description){
                print("error\(description)")
                return nil
        }
        catch {
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        do {
            let index = try self.indexOfController(viewController)
            if (index == 0){
                return nil
            }
            let identifier = self.viewControllerIdentifiers[index - 1]
            return self.viewIdsToViewControllers[identifier]
        } catch SNVError.ControllerNotFound(let description){
            print("error\(description)")
            return nil
        }
        catch {
            return nil
        }
    }
    
    func indexOfController(controller:UIViewController)throws->Int  {
        for storyboardID in self.viewControllerIdentifiers {
            if self.viewIdsToViewControllers[storyboardID] == controller {
                return self.viewControllerIdentifiers.indexOf(storyboardID)!
            }
        }
        throw SNVError.ControllerNotFound(description: "Not found controller:\(controller) in collection:\(self.viewIdsToViewControllers)")
    }
}
