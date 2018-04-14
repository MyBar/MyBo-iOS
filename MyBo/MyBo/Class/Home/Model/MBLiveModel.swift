//
//	MBLiveModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class MBLiveModel : NSObject, NSCoding{

	var city : String!
	var creator : MBCreatorModel!
	var extendType : String!
	var group : Int!
	var id : String!
	var image : String!
	var landscape : Int!
	var like : [AnyObject]!
	var link : Int!
	var liveType : String!
	var multi : Int!
	var name : String!
	var onlineUsers : Int!
	var optimal : Int!
	var pubStat : Int!
	var roomId : Int!
	var rotate : Int!
	var shareAddr : String!
	var slot : Int!
	var status : Int!
	var streamAddr : String!
	var version : Int!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		city = json["city"].stringValue
		let creatorJson = json["creator"]
		if !creatorJson.isEmpty{
			creator = MBCreatorModel(fromJson: creatorJson)
		}
		extendType = json["extend_type"].stringValue
		group = json["group"].intValue
		id = json["id"].stringValue
		image = json["image"].stringValue
		landscape = json["landscape"].intValue
		like = [AnyObject]()
		let likeArray = json["like"].arrayValue
		for likeJson in likeArray{
            like.append(likeJson.stringValue as AnyObject)
		}
		link = json["link"].intValue
		liveType = json["live_type"].stringValue
		multi = json["multi"].intValue
		name = json["name"].stringValue
		onlineUsers = json["online_users"].intValue
		optimal = json["optimal"].intValue
		pubStat = json["pub_stat"].intValue
		roomId = json["room_id"].intValue
		rotate = json["rotate"].intValue
		shareAddr = json["share_addr"].stringValue
		slot = json["slot"].intValue
		status = json["status"].intValue
		streamAddr = json["stream_addr"].stringValue
		version = json["version"].intValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
        var dictionary = [String:Any]()
		if city != nil{
			dictionary["city"] = city
		}
		if creator != nil{
			dictionary["creator"] = creator.toDictionary()
		}
		if extendType != nil{
			dictionary["extend_type"] = extendType
		}
		if group != nil{
			dictionary["group"] = group
		}
		if id != nil{
			dictionary["id"] = id
		}
		if image != nil{
			dictionary["image"] = image
		}
		if landscape != nil{
			dictionary["landscape"] = landscape
		}
		if like != nil{
			dictionary["like"] = like
		}
		if link != nil{
			dictionary["link"] = link
		}
		if liveType != nil{
			dictionary["live_type"] = liveType
		}
		if multi != nil{
			dictionary["multi"] = multi
		}
		if name != nil{
			dictionary["name"] = name
		}
		if onlineUsers != nil{
			dictionary["online_users"] = onlineUsers
		}
		if optimal != nil{
			dictionary["optimal"] = optimal
		}
		if pubStat != nil{
			dictionary["pub_stat"] = pubStat
		}
		if roomId != nil{
			dictionary["room_id"] = roomId
		}
		if rotate != nil{
			dictionary["rotate"] = rotate
		}
		if shareAddr != nil{
			dictionary["share_addr"] = shareAddr
		}
		if slot != nil{
			dictionary["slot"] = slot
		}
		if status != nil{
			dictionary["status"] = status
		}
		if streamAddr != nil{
			dictionary["stream_addr"] = streamAddr
		}
		if version != nil{
			dictionary["version"] = version
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         city = aDecoder.decodeObject(forKey: "city") as? String
         creator = aDecoder.decodeObject(forKey: "creator") as? MBCreatorModel
         extendType = aDecoder.decodeObject(forKey: "extend_type") as? String
         group = aDecoder.decodeObject(forKey: "group") as? Int
         id = aDecoder.decodeObject(forKey: "id") as? String
         image = aDecoder.decodeObject(forKey: "image") as? String
         landscape = aDecoder.decodeObject(forKey: "landscape") as? Int
         like = aDecoder.decodeObject(forKey: "like") as? [AnyObject]
         link = aDecoder.decodeObject(forKey: "link") as? Int
         liveType = aDecoder.decodeObject(forKey: "live_type") as? String
         multi = aDecoder.decodeObject(forKey: "multi") as? Int
         name = aDecoder.decodeObject(forKey: "name") as? String
         onlineUsers = aDecoder.decodeObject(forKey: "online_users") as? Int
         optimal = aDecoder.decodeObject(forKey: "optimal") as? Int
         pubStat = aDecoder.decodeObject(forKey: "pub_stat") as? Int
         roomId = aDecoder.decodeObject(forKey: "room_id") as? Int
         rotate = aDecoder.decodeObject(forKey: "rotate") as? Int
         shareAddr = aDecoder.decodeObject(forKey: "share_addr") as? String
         slot = aDecoder.decodeObject(forKey: "slot") as? Int
         status = aDecoder.decodeObject(forKey: "status") as? Int
         streamAddr = aDecoder.decodeObject(forKey: "stream_addr") as? String
         version = aDecoder.decodeObject(forKey: "version") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
	{
		if city != nil{
			aCoder.encode(city, forKey: "city")
		}
		if creator != nil{
			aCoder.encode(creator, forKey: "creator")
		}
		if extendType != nil{
			aCoder.encode(extendType, forKey: "extend_type")
		}
		if group != nil{
			aCoder.encode(group, forKey: "group")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if image != nil{
			aCoder.encode(image, forKey: "image")
		}
		if landscape != nil{
			aCoder.encode(landscape, forKey: "landscape")
		}
		if like != nil{
			aCoder.encode(like, forKey: "like")
		}
		if link != nil{
			aCoder.encode(link, forKey: "link")
		}
		if liveType != nil{
			aCoder.encode(liveType, forKey: "live_type")
		}
		if multi != nil{
			aCoder.encode(multi, forKey: "multi")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if onlineUsers != nil{
			aCoder.encode(onlineUsers, forKey: "online_users")
		}
		if optimal != nil{
			aCoder.encode(optimal, forKey: "optimal")
		}
		if pubStat != nil{
			aCoder.encode(pubStat, forKey: "pub_stat")
		}
		if roomId != nil{
			aCoder.encode(roomId, forKey: "room_id")
		}
		if rotate != nil{
			aCoder.encode(rotate, forKey: "rotate")
		}
		if shareAddr != nil{
			aCoder.encode(shareAddr, forKey: "share_addr")
		}
		if slot != nil{
			aCoder.encode(slot, forKey: "slot")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if streamAddr != nil{
			aCoder.encode(streamAddr, forKey: "stream_addr")
		}
		if version != nil{
			aCoder.encode(version, forKey: "version")
		}

	}

}
