// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fnoon_app_new/screens/services/funcation_firebase.dart';

import '../Share/dialogSuss.dart';
import '../models/event_calander.dart';
import '../models/user.dart';

class AddEventDialog extends StatefulWidget {
  final DateTime SelectedDay;
  final Map<DateTime, List<Event>> selectedEvents;

  const AddEventDialog({super.key, required this.SelectedDay, required this.selectedEvents});

  @override
  State<AddEventDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<AddEventDialog> {
  final DatabaseService service = DatabaseService();
  List<DocumentSnapshot>? listquet;

  final itemsState = [
    {"name": "صباح", "value": "صباح"},
    {"name": "عصر", "value": "عصر"},
    {"name": "مساء", "value": "مساء"},
  ];

  String valuestate = "صباح";
  String? valuechoose;
  List<Map<String, String>>? itemsStatequet;
  String? valuequet;
  String? valuechoosequet;

  final TextEditingController _eventController = TextEditingController();
  final TextEditingController _clientpersonController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _depositController = TextEditingController();
  final TextEditingController _subpriceController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _actorController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  UserInfoModel? getUser;

  Future<UserInfoModel> FetchUser(String id) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    return UserInfoModel.fromDocument(snapshot);
  }

  void _getData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      getUser = await FetchUser(user.uid);
    }
    listquet = await service.retrievebouquet();
    if (listquet != null && listquet!.isNotEmpty) {
      valuequet = listquet![0].get('title') ?? '';
      itemsStatequet = [
        {"name": listquet![0].get('title'), "value": listquet![0].get('title')},
        {"name": listquet![0].get('title2'), "value": listquet![0].get('title2')},
        {"name": listquet![0].get('title3'), "value": listquet![0].get('title3')},
      ];
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTextField(_eventController, "إسم الفعالية"),
                  _buildTextField(_actorController, "اسم الفنان"),
                  _buildTextField(_placeController, "مكان الفعالية"),
                  _buildTextField(_clientpersonController, "مالك الفعالية"),
                  _buildDropdown("اختر الفترة", itemsState, valuestate, (newValue) {
                    setState(() {
                      valuestate = newValue;
                      valuechoose = newValue;
                    });
                  }),
                  if (itemsStatequet != null)
                    _buildDropdown("اختر باقة", itemsStatequet!, valuequet ?? '', (newValue) {
                      setState(() {
                        valuechoosequet = newValue;
                        valuequet = newValue;
                      });
                    }),
                  _buildTextField(_phonenumberController, "رقم الجوال", keyboardType: TextInputType.phone),
                  if (getUser?.role == "account")
                    Column(
                      children: [
                        _buildTextField(_priceController, "سعر الفعالية"),
                        _buildTextField(_depositController, "العربون"),
                        _buildTextField(_subpriceController, "المبلغ المتبقي"),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("إلغاء")),
                      TextButton(
                        onPressed: () => _saveEvent(),
                        child: Text("حفظ"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.white,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'الرجاء إدخال $label';
        }
        return null;
      },
    );
  }

  Widget _buildDropdown(String label, List<Map<String, String>> items, String currentValue, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.bottomRight,
            child: Text(label, style: TextStyle(color: Colors.orange))),
        SizedBox(
          width: double.infinity,
          child: DropdownButton<String>(
            isExpanded: true,
            value: currentValue.isEmpty ? null : currentValue,
            onChanged: (newValue) {
              if (newValue != null) onChanged(newValue);
            },
            icon: Icon(Icons.arrow_drop_down, size: 33, color: Colors.orange),
            items: items.map((valueitem) {
              return DropdownMenuItem<String>(
                value: valueitem["value"],
                child: AutoSizeText(valueitem["name"] ?? '', maxLines: 1),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void _saveEvent() async {
    if (!_formKey.currentState!.validate()) return;
final event = Event(
  documentId: '', // تركه فارغ لأنه سيُنشأ عند Firestore
  clientPerson: _clientpersonController.text,
  phoneNumber: _phonenumberController.text,
  price: _priceController.text,
  deposit: _depositController.text,
  subPrice: _subpriceController.text,
  selectedDay: widget.SelectedDay,
  title: _eventController.text,
  state: valuechoose ?? "صباح",
  qute: valuechoosequet ?? valuequet ?? '',
  place: _placeController.text,
  actor: _actorController.text,
);


    if (widget.selectedEvents[widget.SelectedDay] != null) {
      widget.selectedEvents[widget.SelectedDay]!.add(event);
    } else {
      widget.selectedEvents[widget.SelectedDay] = [event];
    }

    await FirebaseFirestore.instance.collection('ooo').add(event.toMap());
    showDialog(context: context, builder: (context) => DialogScss());
    Navigator.of(context).pop();

    _clearControllers();
    setState(() {});
  }

  void _clearControllers() {
    _eventController.clear();
    _clientpersonController.clear();
    _phonenumberController.clear();
    _priceController.clear();
    _depositController.clear();
    _subpriceController.clear();
    _actorController.clear();
    _placeController.clear();
  }
}
