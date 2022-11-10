import '../viewmodels/dummy_viewmodel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class DummyView extends StatefulWidget {
  final DummyViewModel viewModel;

  const DummyView({super.key, required this.viewModel});

  @override
  State<DummyView> createState() => DummyViewState();
}

class DummyViewState extends State<DummyView> {
  @override
  Widget build(BuildContext context) {
    return const MacosScaffold();
  }
}
