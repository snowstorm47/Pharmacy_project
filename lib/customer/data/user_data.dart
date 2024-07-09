class DataModel {
  final String employeeId;
  final String employeeName;
  final String phone;
  final String companyName;
  final String email;

  DataModel({
    required this.employeeId,
    required this.employeeName,
    required this.phone,
    required this.companyName,
    required this.email,
  });

  DataModel copyWith({
    String? employeeId,
    String? employeeName,
    String? phone,
    String? companyName,
    String? email,
  }) {
    return DataModel(
      employeeId: employeeId ?? this.employeeId,
      employeeName: employeeName ?? this.employeeName,
      phone: phone ?? this.phone,
      companyName: companyName ?? this.companyName,
      email: email ?? this.email,
    );
  }
}
