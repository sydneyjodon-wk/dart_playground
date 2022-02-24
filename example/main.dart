import 'dart:html';
import 'package:dart_playground/dart_playground.dart';
import 'package:react/react_dom.dart' as react_dom;

void main() {
  var content =  FancyForm()();

  react_dom.render(content, querySelector('#content'));
}
