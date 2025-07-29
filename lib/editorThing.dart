import 'package:flutter/material.dart';
import 'package:super_editor/super_editor.dart';

class EditorThing extends StatefulWidget {
  const EditorThing({super.key});

  @override
  State<EditorThing> createState() => _EditorThingState();
}

class _EditorThingState extends State<EditorThing> {
  late MutableDocument _document;
  late MutableDocumentComposer _composer;
  late Editor _editor;

  @override
  void initState() {
    super.initState();
    _document = _createInitialDocument(); // Create an initial empty document
    _composer = MutableDocumentComposer();
    _editor = createDefaultDocumentEditor(document: _document, composer: _composer);
  }

  // Create a simple initial document with a paragraph
  MutableDocument _createInitialDocument() {
    return MutableDocument(nodes: [
      ParagraphNode(
        id: DocumentEditor.createNodeId(),
        text: AttributedText(text: ''),
      ),
    ]);
  }

  @override
  void dispose() {
    _editor.dispose();
    _composer.dispose();
    _document.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rich Text Editor'),
      ),
      body: SuperEditor(
        editor: _editor,
        composer: _composer,
        // Add a basic toolbar
        toolbarBuilder: (editor, composer) {
          return DefaultEditorToolbar(editor: editor, composer: composer);
        },
      ),
    );
  }
}
