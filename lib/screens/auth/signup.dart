import 'package:flutter/material.dart';
import 'login.dart'; // Import login.dart from same directory

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isObscure = true; // Initially, password is hidden
  String? _selectedUserType;
  String? _selectedUniversity;
  
  // List of Pakistani universities
  final List<String> _universities = [
    'Choose',
    'Quaid-i-Azam University',
    'National University of Sciences and Technology (NUST)',
    'Lahore University of Management Sciences (LUMS)',
    'University of the Punjab',
    'University of Karachi',
    'Pakistan Institute of Engineering and Applied Sciences (PIEAS)',
    'COMSATS University Islamabad',
    'Aga Khan University',
    'Government College University Lahore',
    'University of Engineering and Technology, Lahore',
    'NED University of Engineering and Technology',
    'Bahria University',
    'Air University',
    'International Islamic University Islamabad',
    'University of Peshawar',
    'University of Agriculture, Faisalabad',
    'Mehran University of Engineering and Technology',
    'Institute of Business Administration (IBA)',
    'National University of Computer and Emerging Sciences (FAST-NUCES)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: -260,
            top: -540,
            child: CircleWidget(color: Color(0xFF5C5C5C).withOpacity(0.8)),
          ),
          Positioned(
            left: -320,
            top: -550,
            child: CircleWidget(color: Color(0xFFF26712).withOpacity(0.8)),
          ),
          Positioned(
            left: -355,
            top: -550,
            child: CircleWidget(color: Color(0xFF125F9D)),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    SizedBox(height: 260),
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF125F9D),
                      ),
                    ),

                    // fields
                    SizedBox(height: 35),
                    buildTextField(Icons.person, "Enter your username", false),
                    SizedBox(height: 25),
                    buildTextField(Icons.email, "Enter your email", false),
                    SizedBox(height: 25),
                    buildTextField(Icons.lock, "Enter your password", true),
                    SizedBox(height: 25),
                    
                    // User type and University selection row
                    Row(
                      children: [
                        // User type dropdown (left side) - with reduced width
                        Flexible(
                          flex: 2, // Smaller flex for user type dropdown
                          child: buildDropdown(
                            icon: Icons.person_outline,
                            hint: "User Type",
                            value: _selectedUserType,
                            items: ['Choose', 'Student', 'Teacher'],
                            onChanged: (value) {
                              setState(() {
                                _selectedUserType = value;
                              });
                            },
                            dropdownAlignment: AlignmentDirectional.bottomStart,
                          ),
                        ),
                        SizedBox(width: 15),
                        // University dropdown (right side) - with increased width
                        Flexible(
                          flex: 3, // Larger flex for university dropdown
                          child: buildDropdown(
                            icon: Icons.school,
                            hint: "University",
                            value: _selectedUniversity,
                            items: _universities,
                            onChanged: (value) {
                              setState(() {
                                _selectedUniversity = value;
                              });
                            },
                            dropdownAlignment: AlignmentDirectional.bottomStart,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 35),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF125F9D),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text('sign up', style: TextStyle(color: Colors.white, fontSize: 22)),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    buildDivider(),
                    SizedBox(height: 30),
                    Image.asset('assets/google.png', width: 85, height: 45),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?", style: TextStyle(fontSize: 15, color: Color(0xFF125F9D))),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                          child: Text('Login', style: TextStyle(color: Color(0xFF125F9D), fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(IconData icon, String hint, bool isPassword) {
    return TextField(
      obscureText: isPassword ? _isObscure : false,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Color(0xFF125F9D), size: 24),
        hintText: hint,
        hintStyle: TextStyle(color: Color(0xFF125F9D), fontSize: 18),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility, color: Color(0xFF125F9D)),
          onPressed: () => setState(() => _isObscure = !_isObscure),
        )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color(0xFF125F9D), width: 3.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color(0xFF125F9D), width: 4),
        ),
      ),
    );
  }
  
  Widget buildDropdown({
    required IconData icon,
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
    AlignmentDirectional dropdownAlignment = AlignmentDirectional.topStart,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFF125F9D), width: 3.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value ?? 'Choose',
            icon: Icon(Icons.arrow_drop_down, color: Color(0xFF125F9D)),
            isExpanded: true,
            hint: Row(
              children: [
                Icon(icon, color: Color(0xFF125F9D), size: 24),
                SizedBox(width: 10),
                Text(hint, style: TextStyle(color: Color(0xFF125F9D), fontSize: 16)),
              ],
            ),
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(15),
            elevation: 8,
            style: TextStyle(color: Color(0xFF125F9D), fontSize: 16),
            menuMaxHeight: 300, // Set a max height for long lists
            itemHeight: 50,
            dropdownAlignment: dropdownAlignment,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: [
                    Icon(
                      value == 'Choose' ? icon : 
                      (items.length > 5 ? Icons.school : 
                      (value == 'Student' ? Icons.school : Icons.person_outline)),
                      color: Color(0xFF125F9D),
                      size: 24,
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        value,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  Widget buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 1.5, color: Color(0xFF125F9D))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('or', style: TextStyle(fontSize: 20, color: Color(0xFF125F9D), fontWeight: FontWeight.bold)),
        ),
        Expanded(child: Divider(thickness: 1.5, color: Color(0xFF125F9D))),
      ],
    );
  }
}
class CircleWidget extends StatelessWidget {
  final Color color;

  CircleWidget({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 799,
      width: 784,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(2, 4),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
    );
  }
}