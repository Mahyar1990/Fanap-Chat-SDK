//
//  Participant.swift
//  Chat
//
//  Created by Mahyar Zhiani on 7/23/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON


//#######################################################################################
//#############################      Participant        (formatDataToMakeParticipant)
//#######################################################################################

open class Participant {
    /*
     * + ParticipantVO      Participant:
     *    - cellphoneNumber:    String?
     *    - contactId:          Int?
     *    - email:              String?
     *    - firstName:          String?
     *    - id:                 Int?
     *    - image:              String?
     *    - lastName:           String?
     *    - myFriend:           Bool?
     *    - name:               String?
     *    - notSeenDuration:    Int?
     *    - online:             Bool?
     *    - receiveEnable:      Bool?
     *    - sendEnable:         Bool?
     */
    
    public let admin:           Bool?
    public let blocked:         Bool?
    public let cellphoneNumber: String?
    public let contactId:       Int?
    public let coreUserId:      Int?
    public let email:           String?
    public let firstName:       String?
    public let id:              Int?
    public let image:           String?
    public let lastName:        String?
    public let myFriend:        Bool?
    public let name:            String?
    public let notSeenDuration: Int?
    public let online:          Bool?
    public let receiveEnable:   Bool?
    public let sendEnable:      Bool?
    
    init(messageContent: JSON) {
        self.admin              = messageContent["admin"].bool
        self.blocked            = messageContent["blocked"].bool
        self.cellphoneNumber    = messageContent["cellphoneNumber"].string
        self.contactId          = messageContent["contactId"].int
        self.coreUserId         = messageContent["coreUserId"].int
        self.email              = messageContent["email"].string
        self.firstName          = messageContent["firstName"].string
        self.id                 = messageContent["id"].int
        self.image              = messageContent["image"].string
        self.lastName           = messageContent["lastName"].string
        self.myFriend           = messageContent["myFriend"].bool
        self.name               = messageContent["name"].string
        self.notSeenDuration    = messageContent["notSeenDuration"].int
        self.online             = messageContent["online"].bool
        self.receiveEnable      = messageContent["receiveEnable"].bool
        self.sendEnable         = messageContent["sendEnable"].bool
    }
    
    func formatDataToMakeParticipant() -> Participant {
        return self
    }
    
    func formatToJSON() -> JSON {
        let result: JSON = ["admin":            admin ?? NSNull(),
                            "blocked":          blocked ?? NSNull(),
                            "cellphoneNumber":  cellphoneNumber ?? NSNull(),
                            "contactId":        contactId ?? NSNull(),
                            "coreUserId":       coreUserId ?? NSNull(),
                            "email":            email ?? NSNull(),
                            "firstName":        firstName ?? NSNull(),
                            "id":               id ?? NSNull(),
                            "image":            image ?? NSNull(),
                            "lastName":         lastName ?? NSNull(),
                            "myFriend":         myFriend ?? NSNull(),
                            "name":             name ?? NSNull(),"notSeenDuration":  notSeenDuration ?? NSNull(),
                            "online":           online ?? NSNull(),"receiveEnable":    receiveEnable ?? NSNull(),
                            "sendEnable":       sendEnable ?? NSNull()]
        return result
    }
    
}
