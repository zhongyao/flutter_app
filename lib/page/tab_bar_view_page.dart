import 'dart:async';

import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:startup_namer/page/widget/skeleton_item.dart';

class TabBarViewPage extends StatefulWidget {
  const TabBarViewPage({Key? key}) : super(key: key);

  @override
  TabBarViewPageState createState() {
    return TabBarViewPageState();
  }
}

class TabBarViewPageState extends State<TabBarViewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _listCount = 20;
  int _gridCount = 20;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: EasyRefresh.builder(
        header: const ClassicHeader(
          clamping: true,
          position: IndicatorPosition.locator,
          mainAxisAlignment: MainAxisAlignment.end,
          dragText: 'Pull to refresh',
          armedText: 'Release ready',
          readyText: 'Refreshing...',
          processingText: 'Refreshing...',
          processedText: 'Succeeded',
          noMoreText: 'No more',
          failedText: 'Failed',
          messageText: 'Last updated at %T',
        ),
        footer: const ClassicFooter(
          position: IndicatorPosition.locator,
          dragText: 'Pull to load',
          armedText: 'Release ready',
          readyText: 'Loading...',
          processingText: 'Loading...',
          processedText: 'Succeeded',
          noMoreText: 'No more',
          failedText: 'Failed',
          messageText: 'Last updated at %T',
        ),
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                if (_tabController.index == 0) {
                  _listCount = 20;
                } else {
                  _gridCount = 20;
                }
              });
            }
          });
        },
        onLoad: () async {
          await Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              setState(() {
                if (_tabController.index == 0) {
                  _listCount += 10;
                } else {
                  _gridCount += 10;
                }
              });
            }
          });
        },
        childBuilder: (context, physics) {
          return ScrollConfiguration(
            behavior: const ERScrollBehavior(),
            child: ExtendedNestedScrollView(
              physics: physics,
              onlyOneScrollInBody: true,
              pinnedHeaderSliverHeightBuilder: () {
                return MediaQuery.of(context).padding.top + kToolbarHeight;
              },
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  const HeaderLocator.sliver(clearExtent: false),
                  SliverAppBar(
                    expandedHeight: 120,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        'TabBarView',
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.titleLarge?.color),
                      ),
                      centerTitle: false,
                    ),
                  ),
                ];
              },
              body: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    labelColor: themeData.colorScheme.primary,
                    indicatorColor: themeData.colorScheme.primary,
                    tabs: const <Widget>[
                      Tab(
                        text: 'List',
                      ),
                      Tab(
                        text: 'Grid',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        ExtendedVisibilityDetector(
                          uniqueKey: const Key('Tab0'),
                          child: _AutomaticKeepAlive(
                            child: CustomScrollView(
                              physics: physics,
                              slivers: [
                                SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                  return const SkeletonItem();
                                }, childCount: _listCount)),
                                const FooterLocator.sliver(),
                              ],
                            ),
                          ),
                        ),
                        ExtendedVisibilityDetector(
                          uniqueKey: const Key('Tab1'),
                          child: _AutomaticKeepAlive(
                            child: CustomScrollView(
                              physics: physics,
                              slivers: [
                                SliverGrid(
                                    delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                      return const SkeletonItem(
                                        direction: Axis.horizontal,
                                      );
                                    }, childCount: _gridCount),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 6 / 7,
                                    )),
                                const FooterLocator.sliver(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AutomaticKeepAlive extends StatefulWidget {
  final Widget child;

  const _AutomaticKeepAlive({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<_AutomaticKeepAlive> createState() => _AutomaticKeepAliveState();
}

class _AutomaticKeepAliveState extends State<_AutomaticKeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
