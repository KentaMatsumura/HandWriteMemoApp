class ListMemo {
  int id;
  bool isSelected;
  String title;
  DateTime createdAt;

  ListMemo({this.id, this.title, this.createdAt, this.isSelected = false});

  Map<String, dynamic> toDatabaseJson() => {
        'id': this.id,
        'title': this.title,
        'created_at': this.createdAt.toUtc().toIso8601String(),
        'is_selected': this.isSelected ? 1 : 0,
      };

  factory ListMemo.fromDatabaseJson(Map<String, dynamic> data) => ListMemo(
        id: data['id'],
        title: data['title'],
        createdAt: DateTime.parse(data["created_at"]).toLocal(),
        isSelected: data['is_selected'] == 1 ? true : false,
      );
}
