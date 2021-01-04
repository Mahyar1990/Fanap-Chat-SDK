//
//  HandleCallRejected.swift
//  FanapPodChatSDK
//
//  Created by MahyarZhiani on 9/4/1399 AP.
//  Copyright © 1399 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON
import FanapPodAsyncSDK


extension Chat {
    
    /// CallRejected Response comes from server
    func responseOfCallRejected(withMessage message: ChatMessage) {
        log.verbose("Message of type 'CALL_REJECT' recieved", context: "Chat")
        
        var customResult: JSON?
        if let cr = message.content?.convertToJSON() {
            customResult = cr
            customResult!["isRejected"] = JSON(true)
        }
        
        let returnData = CreateReturnData(hasError:         false,
                                          errorMessage:     "",
                                          errorCode:        0,
                                          result:           customResult,
                                          resultAsArray:    nil,
                                          resultAsString:   nil,
                                          contentCount:     message.contentCount,
                                          subjectId:        message.subjectId)
        
        let res = RejectCallResponse(messageContent:    returnData.result!,
                                     isRejected:        true,
                                     hasError:          returnData.hasError,
                                     errorMessage:      returnData.errorMessage,
                                     errorCode:         returnData.errorCode)
        let model = CallEventModel(type:        CallEventTypes.CALL_REJECT,
                                   request:     nil,
                                   deliver:     nil,
                                   reject:      res,
                                   start:       nil,
                                   end:         nil,
                                   connect:     nil,
                                   reconnect:   nil)
        Chat.sharedInstance.delegate?.callEvents(model: model)
        
        if Chat.callMap[message.uniqueId] != nil {
            let callback: CallbackProtocol = Chat.callMap[message.uniqueId]!.first!
            callback.onResultCallback(uID: message.uniqueId, response: returnData, success: { (successJSON) in
                self.callRequestCallbackToUser?(successJSON)
            }) { _ in }
            Chat.callMap[message.uniqueId]?.removeAll()
            Chat.callMap.removeValue(forKey: message.uniqueId)
        }
        
    }
    
}
