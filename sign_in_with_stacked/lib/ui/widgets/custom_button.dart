import 'package:flutter/material.dart';
import 'package:sign_in_with_stacked/ui/common/app_colors.dart';
import 'package:sign_in_with_stacked/ui/common/border_radius.dart';
import 'package:sign_in_with_stacked/ui/common/text_styles.dart';

// class CustomButton extends StatelessWidget {
//   final bool isResponsive;
//   final double? height;
//   final double? width;
//   final Color? color;
//   final bool isLoading;
//   final String? label;
//   final TextStyle? labelStyle;
//   final VoidCallback onTap;
//   final Color? borderColor;
//   final BorderRadiusGeometry? borderRadius;
//   const CustomButton(
//       {super.key,
//       this.isResponsive = false,
//       this.height,
//       this.isLoading = false,
//       this.width,
//       this.color,
//       this.labelStyle,
//       required this.onTap,
//       this.borderColor,
//       this.borderRadius,
//       this.label});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: isResponsive == true ? height : 50,
//         width: isResponsive == true ? width : double.infinity,
//         decoration: ShapeDecoration(
//           color: isResponsive || isLoading == true ? color : socialBlue,
//           shape: RoundedRectangleBorder(
//             borderRadius:
//                 isResponsive == true ? borderRadius! : mediumBorderRadius,
//             side: BorderSide(
//               color: isResponsive == true ? borderColor! : socialBlue,
//             ),
//           ),
//         ),
//         child: Center(
//           child: Text(
//             label ?? '',
//             style: labelStyle,
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final FocusNode? focus;
  final bool? isLoading;
  final bool? isIcon;
  final Color? color;

  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.focus,
      this.isLoading,
      this.isIcon,
      this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: color ??
              (isLoading == null || isLoading == false
                  ? kPrimaryColor
                  : kLoadingColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          minimumSize: const Size(double.infinity, 50)),
      child: isIcon == null
          ? Text(text,
              style: kTitleSmall.copyWith(
                color: color == null
                    ? ktextColor
                    : kPrimaryColor,
              ))
          : Text(
            text,
            style: kTitleSmall.copyWith(
              color: ktextColor,
            ),
          ),
    );
  }
}
