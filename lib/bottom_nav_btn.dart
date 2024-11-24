import 'package:cutom_world/size_config.dart';
import 'package:flutter/material.dart';

class BottomNavBtn extends StatelessWidget {
  const BottomNavBtn(
      {super.key,
      required this.icon,
      required this.index,
      required this.currentIndex,
      required this.onTap});

  final IconData icon;
  final int index;
  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    AppSizes().initSizes(context);
    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: Container(
          height: AppSizes.blockSizeHorizontal * 13,
          width: AppSizes.blockSizeHorizontal * 17,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Stack(
            alignment: Alignment.center,
            children: [
              /// Black icon - this acts as a shadow
              (currentIndex == index)
                  ? Positioned(
                      left: AppSizes.blockSizeHorizontal * 4,
                      bottom: AppSizes.blockSizeHorizontal * 1.5,
                      child: Icon(
                        icon,
                        color: Colors.black,
                        size: AppSizes.blockSizeHorizontal * 8,
                      ),
                    )
                  : const SizedBox.shrink(),

              /// Main Yellow Icon
              AnimatedOpacity(
                opacity: (currentIndex == index) ? 1 : 0.08,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
                child: Icon(
                  icon,
                  color: Colors.yellow[300],
                  size: AppSizes.blockSizeHorizontal * 8,
                ),
              )
            ],
          )),
    );
  }
}
