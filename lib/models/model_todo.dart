class ModelTodo {
  int? id;
  String? title;
  String? description;
  String? createddAt;
  String? modifideAt;
  
  ModelTodo({
    this.id,
    this.title,
    this.description,
    this.createddAt,
    this.modifideAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdAt': createddAt,
      'modifideAt': modifideAt,
    };
  }

  factory ModelTodo.fromMap(Map<String, dynamic> map) {
    return ModelTodo(
      id: map['id'] ?? '' ,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      createddAt: map['createdAt'] ?? '',
      modifideAt: map['modifideAt'] ?? '',
    );
  }
}
