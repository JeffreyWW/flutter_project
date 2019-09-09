
class StyleInfo {

  final String styleId;
  final String styleName;

	StyleInfo.fromJsonMap(Map<String, dynamic> map): 
		styleId = map["styleId"],
		styleName = map["styleName"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['styleId'] = styleId;
		data['styleName'] = styleName;
		return data;
	}
}
