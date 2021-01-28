import 'package:handwrite_memo_app/dao/image_path_dao.dart';

class ImagePathRepository {
  final imagePathDao = ImagePathDao();

  Future getAllImagePath() => imagePathDao.getAll();
}
