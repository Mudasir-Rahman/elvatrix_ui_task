class Product {
  final String? image;
  final String? title;
  final String? price;
  final String? category;

  Product({this.image, this.price, this.title, this.category});

  String get safeImage => image ?? 'assets/images/placeholder.jpg';
  String get safeTitle => title ?? 'Unnamed Product';
  String get safePrice => price ?? 'N/A';
  String get safeCategory => category ?? 'Unknown';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Product &&
            runtimeType == other.runtimeType &&
            title == other.title &&
            price == other.price &&
            image == other.image;
  }

  @override
  int get hashCode => title.hashCode ^ price.hashCode ^ image.hashCode;
}
