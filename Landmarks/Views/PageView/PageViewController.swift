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
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewcontroller = UIPageViewController( transitionStyle: .scroll, navigationOrientation: .horizontal )
        
        return pageViewcontroller
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    }
}
