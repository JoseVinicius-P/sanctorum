import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:sanctorum_client/sanctorum_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:typed_data';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanctorum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  // These fields hold the last result or error message that we've received from
  // the server or null if no result exists yet.
  String? _resultMessage;
  String? _errorMessage;

  final _textEditingController = TextEditingController();

  // Calls the `hello` method of the `example` endpoint. Will set either the
  // `_resultMessage` or `_errorMessage` field, depending on if the call
  // is successful.
  void _findSaint() async {
    try {
      final result = await client.findSaint.findSaintsWikipedia();
      setState(() {
        _errorMessage = null;
        _resultMessage = result;
      });
    } catch (e) {
      setState(() {
        _errorMessage = '$e';
      });
    }
  }

  void _generateJsonlFile() async {
    try {
      final result = await client.chatgpt.generateJsonlFile();
      saveLocalFileWeb(result);
      setState(() {
        _errorMessage = null;
        _resultMessage = 'Arquivo gerado com sucesso';
      });

    } catch (e) {
      setState(() {
        _errorMessage = '$e';
      });
    }
  }

  void _sendGptOutputJsonlFile(ByteData? jsonlBytedata) async {
    if(jsonlBytedata != null){
      try {
        final result = await client.chatgpt.uploadJsonlChatGptOutput(jsonlBytedata);
        setState(() {
          _errorMessage = null;
          _resultMessage = result;
        });

      } catch (e) {
        setState(() {
          _errorMessage = '$e';
        });
      }
    }
  }

  void _updateFullTextFromWikipediaHtml() async {
    try {
      final result = await client.findSaint.updateFullTextsFromSavedWikipediaHtmls().timeout(const Duration(hours: 2));
      setState(() {
        _errorMessage = null;
        _resultMessage = result;
      });

    } catch (e) {
      setState(() {
        _errorMessage = '$e';
      });
    }
  }

  void saveLocalFileWeb(ByteData data) {
    if(kIsWeb){
        // Converter bytes em Blob
        var blob = html.Blob([data]);

        // Criar URL do objeto Blob
        var url = html.Url.createObjectUrlFromBlob(blob);

        // Criar um link 'a' para download
        var anchor = html.AnchorElement(href: url)
          ..setAttribute("download", 'saints.jsonl')
          ..click();

        // Revogar URL para liberar memória
        html.Url.revokeObjectUrl(url);
    }
  }

  Future<ByteData?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false, type: FileType.custom, allowedExtensions: ['jsonl'], dialogTitle: 'Selecionar arquivo para upload');

    if (result != null) {
      var file = result.xFiles.first;
      return await file.readAsBytes().then((bytes) => ByteData.sublistView(Uint8List.fromList(bytes)));
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sanctorum"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  onPressed: _findSaint,
                  child: const Text('Buscar Santos'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  onPressed: _updateFullTextFromWikipediaHtml,
                  child: const Text('Atualizar textos pelo banco de dados'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  onPressed: _generateJsonlFile,
                  child: const Text('Gerar arquivo Jsonl'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  onPressed: () async => _sendGptOutputJsonlFile(await pickFile()),
                  child: const Text('Enviar arquivo de saída do chatGPT (JsonL)'),
                ),
              ),
              _ResultDisplay(
                resultMessage: _resultMessage,
                errorMessage: _errorMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// _ResultDisplays shows the result of the call. Either the returned result from
// the `example.hello` endpoint method or an error message.
class _ResultDisplay extends StatelessWidget {
  final String? resultMessage;
  final String? errorMessage;

  const _ResultDisplay({
    this.resultMessage,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    String text;
    Color backgroundColor;
    if (errorMessage != null) {
      backgroundColor = Colors.red[300]!;
      text = errorMessage!;
    } else if (resultMessage != null) {
      backgroundColor = Colors.green[300]!;
      text = resultMessage!;
    } else {
      backgroundColor = Colors.grey[300]!;
      text = 'Ainda sem resposta';
    }

    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
