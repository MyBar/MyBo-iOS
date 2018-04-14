//
//	MBCreatorModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class MBCreatorModel : NSObject, NSCoding{

	var birth : String!
	var descriptionField : String!
	var emotion : String!
	var gender : Int!
	var gmutex : Int!
	var hometown : String!
	var id : Int!
	var inkeVerify : Int!
	var level : Int!
	var location : String!
	var nick : String!
	var portrait : String!
	var profession : String!
	var rankVeri : Int!
	var sex : Int!
	var thirdPlatform : String!
	var veriInfo : String!
	var verified : Int!
	var verifiedReason : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		birth = json["birth"].stringValue
		descriptionField = json["description"].stringValue
		emotion = json["emotion"].stringValue
		gender = json["gender"].intValue
		gmutex = json["gmutex"].intValue
		hometown = json["hometown"].stringValue
		id = json["id"].intValue
		inkeVerify = json["inke_verify"].intValue
		level = json["level"].intValue
		location = json["location"].stringValue
		nick = json["nick"].stringValue
		portrait = json["portrait"].stringValue
		profession = json["profession"].stringValue
		rankVeri = json["rank_veri"].intValue
		sex = json["sex"].intValue
		thirdPlatform = json["third_platform"].stringValue
		veriInfo = json["veri_info"].stringValue
		verified = json["verified"].intValue
		verifiedReason = json["verified_reason"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
        var dictionary = [String:Any]()
		if birth != nil{
			dictionary["birth"] = birth
		}
		if descriptionField != nil{
			dictionary["description"] = descriptionField
		}
		if emotion != nil{
			dictionary["emotion"] = emotion
		}
		if gender != nil{
			dictionary["gender"] = gender
		}
		if gmutex != nil{
			dictionary["gmutex"] = gmutex
		}
		if hometown != nil{
			dictionary["hometown"] = hometown
		}
		if id != nil{
			dictionary["id"] = id
		}
		if inkeVerify != nil{
			dictionary["inke_verify"] = inkeVerify
		}
		if level != nil{
			dictionary["level"] = level
		}
		if location != nil{
			dictionary["location"] = location
		}
		if nick != nil{
			dictionary["nick"] = nick
		}
		if portrait != nil{
			dictionary["portrait"] = portrait
		}
		if profession != nil{
			dictionary["profession"] = profession
		}
		if rankVeri != nil{
			dictionary["rank_veri"] = rankVeri
		}
		if sex != nil{
			dictionary["sex"] = sex
		}
		if thirdPlatform != nil{
			dictionary["third_platform"] = thirdPlatform
		}
		if veriInfo != nil{
			dictionary["veri_info"] = veriInfo
		}
		if verified != nil{
			dictionary["verified"] = verified
		}
		if verifiedReason != nil{
			dictionary["verified_reason"] = verifiedReason
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         birth = aDecoder.decodeObject(forKey: "birth") as? String
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         emotion = aDecoder.decodeObject(forKey: "emotion") as? String
         gender = aDecoder.decodeObject(forKey: "gender") as? Int
         gmutex = aDecoder.decodeObject(forKey: "gmutex") as? Int
         hometown = aDecoder.decodeObject(forKey: "hometown") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         inkeVerify = aDecoder.decodeObject(forKey: "inke_verify") as? Int
         level = aDecoder.decodeObject(forKey: "level") as? Int
         location = aDecoder.decodeObject(forKey: "location") as? String
         nick = aDecoder.decodeObject(forKey: "nick") as? String
         portrait = aDecoder.decodeObject(forKey: "portrait") as? String
         profession = aDecoder.decodeObject(forKey: "profession") as? String
         rankVeri = aDecoder.decodeObject(forKey: "rank_veri") as? Int
         sex = aDecoder.decodeObject(forKey: "sex") as? Int
         thirdPlatform = aDecoder.decodeObject(forKey: "third_platform") as? String
         veriInfo = aDecoder.decodeObject(forKey: "veri_info") as? String
         verified = aDecoder.decodeObject(forKey: "verified") as? Int
         verifiedReason = aDecoder.decodeObject(forKey: "verified_reason") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if birth != nil{
			aCoder.encode(birth, forKey: "birth")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if emotion != nil{
			aCoder.encode(emotion, forKey: "emotion")
		}
		if gender != nil{
			aCoder.encode(gender, forKey: "gender")
		}
		if gmutex != nil{
			aCoder.encode(gmutex, forKey: "gmutex")
		}
		if hometown != nil{
			aCoder.encode(hometown, forKey: "hometown")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if inkeVerify != nil{
			aCoder.encode(inkeVerify, forKey: "inke_verify")
		}
		if level != nil{
			aCoder.encode(level, forKey: "level")
		}
		if location != nil{
			aCoder.encode(location, forKey: "location")
		}
		if nick != nil{
			aCoder.encode(nick, forKey: "nick")
		}
		if portrait != nil{
			aCoder.encode(portrait, forKey: "portrait")
		}
		if profession != nil{
			aCoder.encode(profession, forKey: "profession")
		}
		if rankVeri != nil{
			aCoder.encode(rankVeri, forKey: "rank_veri")
		}
		if sex != nil{
			aCoder.encode(sex, forKey: "sex")
		}
		if thirdPlatform != nil{
			aCoder.encode(thirdPlatform, forKey: "third_platform")
		}
		if veriInfo != nil{
			aCoder.encode(veriInfo, forKey: "veri_info")
		}
		if verified != nil{
			aCoder.encode(verified, forKey: "verified")
		}
		if verifiedReason != nil{
			aCoder.encode(verifiedReason, forKey: "verified_reason")
		}

	}

}
