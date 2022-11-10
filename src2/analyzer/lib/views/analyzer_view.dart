import '../viewmodels/analyzer_viewmodel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class AnalyzerView extends StatefulWidget {
  final AnalyzerViewModel viewModel;

  const AnalyzerView({super.key, required this.viewModel});

  @override
  State<AnalyzerView> createState() => AnalyzerViewState();
}

class AnalyzerViewState extends State<AnalyzerView> {
  // String popupValue = 'One';
  // String languagePopupValue = 'English';
  // bool switchValue = false;
  // final _tabController = MacosTabController(initialIndex: 0, length: 3);

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      toolBar: ToolBar(
        title: const Text('Run for all'),
        titleWidth: 150.0,
        leading: MacosTooltip(
          message: 'Run for all',
          useMousePosition: false,
          child: MacosIconButton(
            icon: MacosIcon(
              CupertinoIcons.play,
              color: MacosTheme.brightnessOf(context).resolve(
                const Color.fromRGBO(0, 0, 0, 0.5),
                const Color.fromRGBO(255, 255, 255, 0.5),
              ),
              size: 20.0,
            ),
            boxConstraints: const BoxConstraints(
              minHeight: 20,
              minWidth: 20,
              maxWidth: 48,
              maxHeight: 38,
            ),
            // onPressed: () => MacosWindowScope.of(context).toggleSidebar(),
            onPressed: () => {debugPrint("Run for all")},
          ),
        ),
      ),
      children: [
        ResizablePane(
          minWidth: 180,
          startWidth: 200,
          windowBreakpoint: 700,
          resizableSide: ResizableSide.right,
          builder: (_, __) {
            return getLeftPane();
          },
        ),
        ContentArea(
          builder: (context, scrollController) {
            return getContentArea();
          },
        ),
      ],
    );
  }

  Widget getLeftPane() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Resizable Pane'),
            SizedBox(height: 10),
            Text("data")
          ],
        ));
  }

  Widget getContentArea() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text("aaa"),
          //
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MacosBackButton(
                onPressed: () => debugPrint('click'),
                fillColor: Colors.transparent,
              ),
              const SizedBox(width: 16.0),
              MacosBackButton(
                onPressed: () => debugPrint('click'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('MacosIconButton'),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MacosIconButton(
                icon: const MacosIcon(
                  CupertinoIcons.star_fill,
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(7),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              const MacosIconButton(
                icon: MacosIcon(
                  CupertinoIcons.plus_app,
                ),
                shape: BoxShape.circle,
                //onPressed: () {},
              ),
              const SizedBox(width: 8),
              MacosIconButton(
                icon: const MacosIcon(
                  CupertinoIcons.minus_square,
                ),
                backgroundColor: Colors.transparent,
                onPressed: () {},
              ),
            ],
          ),
          //
        ],
      ),
    );
  }
}
