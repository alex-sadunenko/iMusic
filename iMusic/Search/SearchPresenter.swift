//
//  SearchPresenter.swift
//  iMusic
//
//  Created by Alex on 25.09.2020.
//  Copyright (c) 2020 Alex Sadunenko. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
  func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
  weak var viewController: SearchDisplayLogic?
  
  func presentData(response: Search.Model.Response.ResponseType) {
  
  }
  
}
