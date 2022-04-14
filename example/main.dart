import 'dart:html';
import 'package:dart_playground/dart_playground.dart';
import 'package:react/react_client/react_interop.dart';
import 'package:react/react_dom.dart' as react_dom;
import 'package:react_material_ui/for_cp_use_only/styled.dart' as mui;
import 'package:react_material_ui/react_material_ui.dart' as mui;

void main() {
  List<ReactElement> renderTwelveChildGrids() {
    var blocks = <ReactElement>[];

    for (var i = 0; i < 12; i++) {
      blocks.add((mui.Grid()
        ..item = true
        ..xs = 1
        ..key = i
      )(
        Item()(i + 1),
      ));
    }

    return blocks;
  }
  var content =  (mui.Grid()
    ..container = true
    ..wrap = mui.GridWrap.wrap
    ..columns = 2

    ..spacing = 2
    ..['padding'] = '1.6rem'
  )(
    renderTwelveChildGrids(),
  );

  react_dom.render(content, querySelector('#content'));
}


final Item = mui.styled(mui.Box, stylesMap: const {
  'textAlign': 'center',
  'lineHeight': '7rem',
  'boxShadow': '0 0.2rem 0.4rem 0 rgba(0, 0, 0, 0.2)',
});
