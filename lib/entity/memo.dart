class Memo {
  int id;
  String fileName;
  String path;
  DateTime createdAt;
  bool isPositive;
  bool isSelected;

  Memo(
      {this.id,
      this.fileName,
      this.path,
      this.createdAt,
      this.isPositive,
      this.isSelected = false});

  Map<String, dynamic> toDatabaseJson() => {
        'id': this.id,
        'file_name': this.fileName,
        'created_at': this.createdAt.toUtc().toIso8601String(),
        'is_positive': this.isPositive ? 1 : 0,
        'is_selected': this.isSelected ? 1 : 0,
      };

  factory Memo.fromDatabaseJson(Map<String, dynamic> data, String path) => Memo(
        id: data['id'],
        fileName: data['file_name'],
        path: "$path/${data['file_name']}",
        createdAt: DateTime.parse(data["created_at"]).toLocal(),
        isPositive: data['is_positive'] == 1 ? true : false,
        isSelected: data['is_selected'] == 1 ? true : false,
      );
}
