//
//  CallEventModel.swift
//  FanapPodChatSDK
//
//  Created by MahyarZhiani on 10/15/1399 AP.
//  Copyright © 1399 Mahyar Zhiani. All rights reserved.
//

import Foundation


open class CallEventModel {
    
    public let type:        CallEventTypes
    public let request:     CreateCallResponse?
    public let deliver:     DeliverCallResponse?
    public let reject:      RejectCallResponse?
    public let start:       CallStartResponse?
    public let end:         Int?
    public let connect:     ConnectReconnectCallResponse?
    public let reconnect:   ConnectReconnectCallResponse?
    
    init(type:      CallEventTypes,
         request:   CreateCallResponse?,
         deliver:   DeliverCallResponse?,
         reject:    RejectCallResponse?,
         start:     CallStartResponse?,
         end:       Int?,
         connect:   ConnectReconnectCallResponse?,
         reconnect: ConnectReconnectCallResponse?) {
        
        self.type       = type
        self.request    = request
        self.deliver    = deliver
        self.reject     = reject
        self.start      = start
        self.end        = end
        self.connect    = connect
        self.reconnect  = reconnect
    }
    
}
