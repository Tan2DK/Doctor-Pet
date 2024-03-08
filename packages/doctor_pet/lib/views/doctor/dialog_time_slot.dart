import 'package:flutter/material.dart';

class DialogCustom extends StatefulWidget {
  const DialogCustom({Key? key}) : super(key: key);

  @override
  _DialogCustomState createState() => _DialogCustomState();
}

class _DialogCustomState extends State<DialogCustom> {
  List<Map<String, TimeOfDay?>> _userTimeSelections = [
    {
      "start": TimeOfDay(hour: 8, minute: 0),
      "end": TimeOfDay(hour: 9, minute: 0)
    }
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Time Slots'),
      content: SingleChildScrollView(
        // Sửa để bao gồm SingleChildScrollView
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _userTimeSelections.map<Widget>((selection) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: timeSelectionButton(selection, 'start'),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: timeSelectionButton(selection, 'end'),
                ),
              ],
            );
          }).toList()
            ..add(TextButton(
              // Không cần cast, thêm trực tiếp vào danh sách
              onPressed: () {
                setState(() {
                  _userTimeSelections.add({"start": null, "end": null});
                });
              },
              child: Text('Add More'),
            )),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text('Save Changes'),
        ),
      ],
    );
  }

  Widget timeSelectionButton(Map<String, TimeOfDay?> selection, String key) {
    return TextButton(
      onPressed: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: selection[key] ?? TimeOfDay.now(),
        );
        if (picked != null && picked != selection[key]) {
          setState(() {
            selection[key] = picked;
          });
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selection[key] != null
                ? selection[key]!.format(context)
                : 'Select Time',
            style: TextStyle(
              fontSize: 16, // Điều chỉnh font size cho phù hợp
              color: Colors.black87,
            ),
          ),
          Icon(Icons.keyboard_arrow_down_sharp, color: Colors.black87),
        ],
      ),
      style: TextButton.styleFrom(
        foregroundColor: Colors.black87,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
