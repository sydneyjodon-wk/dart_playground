import 'package:over_react/over_react.dart';

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

    return Dom.form()(
      (Dom.label()..htmlFor = 'first-name')('First Name'),
      (Dom.input()
        ..type = 'text'
        ..onChange = ((SyntheticFormEvent e) => firstName.set(e.target.value))
        ..id = 'first-name'
      )(),
      (Dom.label()..htmlFor = 'last-name')('Last Name'),
      (Dom.input()
        ..type = 'text'
        ..onChange = ((SyntheticFormEvent e) => lastName.set(e.target.value))
        ..id = 'last-name'
      )(),
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

    return (Dom.button()
      ..addTestId('fancy-button')
      ..type = 'submit'
      ..className = 'fancy-class-name${disabled ? ' disabled' : ''}'
      ..addProps(props)
    )(props.children);
  },
  _$FancySubmitButtonConfig, // ignore: undefined_identifier
);
