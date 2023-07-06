@TestOn('browser')
import 'dart:developer';

import 'package:dart_playground/dart_playground.dart';
import 'package:react_testing_library/matchers.dart';
import 'package:react_testing_library/react_testing_library.dart' as rtl;
import 'package:react_testing_library/user_event.dart';
import 'package:test/test.dart';

main() {
  group('FancyForm', () {
    group('by default', () {
      rtl.RenderResult view;

      // This runs before each test in this group runs.
      setUp(() {
        view = rtl.render(FancyForm()());
      });

      test('renders two empty inputs and a fancy submit button', () {
        expect(view.getByLabelText('First Name'), hasValue(''));
        expect(view.getByLabelText('Last Name'), hasValue(''));
        expect(
          view.getByRole('button', name: 'Submit'),
          allOf(isDisabled, hasClasses('fancy-class-name disabled')),
        );
      });

      test('FancySubmitButton applies correct classes based on disabled state',
              () {
            final button = view.getByRole('button', name: 'Submit');

            expect(button, isDisabled,
                reason:
                'the submit button is disabled by default because the form inputs are empty');
            expect(button, hasClasses('fancy-class-name disabled'));

            debugger();

            // Perform the user interaction that would cause the button to become enabled.
            UserEvent.type(view.getByLabelText('First Name'), 'Jane');
            UserEvent.type(view.getByLabelText('Last Name'), 'Doe');

            debugger();

            expect(button, isNot(isDisabled));
            expect(button, hasClasses('fancy-class-name'));
          });

      // You could also probably have tests here to verify that the button is disabled when only one of the inputs has text.

      // Might add a test for what is expected to happen when the button is clicked.
    });

    // You generally want to exercise each of the component's props in at least one test.
    test('sets the submit button text correctly', () {
      final view = rtl.render((FancyForm()..buttonText = 'FANCY Submit')());
      expect(view.getByRole('button', name: 'FANCY Submit'), isInTheDocument);
    });
  });
}
