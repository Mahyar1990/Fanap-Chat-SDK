//
//  CallEndedCallback.swift
//  FanapPodChatSDK
//
//  Created by MahyarZhiani on 10/15/1399 AP.
//  Copyright © 1399 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON
import SwiftyBeaver
import FanapPodAsyncSDK


extension Chat {


    public class CallEndedCallback: CallbackProtocol {
        
        func onResultCallback(uID:      String,
                              response: CreateReturnData,
                              success:  @escaping callbackTypeAlias,
                              failure:  @escaping callbackTypeAlias) {
            log.verbose("CallAcceptedCallback", context: "Chat")

            if let content = response.result {
                // return start response callback
                // ToDo:
                
//                let res = CallStartResponse(messageContent: content,
//                                            hasError:       response.hasError,
//                                            errorMessage:   response.errorMessage,
//                                            errorCode:      response.errorCode)
//                success(res)
            }
        }

    }

}
