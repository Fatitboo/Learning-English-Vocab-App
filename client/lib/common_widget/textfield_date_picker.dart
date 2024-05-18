import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../common/app_color.dart';

class DatePickerField extends StatefulWidget {
  final ValueNotifier<DateTime?> controller;
  final DateFormat dateFormat;

  const DatePickerField({
    Key? key,
    required this.controller,
    required this.dateFormat,
  }) : super(key: key);

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    widget.controller.addListener(_handleControllerChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleControllerChanged);
    super.dispose();
  }

  void _handleControllerChanged() {
    setState(() {
      _textController.text = widget.controller.value != null
          ? widget.dateFormat.format(widget.controller.value!)
          : '';
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.controller.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      widget.controller.value = pickedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: Container(
          height: 50,
          child: TextFormField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'DD/MM/YYYY',
              suffixIcon: Icon(Icons.calendar_today, color: AppColors.primaryColor),
              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 15),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.black26),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: AppColors.primaryColor), // Màu xanh khi focus
              ),
            ),
            cursorColor: AppColors.primaryColor,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class DatePickerCustomeProfile extends StatelessWidget {
  final ValueNotifier<DateTime> controller;

  DatePickerCustomeProfile({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date of Birth:',
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          DatePickerField(
            controller: controller,
            dateFormat: DateFormat('dd/MM/yyyy'),
          ),
        ],
      ),
    );
  }
}
