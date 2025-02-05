import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mshora/widgets/button.dart';
import 'package:mshora/widgets/common_widget.dart';
import 'package:mshora/widgets/text_field.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  @override
  Widget build(BuildContext context) {
    final newH = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: SingleChildScrollView(
            child: Column(
              children: [
                height(15),
                backAppButton(context, title: "Terms & Conditions"),
                height(40),
                Row(
                  children: [
                    text(
                      "Our Policy - ",
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                    Spacer(),
                  ],
                ),
                heightMq(context, 0.02),
                text(
                    maxLines: 10,
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, ab nihil! Magni sapiente quaerat alias dignissimos tempore fuga dolorum modi voluptatibus autem voluptatem, expedita, quia ullam, iusto saepe nam? Id.'),
                heightMq(context, 0.03),
                text(
                    maxLines: 10,
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, ab nihil! Magni sapiente quaerat alias dignissimos tempore fuga dolorum modi voluptatibus autem voluptatem, expedita, quia ullam, iusto saepe nam? Id.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, ab nihil! Magni sapiente quaerat alias dignissimos tempore fuga dolorum modi voluptatibus autem voluptatem, expedita, quia ullam, iusto saepe nam? Id.'),
                heightMq(context, 0.03),
                text(
                    maxLines: 10,
                    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, ab nihil! Magni sapiente quaerat alias dignissimos tempore fuga dolorum modi voluptatibus autem voluptatem, expedita, quia ullam, iusto saepe nam? Id.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, ab nihil! Magni sapiente quaerat alias dignissimos tempore fuga dolorum modi voluptatibus autem voluptatem, expedita, quia ullam, iusto saepe nam? Id.Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, ab nihil! Magni sapiente quaerat alias dignissimos tempore fuga dolorum modi voluptatibus autem voluptatem, expedita, quia ullam, iusto saepe nam? Id.")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
