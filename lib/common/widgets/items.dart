class ItemsList {
  bool? success;
  int? count;
  List<Items>? items;

  ItemsList({this.success, this.count, this.items});

  ItemsList.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    count = json['count'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['count'] = count;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? title;
  String? status;
  String? docNo;
  String? type;
  String? empName;
  String? reqDate;
  String? department;
  String? position;
  String? hospital;
  String? admissionDate;
  String? symptoms;
  String? welfareBal;
  String? business;

  Items(
      {this.title,
      this.status,
      this.docNo,
      this.type,
      this.empName,
      this.reqDate,
      this.department,
      this.position,
      this.hospital,
      this.admissionDate,
      this.symptoms,
      this.welfareBal,
      this.business});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    status = json['status'];
    docNo = json['docNo'];
    type = json['type'];
    empName = json['empName'];
    reqDate = json['reqDate'];
    department = json['department'];
    position = json['position'];
    hospital = json['hospital'];
    admissionDate = json['admissionDate'];
    symptoms = json['symptoms'];
    welfareBal = json['welfareBal'];
    business = json['business'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['status'] = status;
    data['docNo'] = docNo;
    data['type'] = type;
    data['empName'] = empName;
    data['reqDate'] = reqDate;
    data['department'] = department;
    data['position'] = position;
    data['hospital'] = hospital;
    data['admissionDate'] = admissionDate;
    data['symptoms'] = symptoms;
    data['welfareBal'] = welfareBal;
    data['business'] = business;
    return data;
  }
}
