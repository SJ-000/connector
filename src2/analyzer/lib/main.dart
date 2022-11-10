import 'root_viewmodel.dart';
import 'root_veiw.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => RootViewModel()),
    ],
    child: const RootView(),
  ));
}
