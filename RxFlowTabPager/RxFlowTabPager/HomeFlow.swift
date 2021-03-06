//
//  HomeFlow.swift
//  RxFlowTabPager
//
//  Created by 이서준 on 2022/03/24.
//

import UIKit
import RxFlow
import RxSwift
import RxCocoa

class HomeFlow: Flow {
    var root: Presentable {
        return navigationController
    }
    
    let navigationController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? MainSteps else { return .none }
        switch step {
        case .initialization:
            let viewController = ChildViewController(page: 1)
            navigationController.pushViewController(viewController, animated: true)
            return .one(flowContributor: .contribute(withNext: viewController))
        case .pageTapped(let index):
            print("In HomeFlow@")
            let viewController = DetailViewController()
            navigationController.pushViewController(viewController, animated: true)
            return .one(flowContributor: .contribute(withNext: viewController))
        case .detailPageInteraction:
            print("HomeFlow's detailPageInteraction")
            return .none
        default:
            return .none
        }
    }
}
