//
//  iSBERgApp.swift
//  iSBERg
//
//  Created by Alexandr Nesterenko on 23.07.22.
//

import SwiftUI
import UIKit

struct User {
    var firstName: String? = nil
    var lastName: String? = nil
    var occupation: String? = nil
    var hobbies: String? = nil
    var phone: String? = nil
    var telegram: String? = nil
    var ices: Int = 0
}

class Env: ObservableObject {
    
    @Published var memberToShow: TeamMember?
    @Published var shouldShowMember: Bool = false
    
    @Published var shouldShowCongrats: Bool = false
    
    @Published var shouldShowRoadItem: Bool = false
    @Published var selectedRoadItemIndex: Int = 0
    
    @Published var shouldShowIces: Bool = false
    
    @Published var onboardingCompleted: Bool = false
    @Published var selectedTab: TabItem = .main
    
    @Published var roadMapState = RoadMapState(
        currentRoadItemIndex: 0,
        roadItems: RoadItem.roadItems
    )
    
    @Published var user: User = User()
    
    @Published var shouldShowCourse = false
}

@main
struct iSBERgApp: App {
    
    @ObservedObject var env = Env()
    
    init() {
        setupNavBar()
    }
    
    var body: some Scene {
        WindowGroup {
            if env.onboardingCompleted {
                MainView()
                    .environmentObject(env)
            } else {
                OnboardingView(onboardingItems: OnboardingItem.items)
                    .environmentObject(env)
            }
        }
    }
    
    private func setupNavBar() {
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.rounded(ofSize: 18, weight: .medium)
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.rounded(ofSize: 26, weight: .bold)
        ]
        appearance.setBackIndicatorImage(UIImage(named: "back"), transitionMaskImage: UIImage(named: "back"))
        appearance.shadowImage = UIImage()
        appearance.backgroundImage = UIImage()
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "back")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "back")
        UINavigationBar.appearance().prefersLargeTitles = false
        UINavigationBar.appearance().tintColor = .white
    }
}

extension UIFont {
    class func rounded(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        let font: UIFont
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            font = UIFont(descriptor: descriptor, size: size)
        } else {
            font = systemFont
        }
        return font
    }
}

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
