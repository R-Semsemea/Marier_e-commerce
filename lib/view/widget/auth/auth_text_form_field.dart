import 'package:flutter/material.dart';
import 'package:marier_ecommerce/core/constant/color.dart';
import 'package:marier_ecommerce/core/constant/screen_dimensions.dart';

class CustomAuthTextFieldForm extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final IconData suffixIcon;
  final TextEditingController textEditingController;
  final bool obscureText;
  final void Function()? onPressedSuffixIcon;
  final String? Function(String?) inputValidator;
  final TextInputType keyboardType;

  const CustomAuthTextFieldForm({
    Key? key,
    required this.fieldName,
    required this.hintText,
    required this.suffixIcon,
    required this.textEditingController,
    required this.inputValidator,
    required this.keyboardType,
    this.obscureText = false,
    this.onPressedSuffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            height: ScreenDimension.height * 0.0283,
            child: Text(
              fieldName,
              style: Theme.of(context).textTheme.bodySmall,
            )),
        Container(
          margin: EdgeInsets.only(bottom: ScreenDimension.height * 0.0197),
          width: double.infinity,
          //height: ScreenDimension.height * 0.0603,
          child: TextFormField(
            keyboardType: keyboardType,
            validator: inputValidator,
            style: Theme.of(context).textTheme.bodyMedium,
            obscureText: obscureText,
            obscuringCharacter: "*",
            controller: textEditingController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  color: AppColor.grey,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  color: AppColor.primaryColor,
                ),
              ),
              hintText: " $hintText",
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              suffixIcon: IconButton(
                onPressed: onPressedSuffixIcon ?? () {},
                icon: Icon(suffixIcon),
                color: AppColor.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
