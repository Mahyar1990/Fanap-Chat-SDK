//
//  InviteeVoIdTypes.swift
//  FanapPodChatSDK
//
//  Created by MahyarZhiani on 10/4/1398 AP.
//  Copyright © 1398 Mahyar Zhiani. All rights reserved.
//

import Foundation


public enum InviteeVoIdTypes {
    
    case TO_BE_USER_SSO_ID
    case TO_BE_USER_CONTACT_ID
    case TO_BE_USER_CELLPHONE_NUMBER
    case TO_BE_USER_USERNAME
    case TO_BE_USER_ID
    
    public func stringValue() -> String {
        switch self {
        case .TO_BE_USER_SSO_ID:            return "TO_BE_USER_SSO_ID"
        case .TO_BE_USER_CONTACT_ID:        return "TO_BE_USER_CONTACT_ID"
        case .TO_BE_USER_CELLPHONE_NUMBER:  return "TO_BE_USER_CELLPHONE_NUMBER"
        case .TO_BE_USER_USERNAME:          return "TO_BE_USER_USERNAME"
        case .TO_BE_USER_ID:                return "TO_BE_USER_ID"
        }
    }
    
    public func intValue() -> Int {
        switch self {
        case .TO_BE_USER_SSO_ID:            return 1
        case .TO_BE_USER_CONTACT_ID:        return 2
        case .TO_BE_USER_CELLPHONE_NUMBER:  return 3
        case .TO_BE_USER_USERNAME:          return 4
        case .TO_BE_USER_ID:                return 5
        }
    }
    
}


