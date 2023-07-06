import 'dart:html';
import 'package:dart_playground/dart_playground.dart';
import 'package:react/react_dom.dart' as react_dom;
import 'package:react_material_ui/components/providers/unify_theme_provider.dart';

void main() {
  var content =  FancyForm()();

  react_dom.render(UnifyThemeProvider()(content), querySelector('#content'));
}
