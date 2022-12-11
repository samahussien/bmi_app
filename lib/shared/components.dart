
import 'package:bmi/shared/style.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class GenderColumn extends StatelessWidget {
  final IconData icon;
  final String text;
  const GenderColumn({
    Key? key,
    required this.icon,
    required this.text,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          text,
          style:
          labelTextStyle,
        )
      ],
    );
  }
}
class MainContainer extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
 final VoidCallback? function;
  const MainContainer({
    this.function,
    this.cardChild,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: cardChild,
      ),
    );
  }
}



class BottomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const BottomButton({
    Key? key,required this.label,required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container( alignment: Alignment.center,
        child: Text(label.toUpperCase(),style:largeButtonTextStyle,),
        color: bottomContainerColor,
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}
