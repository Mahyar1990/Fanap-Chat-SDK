//
//  ClientDTO.swift
//  FanapPodChatSDK
//
//  Created by MahyarZhiani on 9/4/1399 AP.
//  Copyright © 1399 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON

open class ClientDTO {
    
    public var brokerAddress:   String?
    public var clientId:        String?
    public var desc:            String?
    public var sendKey:         String?
    public var topicReceive:    String?
    public var topicSend:       String?
    
    public init(messageContent: JSON) {
        self.brokerAddress  = messageContent["brokerAddress"].string
        self.clientId       = messageContent["clientId"].string
        self.desc           = messageContent["desc"].string
        self.sendKey        = messageContent["sendKey"].string
        self.topicReceive   = messageContent["topicReceive"].string
        self.topicSend      = messageContent["topicSend"].string
    }
    
    public init(clientId:       String,
                topicReceive:   String,
                topicSend:      String,
                brokerAddress:  String,
                desc:           String,
                sendKey:        String) {
        self.brokerAddress  = brokerAddress
        self.clientId       = clientId
        self.desc           = desc
        self.sendKey        = sendKey
        self.topicReceive   = topicReceive
        self.topicSend      = topicSend
    }
    
    public init(theClientDTO: ClientDTO) {
        self.brokerAddress  = theClientDTO.brokerAddress
        self.clientId       = theClientDTO.clientId
        self.desc           = theClientDTO.desc
        self.sendKey        = theClientDTO.sendKey
        self.topicReceive   = theClientDTO.topicReceive
        self.topicSend      = theClientDTO.topicSend
    }
    
    public func formatToJSON() -> JSON {
        let result: JSON = ["brokerAddress":    brokerAddress ?? NSNull(),
                            "clientId":         clientId ?? NSNull(),
                            "desc":             desc ?? NSNull(),
                            "sendKey":          sendKey ?? NSNull(),
                            "topicReceive":     topicReceive ?? NSNull(),
                            "topicSend":        topicSend ?? NSNull()]
        return result
    }
    
}
