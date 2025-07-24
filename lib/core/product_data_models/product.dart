class Product{

  final String? image;
  final String? title;
  final String? price;
  final String? category;


  Product(
  //     this.image,
      //this is the optional method where image is required and other is not
  //     [
  //     this.category,
  // this.title,
  // this.price,
  // ]
      {
     this.image,
     this.price,
     this.title,
     this.category,

  }
  );
  String get safeImage => image ?? 'assets/images/placeholder.jpg';
  String get safeTitle => title ?? 'Unnamed Product';
  String get safePrice => price ?? 'N/A';
  String get safeCategory => category ?? 'Unknown';
}