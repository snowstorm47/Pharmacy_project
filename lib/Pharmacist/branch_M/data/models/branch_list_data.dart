class BranchListData {
  final String branchId;
  final String name;
  final String branchManager;
  final String address;
  final String email;

  BranchListData({
    required this.branchId,
    required this.name,
    required this.branchManager,
    required this.address,
    required this.email,
  });

  static List<BranchListData> dummyData() {
    return List.generate(
      10,
      (index) => BranchListData(
        branchId: 'Branch ${index + 1}',
        name: 'Branch Name ${index + 1}',
        branchManager: 'Manager ${index + 1}',
        address: 'Address ${index + 1}',
        email: 'branch${index + 1}@example.com',
      ),
    );
  }
}
