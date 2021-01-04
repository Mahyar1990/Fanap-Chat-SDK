//
//  HandleCallReconnect.swift
//  FanapPodChatSDK
//
//  Created by MahyarZhiani on 10/15/1399 AP.
//  Copyright © 1399 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON
import FanapPodAsyncSDK


extension Chat {
    
    /// CallٍReconnect Response comes from server
    func responseOfCallReconnect(withMessage message: ChatMessage) {
        log.verbose("Message of type 'CALL_RECONNECT' recieved", context: "Chat")
        
        let res = ConnectReconnectCallResponse(messageContent: message.content?.convertToJSON() ?? JSON(),
                                               callId: message.subjectId ?? 0,
                                               hasError: false,
                                               errorMessage: "",
                                               errorCode: 0)
        let model = CallEventModel(type:        CallEventTypes.CALL_RECONNECT,
                                   request:     nil,
                                   deliver:     nil,
                                   reject:      nil,
                                   start:       nil,
                                   end:         nil,
                                   connect:     nil,
                                   reconnect:   res)
        Chat.sharedInstance.delegate?.callEvents(model: model)
        
    }
    
}
