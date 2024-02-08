import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final String image;
  final String platform;
  const SignUpButton({
    required this.image,
    required this.platform,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: Colors.grey[400]!,
            width: 1.8,
          ),
        ),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image.toString(),
                  height: 35,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Sign Up with ${platform}",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
