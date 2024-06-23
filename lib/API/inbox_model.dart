class Document {
  final String docNo;
  final String status;
  final String empName;
  final String reqDate;
  final String type;

  Document({
    required this.docNo,
    required this.status,
    required this.empName,
    required this.reqDate,
    required this.type,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      docNo: json['docNo'],
      status: json['status'],
      empName: json['empName'],
      reqDate: json['reqDate'],
      type: json['type'],
    );
  }
}

class ApiResponse {
  final bool success;
  final int count;
  final List<Document> data;

  ApiResponse({
    required this.success,
    required this.count,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Document> documentList =
        list.map((item) => Document.fromJson(item)).toList();

    return ApiResponse(
      success: json['success'],
      count: json['count'],
      data: documentList,
    );
  }
}
