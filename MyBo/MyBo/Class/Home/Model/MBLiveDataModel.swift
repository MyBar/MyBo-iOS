//
//	MBLiveDataModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class MBLiveDataModel : NSObject, NSCoding{

	var count : Int!
	var dmError : Int!
	var errorMsg : String!
	var expireTime : Int!
	var lives : [MBLiveModel]!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		count = json["count"].intValue
		dmError = json["dm_error"].intValue
		errorMsg = json["error_msg"].stringValue
		expireTime = json["expire_time"].intValue
		lives = [MBLiveModel]()
		let livesArray = json["lives"].arrayValue
		for livesJson in livesArray{
			let value = MBLiveModel(fromJson: livesJson)
			lives.append(value)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
        var dictionary = [String:Any]()
		if count != nil{
			dictionary["count"] = count
		}
		if dmError != nil{
			dictionary["dm_error"] = dmError
		}
		if errorMsg != nil{
			dictionary["error_msg"] = errorMsg
		}
		if expireTime != nil{
			dictionary["expire_time"] = expireTime
		}
		if lives != nil{
			var dictionaryElements = [[String:Any]]()
			for livesElement in lives {
				dictionaryElements.append(livesElement.toDictionary())
			}
			dictionary["lives"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         count = aDecoder.decodeObject(forKey: "count") as? Int
         dmError = aDecoder.decodeObject(forKey: "dm_error") as? Int
         errorMsg = aDecoder.decodeObject(forKey: "error_msg") as? String
         expireTime = aDecoder.decodeObject(forKey: "expire_time") as? Int
         lives = aDecoder.decodeObject(forKey: "lives") as? [MBLiveModel]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if count != nil{
			aCoder.encode(count, forKey: "count")
		}
		if dmError != nil{
			aCoder.encode(dmError, forKey: "dm_error")
		}
		if errorMsg != nil{
			aCoder.encode(errorMsg, forKey: "error_msg")
		}
		if expireTime != nil{
			aCoder.encode(expireTime, forKey: "expire_time")
		}
		if lives != nil{
			aCoder.encode(lives, forKey: "lives")
		}

	}

}
