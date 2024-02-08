import 'package:flutter/material.dart';
import 'package:indore/main.dart';
import 'package:provider/provider.dart';

class SlidingTab extends StatefulWidget {
  final String tab1;
  final String tab2;

  const SlidingTab(
      {required this.tab1,
      required this.tab2,
      
      Key? key})
      : super(key: key);

  @override
  _SlidingTabState createState() => _SlidingTabState();
}

class _SlidingTabState extends State<SlidingTab>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late final tabIndex;

  @override
  void initState() {
    super.initState();
    tabIndex = Provider.of<MyAppState>(context, listen: false);
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    // Notify listeners about the tab change
    setState(() {});

    // Update the current tab index
    print("TAB controller index: ${tabController.index}");
    tabIndex.currentTabIndex = tabController.index;
  }

  @override
  void dispose() {
    tabController.removeListener(_handleTabChange);
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300]!,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TabBar(
          labelColor: Theme.of(context).colorScheme.onSurface,
          unselectedLabelColor: Colors.grey[400]!,
          indicator: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(25),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          indicatorPadding: EdgeInsets.zero,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          controller: tabController,
          tabs: [
            Tab(
              child: Text(
                widget.tab1,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: tabController.index == 0
                      ? Theme.of(context).colorScheme.onSurface
                      : Colors.grey[400]!,
                ),
              ),
            ),
            Tab(
              child: Text(
                widget.tab2,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: tabController.index == 1
                      ? Theme.of(context).colorScheme.onSurface
                      : Colors.grey[400]!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
