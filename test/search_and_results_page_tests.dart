import 'package:filmes_api/main.dart';
import 'package:filmes_api/seach_and_results/search_and_result_page.dart';
import 'package:filmes_api/seach_and_results/widgets/search_widget.dart';
import 'package:filmes_api/seach_and_results/widgets/widgets_seach/search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Checking if the search & results page contains a Form to manage and send the user movie name input',
      (WidgetTester tester) async {
    await tester.pumpWidget(const FilmesAPI());
    final formWidget = find.byWidgetPredicate((widget) {
      if (widget is Form) {
        return true;
      }
      return false;
    });
    expect(formWidget, findsOneWidget);
  });

  testWidgets(
      'Checking if the search & results page contains a Form to manage and send the user movie name input',
      (WidgetTester tester) async {
    await tester.pumpWidget(const FilmesAPI());
    final searchWidget = find.byWidgetPredicate((widget) {
      if (widget is SearchButton) {
        return true;
      }
      return false;
    });
    expect(searchWidget, findsOneWidget);
  });
}
