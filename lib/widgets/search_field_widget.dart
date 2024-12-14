import 'package:divine_assignment/constants/dummy_data.dart';
import 'package:divine_assignment/model/data_model.dart';
import 'package:divine_assignment/screens/treatment_screen.dart';
import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  final String hintText;
  final bool isPoint;
  const SearchFieldWidget(
      {super.key, required this.hintText, this.isPoint = false});

  @override
  Widget build(BuildContext context) {
    return Autocomplete<DataModel>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<DataModel>.empty();
        }
        return isPoint
            ? dummyData.where(
                (item) => item.point.toLowerCase().contains(
                      textEditingValue.text.toLowerCase(),
                    ),
              )
            : dummyData.where(
                (item) => item.problemDescription.toLowerCase().contains(
                      textEditingValue.text.toLowerCase(),
                    ),
              );
      },
      displayStringForOption: (DataModel option) =>
          isPoint ? option.point : option.problemDescription,
      onSelected: (DataModel selectedItem) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TreatmentScreen(
            treatment: selectedItem,
          ),
        ),
      ),
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      },
    );
  }
}
