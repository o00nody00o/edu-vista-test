class CategoryModel {
  String? id;
  String? name;

  CategoryModel.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
