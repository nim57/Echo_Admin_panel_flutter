import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/hotmail.dart';

class MailSendPage extends StatefulWidget {
  const MailSendPage({super.key});

  @override
  State<MailSendPage> createState() => _MailSendPageState();
}

class _MailSendPageState extends State<MailSendPage> {
  final outlookStamp =
      hotmail(dotenv.env["OUTLOOK_EMAIL"]!, dotenv.env["OUTLOOK_PASSWORD"]!);

  sendmailFormOutlook() async {
    // Create our message.
    final message = Message()
      ..from = Address(dotenv.env["OUTLOOK_EMAIL"]!, 'ECHO BOT')
      ..recipients.add('destination@example.com')
      ..subject = 'echo test email'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.';
    //..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    try {
      final sendReport = await send(message, outlookStamp);
      print('Message sent: $sendReport');
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Email'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add your email sending logic here
            // For example, you can use a package like 'mailer' to send emails
          },
          child: const Text('Send Email'),
        ),
      ),
    );
  }
}
