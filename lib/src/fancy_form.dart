import 'package:over_react/over_react.dart';
import 'package:react_material_ui/react_material_ui.dart' as mui;

part 'fancy_form.over_react.g.dart';

mixin FancyFormProps on UiProps {
  /// The submit button text.
  String buttonText;
}

final FancyForm = uiFunction<FancyFormProps>(
      (props) {
    // Default props
    final buttonText = props.buttonText ?? 'Submit';

    final firstName = useState('');
    final lastName = useState('');

    return (mui.Stack()..spacing = 2..alignItems='center')(
      (mui.TextField()..label = 'First Name'..onChange = ((SyntheticFormEvent e) => firstName.set(e.target.value)))(),
      (mui.TextField()..label = 'Last Name'..onChange = ((SyntheticFormEvent e) => lastName.set(e.target.value)))(),
      (FancySubmitButton()
        ..disabled = firstName.value.isEmpty || lastName.value.isEmpty
      )(
        buttonText,
      ),
    );
  },
  _$FancyFormConfig, // ignore: undefined_identifier
);

class FancySubmitButtonProps = UiProps with DomPropsMixin;

final FancySubmitButton = uiFunction<FancySubmitButtonProps>(
      (props) {
    // Default props
    final disabled = props.disabled ?? false;

    return (mui.Button()
      ..addTestId('fancy-button')
      ..type = 'submit'
      ..size = mui.ButtonSize.small
      ..className = 'fancy-class-name${disabled ? ' disabled' : ''}'
      ..addProps(props)
    )(props.children);
  },
  _$FancySubmitButtonConfig, // ignore: undefined_identifier
);
