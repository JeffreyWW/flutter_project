import 'package:flutter_project/models/style_info_list.dart';

class FloorInfo {

  final List<StyleInfo> styleInfoList;
  final String floorId;
  final String pageId;

	FloorInfo.fromJsonMap(Map<String, dynamic> map): 
		styleInfoList = List<StyleInfo>.from(map["styleInfoList"].map((it) => StyleInfo.fromJsonMap(it))),
		floorId = map["floorId"],
		pageId = map["pageId"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['styleInfoList'] = styleInfoList != null ? 
			this.styleInfoList.map((v) => v.toJson()).toList()
			: null;
		data['floorId'] = floorId;
		data['pageId'] = pageId;
		return data;
	}
}
