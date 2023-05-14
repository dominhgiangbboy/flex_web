import 'package:flutter_flex_website/data/models.dart';

final SkillItemModel flutter = SkillItemModel(
  name: 'Flutter',
  description: 'Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
);
final List<SkillModel> skillModel = [
  SkillModel(
    name: 'Mobile development',
    description: 'I have been developing mobile applications for 3 years. I have experience in developing applications for Android and iOS using Flutter.',
    items: [
      flutter,
      flutter,
      flutter,
    ],
  ),
  SkillModel(
    name: 'Web development',
    description: 'I have been developing web applications for 3 years. I have experience in developing applications for web using Flutter.',
    items: [
      flutter,
      flutter,
    ],
  ),
  SkillModel(
    name: 'Desktop development',
    description: 'I have been developing desktop applications for 3 years. I have experience in developing applications for desktop using Flutter.',
    items: [
      flutter,
      flutter,
      flutter,
    ],
  ),
];
