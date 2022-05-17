//
//  BaetaverseAPIService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/30.
//

import Foundation

enum BaetaverseAPIService {
    
    case signUp(permission: AuthPermission, email: String, password: String,
                name: String, phoneNumber: String, corporationName: String?,
                corporationNumber: String?)
    case login(permission: AuthPermission, email: String, password: String)
    case registerEstimateRequest(token: String, estimateRequest: EstimateRequest,
                                 products: [Product])
    case registerEstimate(token: String, estimate: Estimate)
    case queryEstimateRequests(token: String)
    case queryHSCode(token: String, code: String)
    case queryEstimateRequestDetail(token: String, id: String)
    case queryEstimates(token: String)
    
}

extension BaetaverseAPIService: APIService {
    
    var urlRequest: URLRequest? {
        switch self {
        case .signUp(let permission, let email, let password, let name,
                     let phoneNumber, let corporationName, let corporationNumber):
            let requestModel = APIRequestModel.SignUpRequest(
                permission: permission.rawValue,
                email: email,
                password: password,
                name: name,
                phoneNumber: phoneNumber,
                corporationName: corporationName,
                corporationNumber: corporationNumber
            )
            return requestModel.urlRequest
        case .login(let permission, let email, let password):
            let requestModel = APIRequestModel.LoginRequest(
                permission: permission.rawValue,
                email: email,
                password: password
            )
            return requestModel.urlRequest
        case .registerEstimateRequest(let token, let estimateRequest, let products):
            let requestModel = APIRequestModel.RegisterEstimateRequestsRequest(
                token: token,
                estimateRequest: estimateRequest,
                products: products
            )
            return requestModel.urlRequest
        case .registerEstimate(let token, let estimate):
            let requestModel = APIRequestModel.RegisterEstimateRequest(
                token: token,
                estimate: estimate
            )
            return requestModel.urlRequest
        case .queryEstimateRequests(let token):
            let requestModel = APIRequestModel.EstimateRequestsRequest(token: token)
            return requestModel.urlRequest
        case .queryHSCode(let token, let code):
            let requestModel = APIRequestModel.HSCodeRequest(
                token: token,
                code: code
            )
            return requestModel.urlRequest
        case .queryEstimateRequestDetail(let token, let id):
            let requestModel = APIRequestModel.EstimateRequestDetailRequest(
                token: token,
                id: id
            )
            return requestModel.urlRequest
        case .queryEstimates(let token):
            let requestModel = APIRequestModel.QuotationsRequst(token: token)
            return requestModel.urlRequest
        }
    }
    
}
