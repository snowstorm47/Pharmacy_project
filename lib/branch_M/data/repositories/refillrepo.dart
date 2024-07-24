/*import 'package:clean_a/branch_M/data/models/refill_request_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RefillRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<RefillRequestData>> getRefills() async {
    final snapshot = await _firestore.collection('refills').get();
    return snapshot.docs.map((doc) => RefillRequestData.fromMap(doc.data())).toList();
  }

  Future<RefillRequestData?> addRefill({
    required String branchName,
    required String refillRequest,
    required String requestDate,
    required String requestedBy,
  }) async {
    final docRef = await _firestore.collection('refills').add({
      'branchName': branchName,
      'refillRequest': refillRequest,
      'requestDate': requestDate,
      'requestedBy': requestedBy,
    });
    final doc = await docRef.get();
    return RefillRequestData.fromMap(doc.data()!..['id'] = doc.id);
  }

  
  Future<void> updateRefill(String id, {required Map<String, dynamic> updatedData}) async {
    await _firestore.collection('refills').doc(id).update(updatedData);
  }

  Future<void> deleteRefill(String id) async {
    await _firestore.collection('refills').doc(id).delete();
  }
}
*/