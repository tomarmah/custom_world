import 'package:cutom_world/bottom_nav_btn.dart';
import 'package:cutom_world/clipper.dart';
import 'package:cutom_world/constants.dart';
import 'package:cutom_world/size_config.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class FinalView extends StatefulWidget {
  const FinalView({super.key});

  @override
  State<FinalView> createState() => _FinalViewState();
}

class _FinalViewState extends State<FinalView> {
  int _currentIndex = 0, index = 0;
  late final PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void animateToPage(int page) {
    controller.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().initSizes(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text(
          'Custom Bottom Navigation Bar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              /// Main Pages
              Positioned.fill(
                child: PageView(
                  controller: controller,
                  onPageChanged: (val) {
                    _currentIndex = val;
                    setState(() {});
                  },
                  children: screens,
                ),
              ),

              /// For testing purposes we have this
              /// empty container. later this will be replaced
              /// with pageview to allow to have the ability to
              /// change pages through it
              // Positioned.fill(
              //     child: Container(
              //   color: Colors.deepPurpleAccent,
              // )),

              Positioned(
                  bottom: 0, right: 0, left: 0, child: _buildBottomNavBar())
            ],
          )),
    );
  }

  Widget _buildBottomNavBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(AppSizes.blockSizeHorizontal * 4.5, 0,
          AppSizes.blockSizeHorizontal * 4.5, 70),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        elevation: 10,
        child: Container(
          width: AppSizes.screenWidth,
          height: AppSizes.blockSizeHorizontal * 18,
          decoration: BoxDecoration(
              color: Colors.grey[900], borderRadius: BorderRadius.circular(30)),
          child: Stack(
            children: [
              /// List of bottom navigation bar icons
              Positioned(
                bottom: 0,
                top: 0,
                left: AppSizes.blockSizeHorizontal * 1,
                right: AppSizes.blockSizeHorizontal * 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: AppSizes.blockSizeHorizontal * 2),
                      BottomNavBtn(
                        icon: IconlyLight.home,
                        currentIndex: _currentIndex,
                        index: 0,
                        onTap: (val) {
                          if (_currentIndex != val) {
                            animateToPage(val);
                          }
                          _currentIndex = val;
                          setState(() {});
                        },
                      ),
                      BottomNavBtn(
                          icon: IconlyLight.search,
                          currentIndex: _currentIndex,
                          index: 1,
                          onTap: (val) {
                            if (_currentIndex != val) {
                              animateToPage(val);
                            }
                            _currentIndex = val;
                            setState(() {});
                          }),
                      BottomNavBtn(
                          icon: IconlyLight.category,
                          currentIndex: _currentIndex,
                          index: 2,
                          onTap: (val) {
                            if (_currentIndex != val) {
                              animateToPage(val);
                            }
                            _currentIndex = val;
                            setState(() {});
                          }),
                      BottomNavBtn(
                          icon: IconlyLight.setting,
                          currentIndex: _currentIndex,
                          index: 3,
                          onTap: (val) {
                            if (_currentIndex != val) {
                              animateToPage(val);
                            }
                            _currentIndex = val;
                            setState(() {});
                          }),
                      BottomNavBtn(
                          icon: IconlyLight.profile,
                          currentIndex: _currentIndex,
                          index: 4,
                          onTap: (val) {
                            if (_currentIndex != val) {
                              animateToPage(val);
                            }
                            _currentIndex = val;
                            setState(() {});
                          }),
                      SizedBox(width: AppSizes.blockSizeHorizontal * 2)
                    ]),
              ),

              /// Animated indicator for showing selected icon item
              /// Option 1
              AnimatedPositioned(
                left: _currentIndex == 0 ? 24 : (((_currentIndex) * 66) + 24),
                duration: const Duration(milliseconds: 300),
                curve: Curves.decelerate,
                child: Column(
                  children: [
                    /// Top Side Indicator
                    Container(
                      height: AppSizes.blockSizeHorizontal * 1,
                      width: AppSizes.blockSizeHorizontal * 11,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10)),
                    ),

                    /// Clipper
                    ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        height: AppSizes.blockSizeHorizontal * 15,
                        width: AppSizes.blockSizeHorizontal * 12,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: gradient,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                      ),
                    )
                  ],
                ),
              ),

              /// Option 2
              // Positioned(
              //   // left: _currentIndex == 0 ? 24 : (((_currentIndex) * 66) + 24),
              //   // duration: const Duration(milliseconds: 300),
              //   // curve: Curves.decelerate,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       const SizedBox(width: 3),
              //       IndicatorW(currentIndex: _currentIndex, index: 0),
              //       IndicatorW(currentIndex: _currentIndex, index: 1),
              //       IndicatorW(currentIndex: _currentIndex, index: 2),
              //       IndicatorW(currentIndex: _currentIndex, index: 3),
              //       IndicatorW(currentIndex: _currentIndex, index: 4),
              //       const SizedBox(width: 3)
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class IndicatorW extends StatelessWidget {
  const IndicatorW(
      {super.key, required this.currentIndex, required this.index});

  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
      opacity: (currentIndex == index) ? 1 : 0,
      child: Container(
        height: AppSizes.blockSizeHorizontal * 1,
        width: AppSizes.blockSizeHorizontal * 11,
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
