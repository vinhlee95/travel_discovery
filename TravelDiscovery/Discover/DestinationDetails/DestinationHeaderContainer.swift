//
//  DestinationHeaderContainer.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 2/2/21.
//

import SwiftUI
import Kingfisher

// Create a view that represents a UIKit view controller
// https://developer.apple.com/documentation/swiftui/uiviewcontrollerrepresentable
struct DestinationHeaderContainer: UIViewControllerRepresentable {
    let imageUrls: [String]
    
    func makeUIViewController(context: Context) -> UIViewController {
        let pvc = CustomPageViewController(imageUrls: imageUrls)
        return pvc
    }
    
    typealias UIViewControllerType = UIViewController
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    // Integrate SwiftUI views into current UIKit view hierarchy
    // https://developer.apple.com/documentation/swiftui/uihostingcontroller
    
    private let firstVC = UIHostingController(rootView: Text("First view"))
    private let secondVC = UIHostingController(rootView: Text("Second view"))
    private let thirdVC = UIHostingController(rootView: Text("Third view"))
    private var imageUrls: [String]
    lazy var allVCs: [UIViewController] = imageUrls.map { (imageName) -> UIViewController in
        let vc = UIHostingController(rootView:
            ZStack {
                Color.black
                KFImage(URL(string: imageName))
                    .resizable().scaledToFit()
            }
        )
        return vc
    }
    
    // We need this to show the pagination dots
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return allVCs.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allVCs.firstIndex(of: viewController) else {return nil}
        
        return index == 0 ? nil : allVCs[index-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allVCs.firstIndex(of: viewController) else {return nil}
        
        return index == allVCs.count - 1 ? nil : allVCs[index + 1]
    }
    
    init(imageUrls: [String]) {
        // Initialize imageUrls injected from calling code
        self.imageUrls = imageUrls
        
        // Show page dot
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = .orange
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        // Specify the very first page of the view
        if let firstVc = allVCs.first {
            setViewControllers([firstVc], direction: .forward, animated: true, completion: nil)            
        }
        
        // Specify dataSource so that the view is swipe-able
        self.dataSource = self
        
        // This is needed to show pagination dots
        self.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct DestinationHeaderContainer_Previews: PreviewProvider {
    static var previews: some View {
//        DestinationHeaderContainer()
        // Uncomment this to see the context where this view is used in
        NavigationView {
            DestinationDetailsView(city: "Paris")
        }
    }
}
