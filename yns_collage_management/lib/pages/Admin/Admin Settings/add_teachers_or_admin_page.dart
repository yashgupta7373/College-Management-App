// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, prefer_typing_uninitialized_variables
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:yns_college_management/widgets/input_field_student_registration.dart';
import '../../../Resources/auth_method.dart';
import '../../../Utils/utils.dart';
import 'dart:typed_data';

class TRegistrationPage extends StatefulWidget {
  const TRegistrationPage({super.key});
  @override
  State<TRegistrationPage> createState() => _TRegistrationPageState();
}

class _TRegistrationPageState extends State<TRegistrationPage> {
  var role = '';
  var gender = '';
  var transport = '';
  bool _isLoading = false;
  final TextEditingController idController = TextEditingController();
  final TextEditingController languagesController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherController = TextEditingController();
  final TextEditingController motherController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController aadharController = TextEditingController();
  final TextEditingController AddressController = TextEditingController();
  final TextEditingController MobileController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  Uint8List? _image;
  //

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    languagesController.dispose();
    nameController.dispose();
    fatherController.dispose();
    motherController.dispose();
    dateController.dispose();
    aadharController.dispose();
    AddressController.dispose();
    MobileController.dispose();
    EmailController.dispose();
    PasswordController.dispose();
  }

  //drop ]down list..
  var dropdowndepartment;
  var dropdownprofile;
  var dropdownsubject;
  var department = [
    'Computer Science Dep.',
    'Commerce & Business Dep.',
    'Teacher Education Dep.',
    'Department of Science.',
  ];
  var profile = [
    'HOD',
    'Assistant Professor',
    'Associate Professor',
    'Professor',
  ];
  var subject = [
    'Mathematics',
    'Programming Principle and Algorithm',
    'Fundamental of Computer MS Office',
    'Principle of Management',
    'Business Communication',
    'C Programming Language',
    'Organization Behavior',
    'Digital Electronics',
    'Financial Management and Accounting',
    'C++',
    'Data Structure',
    'Computer Architecture',
    'Business Economics',
    'Statistics',
    'Computer Graphics',
    'Operating System',
    'Optimization Techniques',
    'Software Engineering',
    'DBMS',
    'Java and Web technology',
    'Networking',
    'Numerical Techniques',
    'Knowledge Management',
    'Network Security',
    'E -Commerce',
    'System Analysis and Design',
    'Foundation Course in Computers',
    'Programming in C and data structure',
    'Discrete Mathematical Structures',
    'Computer Oriented Statistical Techniques',
    'Design and analysis of Algorithms',
    'File Structure and Database Management System',
    'Computer Oriented Numerical Analysis',
    'Interactive Computer Graphics',
    'Computer Networks and Internet',
    'Computer Oriented Optimization Methods',
    'Object Oriented System',
    'Fuzzy sets and Applications',
    'Cryptology and Secure Systems',
    'Artificial Intelligence and Neural networks',
    'Fundamentals of Management',
    'OrganizationalBehavior',
    'Managerial Economics',
    'Accounting and Financial Analysis',
    'Business Law',
    'BusinessOrganization and Ethics',
    'Environmental Studies (Qualifying paper)',
    'Quantitative Techniques for Business',
    'Business Communication',
    'Human Resource Management',
    'Marketing Management',
    'Business Environment',
    'Fundamentals of Computer',
    'Assessments on Soft Skill Based on Presentations/ G.D/ Personality traits',
    'Advertising Management',
    'Team Building & Leadership',
    'Indian Economy',
    'Customer Relationship Management',
    'Management Information System',
    'Income Tax Law & practice',
    'ConsumerBehavior',
    'Financial Management',
    'Production& Operation Management',
    'Sales& Distribution Management',
    'Research Methodology',
    'Entrepreneurship& Small Business Management',
    'Computer Oriented Practical &Viva- Voce',
    'Arithmetic Aptitude',
    'Aptitude Reasoning',
    'General Business Awareness',
    'General English',
    'Elective Paper M-1/ F-1',
    'Elective Paper M-2 / F-2',
    'Strategic Management & Business Policy',
    'Operation Research',
    'Fundamentals of E Commerce',
    'Economic and Industrial Law',
    'Elective Paper M-3/ F-3',
    'Elective Paper M-4/ F-4'
  ];

  void AddAdminOrTeacher() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // Add Student  using our authMethods
    String res = await AuthMethods().AddAdminOrTeacher(
        email: EmailController.text,
        password: PasswordController.text,
        aadharNo: aadharController.text,
        address: AddressController.text,
        dob: dateController.text,
        fName: fatherController.text,
        gender: gender,
        mName: motherController.text,
        name: nameController.text,
        phoneNo: MobileController.text,
        department: dropdowndepartment,
        id: idController.text,
        language: languagesController.text,
        profile: dropdownprofile,
        subject: dropdownsubject,
        role: role,
        file: _image!,
        transport: transport);
    // if string returned is success, user has been created
    if (res == "Success") {
      // navigate to the home screen
      Navigator.pop(context);
      Navigator.pop(context);
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
    // show the error
    showSnackBar(context, res);
  }

  // for picking up image from gallery
  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    }
    // print('No Image Selected');
  }

  //select image
  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
            title: (const Text("Teachers & Admin Registration ")),
            backgroundColor: Colors.transparent,
            elevation: 0),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // title...
          Center(
              child: SizedBox(
                  width: mediaQuery.size.width * 0.7,
                  height: mediaQuery.size.height * 0.15,
                  child: FittedBox(
                      child: Text("Teachers & Admin\n Registration",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.teal.shade900,
                                    blurRadius: 5,
                                    offset: const Offset(2, 2))
                              ],
                              // fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))))),
          // Role, Id, Subject, Job Profile, Department, Languages
          Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 2),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal[400]),
                  child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Role...
                              Column(children: [
                                const Text("Role: "),
                                Center(
                                    child: FittedBox(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                      const Text('Admin'),
                                      Radio(
                                          value: 'admin',
                                          groupValue: role,
                                          onChanged: (value) {
                                            setState(() {
                                              role = value.toString();
                                            });
                                          }),
                                      SizedBox(
                                          width: mediaQuery.size.width * 0.1),
                                      const Text('Teacher'),
                                      Radio(
                                          value: 'teacher',
                                          groupValue: role,
                                          onChanged: (value) {
                                            setState(() {
                                              role = value.toString();
                                            });
                                          })
                                    ])))
                              ]),
                              // ID...
                              Row(children: [
                                Text('$role ID:'),
                                Expanded(
                                    child: InputFieldStudentRegistration(
                                        textEditingController: idController,
                                        keyboard: TextInputType.text))
                              ]),
                              // subjects...
                              Row(children: [
                                const Text('Subjects:'),
                                Expanded(
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: DropdownButton(
                                            dropdownColor: Colors.teal[400],
                                            hint: const Text('Select Subject'),
                                            menuMaxHeight: 300,
                                            isExpanded: true,
                                            underline: Container(
                                              color: Colors.teal[800],
                                              height: 1,
                                            ),
                                            iconEnabledColor: Colors.teal[800],
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 13, 71, 161),
                                                fontSize: 13),
                                            value: dropdownsubject,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items: subject.map((String items) {
                                              return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items));
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                dropdownsubject = newValue!;
                                              });
                                            })))
                              ]),
                              // Profile
                              Row(children: [
                                const Text('Job Profile:'),
                                Expanded(
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: DropdownButton(
                                            dropdownColor: Colors.teal[400],
                                            hint: const Text(
                                                'Select Job Profile'),
                                            menuMaxHeight: 300,
                                            isExpanded: true,
                                            underline: Container(
                                              color: Colors.teal[800],
                                              height: 1,
                                            ),
                                            iconEnabledColor: Colors.teal[800],
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 13, 71, 161),
                                                fontSize: 13),
                                            value: dropdownprofile,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items: profile.map((String items) {
                                              return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items));
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                dropdownprofile = newValue!;
                                              });
                                            })))
                              ]),
                              // Department
                              Row(children: [
                                const Text('Department:'),
                                Expanded(
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: DropdownButton(
                                            dropdownColor: Colors.teal[400],
                                            hint:
                                                const Text('Select Department'),
                                            menuMaxHeight: 300,
                                            isExpanded: true,
                                            underline: Container(
                                              color: Colors.teal[800],
                                              height: 1,
                                            ),
                                            iconEnabledColor: Colors.teal[800],
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 13, 71, 161),
                                                fontSize: 13),
                                            value: dropdowndepartment,
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items:
                                                department.map((String items) {
                                              return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items));
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                dropdowndepartment = newValue!;
                                              });
                                            })))
                              ]),
                              // Languages
                              Row(children: [
                                const Text('Languages:'),
                                Expanded(
                                    child: InputFieldStudentRegistration(
                                        textEditingController:
                                            languagesController,
                                        keyboard: TextInputType.text))
                              ])
                            ]))
                  ]))),
          //image
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal[400]),
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Stack(
                          children: [
                            _image != null
                                ? CircleAvatar(
                                    radius: 64,
                                    backgroundImage: MemoryImage(_image!),
                                    backgroundColor: Colors.teal,
                                  )
                                : const CircleAvatar(
                                    radius: 64,
                                    backgroundImage: NetworkImage(
                                        'https://i.stack.imgur.com/l60Hf.png'),
                                    backgroundColor: Colors.teal,
                                  ),
                            Positioned(
                              bottom: -10,
                              left: 80,
                              child: IconButton(
                                onPressed: selectImage,
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  color: Color.fromARGB(255, 0, 73, 65),
                                ),
                              ),
                            )
                          ],
                        )),
                  ))),
          //Name, Father Name, Mother Name, Date of birth, Aadhar No.
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal[400]),
                  child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // name...
                              Row(children: [
                                Text('$role Name:'),
                                Expanded(
                                    child: InputFieldStudentRegistration(
                                        textEditingController: nameController,
                                        keyboard: TextInputType.name))
                              ]),
                              // father name...
                              Row(children: [
                                const Text("Father's Name:"),
                                Expanded(
                                    child: InputFieldStudentRegistration(
                                        textEditingController: fatherController,
                                        keyboard: TextInputType.name))
                              ]),
                              // mother name...
                              Row(children: [
                                const Text("Mother's Name:"),
                                Expanded(
                                    child: InputFieldStudentRegistration(
                                        textEditingController: motherController,
                                        keyboard: TextInputType.name))
                              ]),
                              // student dob...
                              Row(children: [
                                const Text("Date of Birth:"),
                                Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: TextField(
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontStyle: FontStyle.normal,
                                              color: Colors.blue[900]),
                                          controller: dateController,
                                          decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.all(8),
                                              icon: Icon(
                                                Icons.calendar_today_rounded,
                                                // color: Colors.teal[800],
                                              ),
                                              hintText: "Select Date"),
                                          onTap: () async {
                                            DateTime? pickedDate =
                                                await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime.now());
                                            if (pickedDate != null) {
                                              setState(() {
                                                dateController.text =
                                                    DateFormat('dd-MM-yyyy')
                                                        .format(pickedDate);
                                              });
                                            }
                                          },
                                        )))
                              ]),
                              // aadhar number...
                              Row(children: [
                                const Text("Aadhar No:"),
                                Expanded(
                                    child: InputFieldStudentRegistration(
                                        textEditingController: aadharController,
                                        keyboard: TextInputType.datetime))
                              ])
                            ]))
                  ]))),
          // Gender
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal[400]),
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // gender...
                            const Text("GENDER"),
                            FittedBox(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                  const Text('Male'),
                                  Radio(
                                      value: 'male',
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      }),
                                  SizedBox(width: mediaQuery.size.width * 0.1),
                                  const Text('female'),
                                  Radio(
                                      value: 'female',
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      }),
                                  SizedBox(width: mediaQuery.size.width * 0.1),
                                  const Text('Other'),
                                  Radio(
                                      value: 'other',
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value.toString();
                                        });
                                      })
                                ]))
                          ])))),
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal[400]),
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // College Transport...
                            const Text("Use College Transport"),
                            FittedBox(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                  const Text('Yes'),
                                  Radio(
                                      value: 'Yes',
                                      groupValue: transport,
                                      onChanged: (value) {
                                        setState(() {
                                          transport = value.toString();
                                        });
                                      }),
                                  SizedBox(width: mediaQuery.size.width * 0.1),
                                  const Text('No'),
                                  Radio(
                                      value: 'No',
                                      groupValue: transport,
                                      onChanged: (value) {
                                        setState(() {
                                          transport = value.toString();
                                        });
                                      }),
                                ])),
                          ])))),
          //Address, Mobile No, Email Id, Password
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal[400]),
                  child: Column(children: [
                    Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                // address...
                                const Text('Address:'),
                                Expanded(
                                    child: InputFieldStudentRegistration(
                                        textEditingController:
                                            AddressController,
                                        keyboard: TextInputType.text))
                              ]),
                              // phone number...
                              Row(children: [
                                const Text("Mobile NO:"),
                                Expanded(
                                    child: InputFieldStudentRegistration(
                                        textEditingController: MobileController,
                                        keyboard: TextInputType.datetime))
                              ]),
                              // email id...
                              Row(children: [
                                const Text("E-mail ID:"),
                                Expanded(
                                    child: InputFieldStudentRegistration(
                                        textEditingController: EmailController,
                                        keyboard: TextInputType.emailAddress))
                              ]),
                              // create password...
                              Row(children: [
                                const Text("Create Password:"),
                                Expanded(
                                    child: InputFieldStudentRegistration(
                                        textEditingController:
                                            PasswordController,
                                        keyboard: TextInputType.text))
                              ]),
                              const SizedBox(height: 20.0),
                              // submit button...
                              Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, bottom: 15, top: 5),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              AddAdminOrTeacher();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                elevation: 20,
                                                backgroundColor:
                                                    Colors.teal[600],
                                                shadowColor: Colors.teal[600],
                                                side: BorderSide(
                                                    color: Colors.teal.shade600,
                                                    width: 2,
                                                    style: BorderStyle.solid),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0)),
                                                minimumSize:
                                                    const Size(130, 50)),
                                            child: !_isLoading
                                                ? const Text('Submit')
                                                : const CircularProgressIndicator(
                                                    color: Color.fromARGB(
                                                        255, 115, 162, 170)))
                                      ]))
                            ]))
                  ]))),
          const SizedBox(height: 20.0)
        ])));
  }
}
