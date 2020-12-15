//
//  ChatDelegates.swift
//  FanapPodChatSDK
//
//  Created by MahyarZhiani on 1/30/1399 AP.
//  Copyright © 1399 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON


public protocol ChatDelegates: class {
    
    func chatConnect()
    func chatDisconnect()
    func chatReconnect()
    func chatReady(withUserInfo: User)
    func chatState(state: AsyncStateType)
    
    func chatError(errorCode: Int, errorMessage: String, errorResult: Any?)
    
    func botEvents(model: BotEventModel)
    func contactEvents(model: ContactEventModel)
    func fileUploadEvents(model: FileUploadEventModel)
    func messageEvents(model: MessageEventModel)
    func systemEvents(model: SystemEventModel)
    func threadEvents(model: ThreadEventModel)
    func userEvents(model: UserEventModel)
    func callEvents(request70: JSON?,
                    reject72: RejectCallResponse?,
                    deliver73: DeliverCallResponse?,
                    start74: CallStartResponse?)
    
}
