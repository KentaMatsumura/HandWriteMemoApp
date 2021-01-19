class ListMemo {
  int id;
  bool isSelected;
  bool isPositive;
  String text;
  DateTime createdAt;

  ListMemo(
      {this.id,
      this.text,
      this.createdAt,
      this.isPositive,
      this.isSelected = false});

  Map<String, dynamic> toDatabaseJson() => {
        'id': this.id,
        'text': this.text,
        'is_positive': this.isPositive ? 1 : 0,
        'created_at': this.createdAt.toUtc().toIso8601String(),
        'is_selected': this.isSelected ? 1 : 0,
      };

  factory ListMemo.fromDatabaseJson(Map<String, dynamic> data) => ListMemo(
        id: data['id'],
        text: data['text'],
        isPositive: data['is_positive'] == 1 ? true : false,
        createdAt: DateTime.parse(data["created_at"]).toLocal(),
        isSelected: data['is_selected'] == 1 ? true : false,
      );
}
