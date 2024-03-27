import 'package:flutter/material.dart';

import '../../../../../core/data/branch_model.dart';

class BranchListWidget extends StatelessWidget {
  const BranchListWidget({
    Key? key,
    required this.branchList,
    this.onChanged,
    required this.selectedBranch,
  }) : super(key: key);
  final List<BranchModel> branchList;
  final Function(BranchModel?)? onChanged;
  final BranchModel selectedBranch;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return ListView.separated(
      itemCount: branchList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final branch = branchList[index];
        return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onTap: onChanged == null ? null : () => onChanged?.call(branch),
            isThreeLine: true,
            selected: branch == selectedBranch,
            selectedTileColor: primaryColor,
            selectedColor: Colors.white,
            textColor: branch == selectedBranch ? Colors.white : Colors.black,
            leading: Theme(
              data: ThemeData(unselectedWidgetColor: Colors.red),
              child: SizedBox(
                height: double.maxFinite,
                child: Radio<BranchModel?>(
                  activeColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.white;
                    }
                    return primaryColor;
                  }),
                  value: branch,
                  groupValue: selectedBranch,
                  onChanged: onChanged == null
                      ? null
                      : (value) => onChanged?.call(value),
                ),
              ),
            ),
            title: Text(branch.name),
            subtitle: Text(branch.address),
          ),
        );
      },
    );
  }
}
