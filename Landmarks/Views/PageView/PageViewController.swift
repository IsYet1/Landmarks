//
//  PageViewController.swift
//  Landmarks
//
//  Created by Don McKenzie on 1/4/23.
//

import SwiftUI
import UIKit

struct PageViewcOntroller<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewcontroller = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        
        pageViewcontroller.dataSource = context.coordinator
        pageViewcontroller.delegate = context.coordinator
        
        return pageViewcontroller
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [UIHostingController(rootView: pages[currentPage])], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewcOntroller
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewcOntroller) {
            parent = pageViewController
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool
        ) {
            if completed,
               let visibileVIewcontroller = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibileVIewcontroller) {
                parent.currentPage = index
            }
        }
        
    }
}
