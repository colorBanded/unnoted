import 'package:flutter/material.dart';
import 'package:super_editor/super_editor.dart';

class EditorThing extends StatefulWidget {
  const EditorThing({super.key});

  @override
  State<EditorThing> createState() => _EditorThingState();
}

class _EditorThingState extends State<EditorThing> {
  late MutableDocument _document;
  late DocumentEditor _editor;

  @override
  void initState() {
    super.initState();
    _document = _createInitialDocument();
    _editor = DocumentEditor(document: _document);
  }

// le paragraph
  MutableDocument _createInitialDocument() {
    return MutableDocument(nodes: [
      ParagraphNode(
        id: DocumentEditor.createNodeId(),
        text: AttributedText(''),
      ),
    ]);
  }

  @override
  void dispose() {
    _document.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rich Text Editor'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SuperEditor(
        editor: _editor,
      ),
    );
  }
}