import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("다양한 Flutter의 입력 알아보기"),
      ),
      body: Body(),
    ),
  ));
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TestCheckBox(),
        TestRadioButton(),
        TestSlider(),
        TestSwitch(),
        TestPopupMenu(),
      ],
    );
  }
}

class TestCheckBox extends StatefulWidget {
  const TestCheckBox({super.key});

  @override
  State<TestCheckBox> createState() => _TestCheckBoxState();
}

class _TestCheckBoxState extends State<TestCheckBox> {
  List<bool> values = [false, false, false];

  @override
  void initState() {
    super.initState();
    values = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: values[0],
            onChanged: (value) => changeValue(0, value ?? false)),
        Checkbox(
            value: values[1],
            onChanged: (value) => changeValue(1, value ?? false)),
        Checkbox(
            value: values[2],
            onChanged: (value) => changeValue(2, value ?? false)),
      ],
    );
  }

  void changeValue(int index, bool value) {
    setState(() {
      values[index] = value;
    });
  }
}

class TestRadioButton extends StatefulWidget {
  const TestRadioButton({super.key});

  @override
  State<TestRadioButton> createState() => _TestRadioButtonState();
}

enum TestValue {
  test1,
  test2,
  test3;
}

class _TestRadioButtonState extends State<TestRadioButton> {
  TestValue? selectValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Radio<TestValue>(
            value: TestValue.test1,
            groupValue: selectValue,
            onChanged: (value) => setState(
              () => selectValue = value!,
            ),
          ),
          title: Text(TestValue.test1.name),
          onTap: () => setState(() {
            // test1 글씨를 클릭해도 radio 클릭 인식
            if (selectValue != TestValue.test1) {
              selectValue = TestValue.test1;
            }
          }),
        ),
        Radio<TestValue>(
          value: TestValue.test2,
          groupValue: selectValue,
          onChanged: (value) => setState(
            () => selectValue = value!,
          ),
        ),
        Radio<TestValue>(
          value: TestValue.test3,
          groupValue: selectValue,
          onChanged: (value) => setState(
            () => selectValue = value!,
          ),
        ),
      ],
    );
  }
}

class TestSlider extends StatefulWidget {
  const TestSlider({super.key});

  @override
  State<TestSlider> createState() => _TestSliderState();
}

class _TestSliderState extends State<TestSlider> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$value'),
        Slider(
          value: value,
          // value 값은 double 기본형
          onChanged: (newValue) {
            setState(() => value = newValue);
          },
          divisions: 100,
          max: 100,
          min: 0,
          label: value.round().toString(),
          activeColor: Colors.grey,
        ),
      ],
    );
  }
}

class TestSwitch extends StatefulWidget {
  const TestSwitch({super.key});

  @override
  State<TestSwitch> createState() => _TestSwitchState();
}

class _TestSwitchState extends State<TestSwitch> {
  bool value = false;
  bool value2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: value,
          onChanged: (newValue) => setState(() {
            value = newValue;
          }),
          activeColor: null,
        ),
        CupertinoSwitch(
          value: value2,
          onChanged: (newValue) => setState(() {
            value2 = newValue;
          }),
          activeColor: null,
        ),
      ],
    );
  }
}

class TestPopupMenu extends StatefulWidget {
  const TestPopupMenu({super.key});

  @override
  State<TestPopupMenu> createState() => _TestPopupMenuState();
}

class _TestPopupMenuState extends State<TestPopupMenu> {
  TestValue selectValue = TestValue.test1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(selectValue.name),
        PopupMenuButton(
          itemBuilder: (context) {
            return TestValue.values
                .map((value) =>
                    PopupMenuItem(value: value, child: Text(value.name)))
                .toList();
          },
          onSelected: (newValue) => setState(() {
            selectValue = newValue;
          }),
        ),
      ],
    );
  }
}
