
class HomeSearchBean {
  String reason;
  List<Result> result;
  int errorCode;

  HomeSearchBean({this.reason, this.result, this.errorCode});

  HomeSearchBean.fromJson(Map<String, dynamic> json) {
    reason = json['reason'];
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
    errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reason'] = this.reason;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    data['error_code'] = this.errorCode;
    return data;
  }
}

class Result {
  String id;
  String itemName;
  String itemCategory;

  Result({this.id, this.itemName, this.itemCategory});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemName = json['itemName'];
    itemCategory = json['itemCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['itemName'] = this.itemName;
    data['itemCategory'] = this.itemCategory;
    return data;
  }
}