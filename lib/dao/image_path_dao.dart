import 'package:handwrite_memo_app/entity/image_path.dart';
import 'package:path_provider/path_provider.dart';

class ImagePathDao {
  Future<List<ImagePath>> getAll() async {
    final _appDocumentsDirectory = await getApplicationDocumentsDirectory();

    List<ImagePath> file = _appDocumentsDirectory.list() != null
        ? await _appDocumentsDirectory
            .list()
            .map((item) => ImagePath.fromDevice(item))
            .toList()
        : [];
    file.remove(null);

    return file;
  }
}
