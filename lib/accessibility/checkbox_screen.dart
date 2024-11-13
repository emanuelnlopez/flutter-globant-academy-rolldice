import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({super.key});

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  var _checkboxValue = false;
  var _checkboxListTileValue = false;

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).accessibleNavigation;
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox Accessibility Example')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.account_box_sharp,
                size: 30,
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                Checkbox(
                  value: _checkboxValue,
                  onChanged: (_) =>
                      setState(() => _checkboxValue = !_checkboxValue),
                ),
                const _TermsAndConditionsLinkUsingTextRich(),
              ],
            ),
            const SizedBox(height: 30.0),
            MergeSemantics(
              child: Row(
                children: [
                  Checkbox(
                    value: _checkboxValue,
                    onChanged: (_) =>
                        setState(() => _checkboxValue = !_checkboxValue),
                  ),
                  const Flexible(child: _TermsAndConditionsLinkUsingRichText()),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            MergeSemantics(
              child: Row(
                children: [
                  Checkbox(
                    value: _checkboxValue,
                    onChanged: (_) => setState(
                      () => _checkboxValue = !_checkboxValue,
                    ),
                  ),
                  const Flexible(child: _TermsAndConditionsLinkUsingTextRich()),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            CheckboxListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              controlAffinity: ListTileControlAffinity.leading,
              title: const _TermsAndConditionsLinkUsingTextRich(),
              value: _checkboxListTileValue,
              onChanged: (_) => setState(
                () => _checkboxListTileValue = !_checkboxListTileValue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TermsAndConditionsLinkUsingRichText extends StatelessWidget {
  const _TermsAndConditionsLinkUsingRichText();

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(
          text: 'I accept the ',
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: 'text and conditions',
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => print('open Terms & Conditions page'),
            ),
          ],
        ),
      );
}

class _TermsAndConditionsLinkUsingTextRich extends StatelessWidget {
  const _TermsAndConditionsLinkUsingTextRich();

  @override
  Widget build(BuildContext context) => Text.rich(
        TextSpan(
          text: 'I accept the ',
          children: [
            TextSpan(
              text: 'text and conditions',
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => print('open Terms & Conditions page'),
            ),
          ],
        ),
      );
}
