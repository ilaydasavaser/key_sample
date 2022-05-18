
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:key_project/db/models.dart';

final productRef = FirebaseFirestore.instance
    .collection('eksik_urunler')
    .withConverter<Product>(
      fromFirestore: (snapshots, _) => Product.fromJson(snapshots.data()!),
      toFirestore: (product, _) => product.toJson(),
    );
    