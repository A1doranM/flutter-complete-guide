import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Text(((data["question"] as int) + 1) as String),
                Expanded(
                  child: Column(
                    children: [
                      Text(data["question"] as String),
                      const SizedBox(height: 5),
                      Text(data["user_answer"] as String),
                      Text(data["correct_answer"] as String),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
