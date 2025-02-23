import 'package:path_provider/path_provider.dart';
import 'package:task_flutter_rwid/objectbox.g.dart';
import 'package:path/path.dart' as p;

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore () {}
    final store = await openStore(directory: p.join(docsDir.path, "openbox"));
    return ObjectBox._create(store);
  }
}
