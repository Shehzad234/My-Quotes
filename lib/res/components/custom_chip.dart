import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/view_model/home_view_model.dart';

class CustomChip extends StatefulWidget {
  final String labelText;

  const CustomChip({required this.labelText, Key? key}) : super(key: key);

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  ValueNotifier<bool> isSelected = ValueNotifier(false);

  @override
  void dispose() {
    isSelected.dispose();
    super.dispose();
  }

  filterCategory(homeViewModel, bool value) {
    homeViewModel.setSelectedCategories(widget.labelText, value);
    isSelected.value = !isSelected.value;

    List<String> keysWithTrueValues = [];

    homeViewModel.selectedCategories.forEach((key, value) {
      if (value) {
        keysWithTrueValues.add(key.toLowerCase());
      }
    });

    if (keysWithTrueValues.isEmpty) {
      homeViewModel.setStream(
          FirebaseFirestore.instance.collection('quotes').snapshots());
      return;
    } else {
      homeViewModel.setStream(FirebaseFirestore.instance
          .collection('quotes')
          .where('category', whereIn: keysWithTrueValues)
          .snapshots());
      return;
    }
  }

//   @override
//   Widget build(BuildContext context) {
//     return ListenableBuilder(
//       listenable: isSelected,
//       builder: (context, child) {
//         return Consumer<HomeViewModel>(
//           builder: (context, homeViewModel, child) {
//             return Padding(
//               padding: const EdgeInsets.only(right: 5),
//               child: FilterChip(
//                 label: Text(widget.labelText),
//                 selectedColor: Colors.grey[500],
//                 side: BorderSide.none,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
//                 selected: isSelected.value,
//                 onSelected: (value) {
//                   filterCategory(homeViewModel, value);
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
  @override
  Widget build(BuildContext context) {
    return ValueListenableProvider.value(
        value: isSelected,
        child:
            Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
          return Padding(
            padding: const EdgeInsets.only(right: 5),
            child: FilterChip(
              label: Text(widget.labelText),
              selectedColor: Colors.grey[500],
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              selected: isSelected.value,
              onSelected: (value) {
                filterCategory(homeViewModel, value);
              },
            ),
          );
        }));
  }
}
