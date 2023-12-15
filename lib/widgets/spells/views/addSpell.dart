import 'package:dndapp/widgets/form/validators.dart';
import 'package:dndapp/widgets/spells/schools.dart';
import 'package:flutter/material.dart';

class AddSpell extends StatefulWidget {
  const AddSpell({super.key});

  @override
  State<AddSpell> createState() => _AddSpellState();
}

class _AddSpellState extends State<AddSpell> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController schoolController = TextEditingController();
  List<String> componentChecked = [];
  bool hasComponent = true;
  bool schoolPicked = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: ListView(
            children: [
              const Text('Custom spell', style: TextStyle(fontSize: 21)),
              const Divider(
                height: 25,
                color: Colors.transparent,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Name"),
                validator: (value) => requiredField(value, "name"),
              ),
              const Divider(
                height: 25,
                color: Colors.transparent,
              ),
              TextFormField(
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
              DropdownMenu<MagicSchool>(
                dropdownMenuEntries: getDropdownItems(MagicSchool.values),
                controller: schoolController,
                label: const Text("School"),
                width: constraints.maxWidth - 30,
              ),
              const Divider(
                height: 25,
                color: Colors.transparent,
              ),
              TextFormField(
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
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Casting time"),
                validator: (value) => requiredField(value, "Casting time"),
              ),
              const Divider(
                height: 25,
                color: Colors.transparent,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Range"),
                validator: (value) => requiredField(value, "range"),
              ),
              const Divider(
                height: 25,
                color: Colors.transparent,
              ),
              TextFormField(
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
                        value: componentChecked.contains("V"),
                        onChanged: (value) {
                          setState(() {
                            componentChecked.contains("V")
                                ? componentChecked.remove("V")
                                : componentChecked.add("V");
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Somatic'),
                        value: componentChecked.contains("S"),
                        onChanged: (value) {
                          setState(() {
                            componentChecked.contains("S")
                                ? componentChecked.remove("S")
                                : componentChecked.add("S");
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Material'),
                        value: componentChecked.contains("M"),
                        onChanged: (value) {
                          setState(() {
                            componentChecked.contains("M")
                                ? componentChecked.remove("M")
                                : componentChecked.add("M");
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
                      decoration: const BoxDecoration(color: Color(0xff2B3542)),
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
              if (!hasComponent)
                Container(
                    padding: const EdgeInsets.only(left: 15, top: 9),
                    child: const Text(
                      "Please select at least 1 component.",
                      style: TextStyle(color: Color(0xFFEC4C41), fontSize: 12),
                    )),
              const Divider(
                height: 25,
                color: Colors.transparent,
              ),
              if (componentChecked.contains("M")) ...[
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Material component"),
                ),
                const Divider(
                  height: 25,
                  color: Colors.transparent,
                ),
              ],
              TextFormField(
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
                    if (componentChecked.isEmpty)
                      setState(() => hasComponent = false);
                    else
                      setState(() => hasComponent = true);

                    if (!formKey.currentState!.validate() || !hasComponent)
                      return;
                  },
                  child: const Text("Create"))
            ],
          ),
        ),
      );
    });
  }

  getDropdownItems(List<MagicSchool> items) {
    return items.map<DropdownMenuEntry<MagicSchool>>((MagicSchool school) {
      return DropdownMenuEntry(value: school, label: school.string);
    }).toList();
  }
}
