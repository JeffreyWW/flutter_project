import 'package:flutter_project/models/floor_info_list.dart';

class Floor {

  final String bgColor;
  final List<FloorInfo> floorInfoList;

	Floor.fromJsonMap(Map<String, dynamic> map): 
		bgColor = map["bgColor"],
		floorInfoList = List<FloorInfo>.from(map["floorInfoList"].map((it) => FloorInfo.fromJsonMap(it)));

	Map<String, dynamic> toJson() {


		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['bgColor'] = bgColor;
		data['floorInfoList'] = floorInfoList != null ? 
			this.floorInfoList.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
