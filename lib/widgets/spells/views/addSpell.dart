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
              ),
              const Divider(
                height: 25,
                color: Colors.transparent,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Casting time"),
              ),
              const Divider(
                height: 25,
                color: Colors.transparent,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Range"),
              ),
              const Divider(
                height: 25,
                color: Colors.transparent,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Duration"),
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffBCB0B9)),
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
              ElevatedButton(onPressed: () {}, child: const Text("Create"))
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
