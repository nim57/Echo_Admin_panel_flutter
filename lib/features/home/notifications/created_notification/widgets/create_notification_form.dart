import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateNotificationForm extends StatefulWidget {
  const CreateNotificationForm({super.key});

  @override
  State<CreateNotificationForm> createState() => _CreateNotificationFormState();
}

class _CreateNotificationFormState extends State<CreateNotificationForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _urlController = TextEditingController();
  String? _mediaPath;
  String? _mediaType; // 'image' or 'video'
  bool _isUrlNeeded = false;

  Future<void> _pickMedia(ImageSource source, {bool isImage = true}) async {
    final picker = ImagePicker();
    final XFile? file = await (isImage
        ? picker.pickImage(source: source)
        : picker.pickVideo(source: source));

    if (file != null) {
      setState(() {
        _mediaPath = file.path;
        _mediaType = isImage ? 'image' : 'video';
      });
    }
  }

  Widget _mediaPreview() {
    if (_mediaPath == null) return const SizedBox.shrink();

    if (_mediaType == 'image') {
      return Image.network(_mediaPath!, // Works for both web and mobile
          height: 150,
          fit: BoxFit.cover, loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const CircularProgressIndicator();
      });
    }

    // For video preview (showing thumbnail would require additional packages)
    return Column(
      children: [
        const Icon(Icons.videocam, size: 60),
        Text(_mediaPath!.split('/').last),
      ],
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('notifications').add({
          'title': _titleController.text,
          'description': _descriptionController.text,
          'mediaPath': _mediaPath,
          'mediaType': _mediaType,
          'url': _isUrlNeeded ? _urlController.text : null,
          'timestamp': FieldValue.serverTimestamp(),
          'read': false,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Notification created successfully')),
        );

        // Clear form
        _titleController.clear();
        _descriptionController.clear();
        _urlController.clear();
        setState(() {
          _mediaPath = null;
          _mediaType = null;
          _isUrlNeeded = false;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Notification Title',
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter a title' : null,
            ),
            const SizedBox(height: 20),
        
            // Media Upload Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.photo),
                      label: const Text('Upload Image'),
                      onPressed: () => _pickMedia(ImageSource.gallery),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.video_camera_back),
                      label: const Text('Upload Video'),
                      onPressed: () =>
                          _pickMedia(ImageSource.gallery, isImage: false),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _mediaPreview(),
              ],
            ),
            const SizedBox(height: 20),
        
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: 4,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter a description' : null,
            ),
            const SizedBox(height: 20),
        
            DropdownButtonFormField<bool>(
              value: _isUrlNeeded,
              decoration: const InputDecoration(
                labelText: 'Need URL?',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: false, child: Text('No Need')),
                DropdownMenuItem(value: true, child: Text('Need')),
              ],
              onChanged: (value) => setState(() => _isUrlNeeded = value ?? false),
            ),
            const SizedBox(height: 20),
        
            if (_isUrlNeeded)
              TextFormField(
                controller: _urlController,
                decoration: const InputDecoration(
                  labelText: 'URL',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => _isUrlNeeded && (value?.isEmpty ?? true)
                    ? 'Please enter a URL'
                    : null,
              ),
            if (_isUrlNeeded) const SizedBox(height: 20),
        
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16)),
                child: const Text('Create Notification'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
