//
//  SearchInteractor.swift
//  iMusic
//
//  Created by Alex on 25.09.2020.
//  Copyright (c) 2020 Alex Sadunenko. All rights reserved.
//

import UIKit

protocol SearchBusinessLogic {
  func makeRequest(request: Search.Model.Request.RequestType)
}

class SearchInteractor: SearchBusinessLogic {

  var presenter: SearchPresentationLogic?
  var service: SearchService?
  
  func makeRequest(request: Search.Model.Request.RequestType) {
    if service == nil {
      service = SearchService()
    }
  }
  
}
