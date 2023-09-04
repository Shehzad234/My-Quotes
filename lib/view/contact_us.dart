import 'package:flutter/material.dart';
import 'package:quotes_app/repo/contact_us_repo.dart';
import 'package:quotes_app/res/components/custom_button.dart';
import 'package:quotes_app/res/components/custom_textfield.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Contact Us',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    height: 20,
                    color: Colors.black,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: nameController,
                                focusNode: null,
                                labelText: 'Enter Your Name',
                                text: 'Name',
                              ),
                              CustomTextField(
                                controller: emailController,
                                focusNode: null,
                                labelText: 'Enter Your Email',
                                text: 'Email',
                              ),
                              CustomTextField(
                                controller: messageController,
                                focusNode: null,
                                labelText: 'Enter Your Message',
                                text: 'Message',
                                maxLines: 5,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomButton(
                                  text: 'Submit',
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      ContactUsRepo.sendEmail(
                                          name: nameController.text,
                                          email: emailController.text,
                                          message: messageController.text);
                                      nameController.clear();
                                      emailController.clear();
                                      messageController.clear();
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
