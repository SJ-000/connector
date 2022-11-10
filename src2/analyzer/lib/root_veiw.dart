import 'views/analyzer_view.dart';
import 'views/dummy_view.dart';
import 'viewmodels/analyzer_viewmodel.dart';
import 'viewmodels/dummy_viewmodel.dart';

import 'utils/theme.dart';

import 'package:macos_ui/macos_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppTheme(),
      builder: (context, _) {
        final appTheme = context.watch<AppTheme>();
        return MacosApp(
          title: 'Analyzer',
          theme: MacosThemeData.light(),
          darkTheme: MacosThemeData.dark(),
          themeMode: appTheme.mode,
          debugShowCheckedModeBanner: false,
          //
          home: const MacosBody(),
        );
      },
    );
  }
}

class MacosBody extends StatefulWidget {
  const MacosBody({super.key});

  @override
  State<MacosBody> createState() => _MacosBodyState();
}

class _MacosBodyState extends State<MacosBody> {
  double ratingValue = 0;
  double sliderValue = 0;
  bool value = false;

  int pageIndex = 0;

  final analyzerViewModel = AnalyzerViewModel();
  final dummyViewModel = DummyViewModel();

  List<Widget> pages = [];

  @override
  void initState() {
    pages = [
      CupertinoTabView(
        builder: (_) => AnalyzerView(
          viewModel: analyzerViewModel,
        ),
      ),
      CupertinoTabView(
        builder: (_) => DummyView(
          viewModel: dummyViewModel,
        ),
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformMenuBar(
      menus: const [
        PlatformMenu(
          label: 'Analyzer',
          menus: [
            PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.about,
            ),
            PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.quit,
            ),
          ],
        ),
      ],
      child: MacosWindow(
        sidebar: Sidebar(
          dragClosed: false,
          isResizable: false,
          minWidth: 150,
          builder: (context, controller) {
            return SidebarItems(
              currentIndex: pageIndex,
              onChanged: (i) => setState(() => pageIndex = i),
              scrollController: controller,
              itemSize: SidebarItemSize.large,
              items: [
                const SidebarItem(
                  leading: MacosIcon(CupertinoIcons.doc),
                  label: Text(
                    'Analyzer',
                  ),
                ),
                SidebarItem(
                  leading: const MacosIcon(CupertinoIcons.nosign),
                  label: Text(
                    'Dummy',
                    style: TextStyle(
                      color: MacosTheme.brightnessOf(context) == Brightness.dark
                          ? MacosColors.tertiaryLabelColor.darkColor
                          : MacosColors.tertiaryLabelColor,
                    ),
                  ),
                ),
              ],
            );
          },
          bottom: const MacosListTile(
            leading: MacosIcon(CupertinoIcons.profile_circled),
            title: Text('SJ Kim'),
            subtitle: Text('seongjunk@twitter.com'),
          ),
        ),
        child: IndexedStack(
          index: pageIndex,
          children: pages,
        ),
      ),
    );
  }
}
