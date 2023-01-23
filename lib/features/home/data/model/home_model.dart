class HomeModel {
  late final List<Products> allProducts;

  HomeModel.fromjson(json) {
    allProducts = List.from(json).map((e) => Products.fromJson(e)).toList();
  }
}

class Products {
  final num? id;
  final String? title;
  final num? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;
 
  Products({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  Products.fromJson(Map<String, dynamic> json)
      : id = json['id'] ,
        title = json['title'] as String?,
        price = json['price'] ,
        description = json['description'] as String?,
        category = json['category'] as String?,
        image = json['image'] as String?,
        rating = (json['rating'] as Map<String, dynamic>?) != null
            ? Rating.fromJson(json['rating'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson(data) => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating?.toJson()
      };
}

class Rating {
  final num? rate;
  final num? count;

  Rating({
    this.rate,
    this.count,
  });

  Rating.fromJson(Map<String, dynamic> json)
      : rate = json['rate'] ,
        count = json['count'] ;

  Map<String, dynamic> toJson() => {'rate': rate, 'count': count};
}
