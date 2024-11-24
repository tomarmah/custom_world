import 'package:cutom_world/bottom_nav_btn.dart';
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
              /// For testing purposes we have this
              /// empty container. later this will be replaced
              /// with pageview to allow to have the ability to
              /// change pages through it
              Positioned.fill(
                  child: Container(
                color: Colors.deepPurpleAccent,
              )),

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
                    _currentIndex = val;
                    setState(() {});
                  },
                ),
                BottomNavBtn(
                    icon: IconlyLight.search,
                    currentIndex: _currentIndex,
                    index: 1,
                    onTap: (val) {
                      _currentIndex = val;
                      setState(() {});
                    }),
                BottomNavBtn(
                    icon: IconlyLight.category,
                    currentIndex: _currentIndex,
                    index: 2,
                    onTap: (val) {
                      _currentIndex = val;
                      setState(() {});
                    }),
                BottomNavBtn(
                    icon: IconlyLight.setting,
                    currentIndex: _currentIndex,
                    index: 3,
                    onTap: (val) {
                      _currentIndex = val;
                      setState(() {});
                    }),
                BottomNavBtn(
                    icon: IconlyLight.profile,
                    currentIndex: _currentIndex,
                    index: 4,
                    onTap: (val) {
                      _currentIndex = val;
                      setState(() {});
                    }),
                SizedBox(width: AppSizes.blockSizeHorizontal * 2)
              ]),
        ),
      ),
    );
  }
}
