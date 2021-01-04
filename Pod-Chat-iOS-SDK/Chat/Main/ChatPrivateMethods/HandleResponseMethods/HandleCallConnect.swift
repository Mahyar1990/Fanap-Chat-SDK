//
//  HandleCallConnect.swift
//  FanapPodChatSDK
//
//  Created by MahyarZhiani on 10/15/1399 AP.
//  Copyright © 1399 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON
import FanapPodAsyncSDK


extension Chat {
    
    /// CallٍConnect Response comes from server
    func responseOfCallConnect(withMessage message: ChatMessage) {
        log.verbose("Message of type 'CALL_CONNECT' recieved", context: "Chat")
        
        let res = ConnectReconnectCallResponse(messageContent: message.content?.convertToJSON() ?? JSON(),
                                               callId: message.subjectId ?? 0,
                                               hasError: false,
                                               errorMessage: "",
                                               errorCode: 0)
        let model = CallEventModel(type:        CallEventTypes.CALL_CONNECT,
                                   request:     nil,
                                   deliver:     nil,
                                   reject:      nil,
                                   start:       nil,
                                   end:         nil,
                                   connect:     res,
                                   reconnect:   nil)
        Chat.sharedInstance.delegate?.callEvents(model: model)
        
    }
    
}
