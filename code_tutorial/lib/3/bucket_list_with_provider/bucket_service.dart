import 'package:flutter/material.dart';
import 'main.dart';

/// Bucket responsible
class BucketService extends ChangeNotifier {
  List<Bucket> bucketList = [
    Bucket('sleep', false), // dummy data
  ];

  /// Add bucket void
  void createBucket(String job) {
    bucketList.add(Bucket(job, false));
    notifyListeners();
  }

  /// Edit bucket void
  void updateBucket(Bucket bucket, int index) {
    bucketList[index] = bucket;
    notifyListeners();
  }

  void deleteBucket(int index) {
    bucketList.removeAt(index);
    notifyListeners();
  }
}
