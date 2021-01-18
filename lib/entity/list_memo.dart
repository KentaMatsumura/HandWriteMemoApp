class ListMemo {
  int id;
  bool isSelected;
  String title;

  ListMemo({this.id, this.title, this.isSelected = false});

  Map<String, dynamic> toDatabaseJson() => {
        'id': this.id,
        'title': this.title,
        'is_selected': this.isSelected ? 1 : 0,
      };

  factory ListMemo.fromDatabaseJson(Map<String, dynamic> data) => ListMemo(
        id: data['id'],
        title: data['title'],
        isSelected: data['is_selected'] == 1 ? true : false,
      );
}
