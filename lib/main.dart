import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
final methodChannel = const MethodChannel('log')
  ..setMethodCallHandler(
    (call) async {
      switch (call.method) {
        case "log":
          print(call.arguments.toString());
      }
    },
  );
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  methodChannel;
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Builder(builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.red),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(color: Colors.amber),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Column(
                children: [
                  const Expanded(
                    child: _UIViewWidget(),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: const Text('Press me'),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Scaffold(
                                    body: Center(
                                      child: TextButton(
                                        child: const Text('Dismiss'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
class _UIViewWidget extends StatefulWidget {
  const _UIViewWidget({
    Key? key,
  }) : super(key: key);
  @override
  State<_UIViewWidget> createState() => _UIViewWidgetState();
}
class _UIViewWidgetState extends State<_UIViewWidget> {
  @override
  void dispose() {
    print('Widget disposed');
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return const UiKitView(
      viewType: 'test view',
    );
  }
}