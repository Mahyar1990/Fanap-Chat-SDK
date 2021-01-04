//
//  HandleCallEnded.swift
//  FanapPodChatSDK
//
//  Created by MahyarZhiani on 10/15/1399 AP.
//  Copyright © 1399 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON
import FanapPodAsyncSDK


extension Chat {
    
    /// CallٍEnded Response comes from server
    func responseOfCallEnded(withMessage message: ChatMessage) {
        log.verbose("Message of type 'END_CALL' recieved", context: "Chat")
        
        let returnData = CreateReturnData(hasError:         false,
                                          errorMessage:     "",
                                          errorCode:        0,
                                          result:           message.content?.convertToJSON(),
                                          resultAsArray:    nil,
                                          resultAsString:   nil,
                                          contentCount:     message.contentCount,
                                          subjectId:        message.subjectId)
        
//        let res = CallStartResponse(messageContent: returnData.result!,
//                                    hasError:       returnData.hasError,
//                                    errorMessage:   returnData.errorMessage,
//                                    errorCode:      returnData.errorCode)
//        let model = CallEventModel(type:        CallEventTypes.CALL_CONNECT,
//                                   request:     res,
//                                   deliver:     nil,
//                                   reject:      nil,
//                                   start:       nil,
//                                   end:         nil,
//                                   connect:     nil,
//                                   reconnect:   nil)
//        Chat.sharedInstance.delegate?.callEvents(model: model)
        
        if Chat.map[message.uniqueId] != nil {
            let callback: CallbackProtocol = Chat.map[message.uniqueId]!
            callback.onResultCallback(uID:      message.uniqueId,
                                      response: returnData,
                                      success:  { (successJSON) in
                self.callAcceptCallbackToUser?(successJSON)
            }) { _ in }
            Chat.map.removeValue(forKey: message.uniqueId)
        }
        
        // if you want to send this callback on the CallStart Method, uncomment this,
        // also have to add one more parameter to 'callMap' Array on 'sendMessageWithCallback' Method!
//        else if Chat.callMap[message.uniqueId] != nil {
//            let callback: CallbackProtocol = Chat.callMap[message.uniqueId]!.first!
//            callback.onResultCallback(uID:      message.uniqueId,
//                                      response: returnData,
//                                      success:  { (successJSON) in
//                self.callRequestCallbackToUser?(successJSON)
//            }) { _ in }
//            Chat.callMap[message.uniqueId]?.removeAll()
//            Chat.callMap.removeValue(forKey: message.uniqueId)
//        }
        
    }
    
}

