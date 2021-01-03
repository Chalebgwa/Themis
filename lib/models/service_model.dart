enum LawType { CRIMINAL, CIVIL }

class ServiceModel {
  final String description;
  final String name;
  final String imageUrl;
  final double price;
  final LawType lawType;

  ServiceModel(this.description, this.name, this.imageUrl, this.price, this.lawType);
}
