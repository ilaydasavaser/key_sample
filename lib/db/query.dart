

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:key_project/db/models.dart';

enum ProductQuery {
  year,
  likesAsc,
  likesDesc,
  rated,
  sciFi,
  fantasy,
}

extension on Query<Product> {
  /// Create a firebase query from a [MovieQuery]
  Query<Product> queryBy(ProductQuery query) {
    switch (query) {
      case ProductQuery.fantasy:
        return where('genre', arrayContainsAny: ['Fantasy']);

      case ProductQuery.sciFi:
        return where('genre', arrayContainsAny: ['Sci-Fi']);

      case ProductQuery.likesAsc:
      case ProductQuery.likesDesc:
        return orderBy('likes', descending: query == ProductQuery.likesDesc);

      case ProductQuery.year:
        return orderBy('year', descending: true);

      case ProductQuery.rated:
        return orderBy('rated', descending: true);
    }
  }
}