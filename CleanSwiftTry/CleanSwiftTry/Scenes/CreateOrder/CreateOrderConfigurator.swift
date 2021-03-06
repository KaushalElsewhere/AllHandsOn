//
//  CreateOrderConfigurator.swift
//  CleanSwiftTry
//
//  Created by Kaushal Elsewhere on 10/05/2017.
//  Copyright (c) 2017 Elsewhere. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension CreateOrderViewController: CreateOrderPresenterOutput
{
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    router.passDataToNextScene(segue)
  }
}

extension CreateOrderInteractor: CreateOrderViewControllerOutput
{
}

extension CreateOrderPresenter: CreateOrderInteractorOutput
{
}

class CreateOrderConfigurator
{
  // MARK: - Object lifecycle
  
  static let sharedInstance = CreateOrderConfigurator()
  
  fileprivate init() {}
  
  // MARK: - Configuration
  
  func configure(_ viewController: CreateOrderViewController)
  {
    let router = CreateOrderRouter()
    router.viewController = viewController
    
    let presenter = CreateOrderPresenter()
    presenter.output = viewController
    
    let interactor = CreateOrderInteractor()
    interactor.output = presenter
    
    viewController.output = interactor
    viewController.router = router
  }
}
