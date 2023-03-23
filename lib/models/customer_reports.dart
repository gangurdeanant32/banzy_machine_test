import 'dart:convert';

CustomerReportsResponse customerReportsResponseFromJson(String str) =>
    CustomerReportsResponse.fromJson(json.decode(str));

String customerReportsResponseToJson(CustomerReportsResponse data) => json.encode(data.toJson());

class CustomerReportsResponse {
  CustomerReportsResponse({
    this.user,
    required this.reports,
  });

  User? user;
  List<Report> reports;

  factory CustomerReportsResponse.fromJson(Map<String, dynamic> json) => CustomerReportsResponse(
        user: User.fromJson(json["user"]),
        reports: List<Report>.from(json["reports"].map((x) => Report.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "reports": List<dynamic>.from(reports.map((x) => x.toJson())),
      };
}

class Report {
  Report({
    required this.date,
    this.optIns,
  });

  String date;
  OptInsClass? optIns;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        date: json["date"],
        optIns: (json["opt_ins"].toString().contains('[]')) ? OptInsClass() : OptInsClass.fromJson(json["opt_ins"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "opt_ins": optIns,
      };
}

class OptInsClass {
  OptInsClass({
    this.breakfast,
    this.lunch,
    this.dinner,
  });

  String? breakfast;
  String? lunch;
  String? dinner;

  factory OptInsClass.fromJson(Map<String, dynamic> json) => OptInsClass(
        breakfast: json["breakfast"] ?? 'NA',
        lunch: json["lunch"] ?? 'NA',
        dinner: json["dinner"] ?? 'NA',
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['breakfast'] = breakfast;
    data['lunch'] = lunch;
    data['dinner'] = dinner;
    return data;
  }
}

class User {
  User({
    this.id,
    this.fName,
    this.lName,
    this.phone,
    this.email,
    this.image,
    this.isPhoneVerified,
    this.emailVerifiedAt,
    this.emailVerificationToken,
    this.cmFirebaseToken,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.orderCount,
    this.empId,
    this.departmentId,
    this.isVeg,
    this.isSatOpted,
  });

  int? id;
  String? fName;
  String? lName;
  String? phone;
  String? email;
  dynamic image;
  int? isPhoneVerified;
  dynamic emailVerifiedAt;
  dynamic emailVerificationToken;
  String? cmFirebaseToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? status;
  int? orderCount;
  String? empId;
  int? departmentId;
  int? isVeg;
  int? isSatOpted;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fName: json["f_name"],
        lName: json["l_name"],
        phone: json["phone"],
        email: json["email"],
        image: json["image"],
        isPhoneVerified: json["is_phone_verified"],
        emailVerifiedAt: json["email_verified_at"],
        emailVerificationToken: json["email_verification_token"],
        cmFirebaseToken: json["cm_firebase_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
        orderCount: json["order_count"],
        empId: json["emp_id"],
        departmentId: json["department_id"],
        isVeg: json["is_veg"],
        isSatOpted: json["is_sat_opted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "f_name": fName,
        "l_name": lName,
        "phone": phone,
        "email": email,
        "image": image,
        "is_phone_verified": isPhoneVerified,
        "email_verified_at": emailVerifiedAt,
        "email_verification_token": emailVerificationToken,
        "cm_firebase_token": cmFirebaseToken,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
        "order_count": orderCount,
        "emp_id": empId,
        "department_id": departmentId,
        "is_veg": isVeg,
        "is_sat_opted": isSatOpted,
      };
}
