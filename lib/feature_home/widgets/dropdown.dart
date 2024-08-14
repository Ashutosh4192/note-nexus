import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_nexus/common/variables.dart';
import 'package:note_nexus/feature_home/controller/home_controller.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.items,
    required this.enabled,
    required this.hintText,
    required this.labelText,
    required this.dropdownitem,
  });
  final List<DropdownMenuItem<String>> items;
  final String labelText;
  final String hintText;
  final bool enabled;
  final DROPDOWNITEMS dropdownitem;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: MediaQuery.of(context).size.width <= 600
            ? MediaQuery.of(context).size.width * 0.9
            : 600,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: DropdownButtonFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(11),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(11),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(11),
              ),
              labelText: widget.labelText,
              labelStyle: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            hint: Text(widget.hintText),
            onChanged: widget.enabled
                ? (value) => {
                      Get.find<HomeController>().setField(
                        value.toString(),
                        widget.dropdownitem,
                      )
                    }
                : null,
            items: widget.items,
          ),
        ),
      ),
    );
  }
}

// const List<String> _list = [
//   'Developer',
//   'Designer',
//   'Consultant',
//   'Student',
// ];


//
// class simpleDropDown extends StatefulWidget {
//   const simpleDropDown({super.key,
//     required this.items,
//     required this.enabled,
//     required this.hintText,
//     required this.labelText,
//     required this.dropdownitem,});
//
//   final List<DropdownMenuItem<String>> items;
//   final String labelText;
//   final String hintText;
//   final bool enabled;
//   final DROPDOWNITEMS dropdownitem;
//
//   @override
//   State<simpleDropDown> createState() => _simpleDropDownState();
// }
//
// class _simpleDropDownState extends State<simpleDropDown> {
//   @override
//   Widget build(BuildContext context) {
//     return  CustomDropdown(
//       enabled: true,
//       labelText: "hii",
//       hintText: 'Select job role',
//       dropdownitem: DROPDOWNITEMS[0],
//       items: DROPDOWNITEMS,
//       initialItem: _list[0],
//       onChanged: (value) {
//         log('changing value to: $value');
//       },
//     );
//   }
// }
