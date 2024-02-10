import 'dart:developer';

import 'package:dndapp/widgets/form/validators.dart';
import 'package:dndapp/widgets/spells/schools.dart';
import 'package:flutter/material.dart';

class AddSpell extends StatefulWidget {
  const AddSpell({super.key});

  @override
  State<AddSpell> createState() => _AddSpellState();
}

class _AddSpellState extends State<AddSpell> {
  Map<String, String> formData = {"components": ""};
  final formKey = GlobalKey<FormState>();
  bool hasComponent = true;
  bool schoolPicked = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('Custom spell', style: TextStyle(fontSize: 21)),
                const Divider(
                  height: 25,
                  color: Colors.transparent,
                ),
                TextFormField(
                  onSaved: (val) => formData['name'] = val!,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Name"),
                  validator: (value) => requiredField(value, "name"),
                ),
                const Divider(
                  height: 25,
                  color: Colors.transparent,
                ),
                TextFormField(
                  onSaved: (val) => formData['description'] = val!,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Description"),
                  validator: (value) => requiredField(value, "description"),
                ),
                const Divider(
                  height: 25,
                  color: Colors.transparent,
                ),
                //wrapped the dropdown in a listener to unfocus the other inputs on tap cause flutter sucks
                Listener(
                  onPointerDown: (event) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  child: DropdownMenu<MagicSchool>(
                    inputDecorationTheme: InputDecorationTheme(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: schoolPicked
                              ? const Color(0xFFDFDFDF)
                              : const Color(0xFFba3931),
                        ),
                      ),
                    ),
                    onSelected: (val) => formData['school'] = val!.string,
                    dropdownMenuEntries: getDropdownItems(MagicSchool.values),
                    label: const Text("School"),
                    width: constraints.maxWidth - 30,
                  ),
                ),
                Visibility(
                  visible: !schoolPicked,
                  child: getErrorMessage("Please select a school."),
                ),
                const Divider(
                  height: 25,
                  color: Colors.transparent,
                ),
                TextFormField(
                  onSaved: (val) => formData['level'] = val!,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Level"),
                  validator: (value) => requiredField(value, "level"),
                ),
                const Divider(
                  height: 25,
                  color: Colors.transparent,
                ),
                TextFormField(
                  onSaved: (val) => formData['castingTime'] = val!,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Casting time"),
                  validator: (value) => requiredField(value, "Casting time"),
                ),
                const Divider(
                  height: 25,
                  color: Colors.transparent,
                ),
                TextFormField(
                  onSaved: (val) => formData['range'] = val!,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Range"),
                  validator: (value) => requiredField(value, "range"),
                ),
                const Divider(
                  height: 25,
                  color: Colors.transparent,
                ),
                TextFormField(
                  onSaved: (val) => formData['duration'] = val!,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Duration"),
                  validator: (value) => requiredField(value, "duration"),
                ),
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: hasComponent
                                  ? const Color(0xFFDFDFDF)
                                  : const Color(0xFFba3931)),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(children: [
                        CheckboxListTile(
                          title: const Text('Verbal'),
                          value: formData["components"]?.contains("V"),
                          onChanged: (value) {
                            setState(() {
                              setCheckboxValue("V");
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('Somatic'),
                          value: formData["components"]?.contains("S"),
                          onChanged: (value) {
                            setState(() {
                              setCheckboxValue("S");
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: const Text('Material'),
                          value: formData["components"]?.contains("M"),
                          onChanged: (value) {
                            setState(() {
                              setCheckboxValue("M");
                            });
                          },
                        ),
                      ]),
                    ),
                    Positioned(
                      top: 15,
                      left: 9,
                      child: Container(
                        padding: const EdgeInsets.only(right: 4, left: 4),
                        decoration:
                            const BoxDecoration(color: Color(0xff2B3542)),
                        child: const Text(
                          "Components",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFDFDFDF),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: !hasComponent,
                  child: getErrorMessage("Please select at least 1 component."),
                ),
                const Divider(
                  height: 25,
                  color: Colors.transparent,
                ),
                Visibility(
                  visible: formData["components"]!.contains("M"),
                  child: Column(
                    children: [
                      TextFormField(
                        onSaved: (val) => formData['componentExtra'] = val!,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Material component"),
                        validator: (value) =>
                            requiredField(value, "material component"),
                      ),
                      const Divider(
                        height: 25,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  onSaved: (val) => formData['upcast'] = val!,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "At higher levels"),
                ),
                const Divider(
                  height: 25,
                  color: Colors.transparent,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!validateForm()) {
                      formKey.currentState!.save();

                      formData.forEach((key, value) {
                        log(value);
                      });
                    }
                  },
                  child: const Text("Create"),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  bool validateForm() {
    bool errors = false;
    if (!formKey.currentState!.validate()) {
      errors = true;
    }

    if (formData["components"]!.isEmpty) {
      setState(() => hasComponent = false);
      errors = true;
    } else {
      setState(() => hasComponent = true);
    }

    if (formData["school"] == null) {
      setState(() => schoolPicked = false);
      errors = true;
    } else {
      setState(() => schoolPicked = true);
    }

    return errors;
  }

  // logic for checking and unchecking the checkboxes
  void setCheckboxValue(String component) {
    if (formData["components"]!.contains(component)) {
      formData["components"] =
          formData["components"]!.replaceFirst(component, "");
    } else {
      formData["components"] = formData["components"]! + component;
    }
  }

  getDropdownItems(List<MagicSchool> items) {
    return items.map<DropdownMenuEntry<MagicSchool>>((MagicSchool school) {
      return DropdownMenuEntry(value: school, label: school.string);
    }).toList();
  }
}
