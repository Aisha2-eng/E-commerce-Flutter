import 'package:flutter/material.dart';
import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:shop_app/components/form_error.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? message;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  Future<void> sendEmail() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await emailjs.send(
          'service_7o4fzgn',
          'template_ae4fji9',
          {
            'user_name': name,
            'user_email': email,
            'message': message,
          },
          const emailjs.Options(
            publicKey: '3utpEi5L2w2bw-lZn',
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message sent successfully!')),
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send message: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text(
            "Contact Us",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 27, 25, 25),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 350, // Adjust the width as needed
            child: TextFormField(
              onSaved: (newValue) => name = newValue,
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: "Name is required");
                  return "";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Name",
                hintText: "Enter your name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 350,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              onSaved: (newValue) => email = newValue,
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: "Email is required");
                  return "";
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  addError(error: "Enter a valid email");
                  return "";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 350,
            child: TextFormField(
              maxLines: 5,
              onSaved: (newValue) => message = newValue,
              validator: (value) {
                if (value!.isEmpty) {
                  addError(error: "Message cannot be empty");
                  return "";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Message",
                hintText: "Enter your message",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: sendEmail,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(350, 60), // Adjust width and height
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              textStyle: const TextStyle(fontSize: 14),
              side: const BorderSide(color: Color.fromARGB(221, 27, 25, 25), width: 2),
            ),
            child: const Text("Send" ,
             style: TextStyle(
                  
                  color: Color.fromARGB(221, 27, 25, 25),
                ),
            ),
          ),
          const SizedBox(height: 20),
          FormError(errors: errors),
        ],
      ),
    );
  }
}
