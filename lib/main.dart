import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/adapters.dart';

import 'firebase_options.dart';
//create datatype that holds username, email, password, and confirm password
// class User {
//   String username;

void main() async {
  //ensures the flutter widgets are loaded before firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('myBox');

  //initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final box = Hive.box('myBox');

  Future<void> _create(Map<String, dynamic> data) async {
    await box.add(data);
  }

  @override
  void initState() {
    _refreshItems();
    super.initState();
  }

  List<Map<String, dynamic>> _list = [];

  void _refreshItems() {
    final data = box.keys.map((key) {
      final items = box.get(key);
      return {
        'key': key,
        'name': items['name'],
        'email': items['email'],
        'password': items['password'],
        'confirmpassword': items['confirmpassword']
      };
    }).toList();

    setState(() {
      _list = data.reversed.toList();
    });
  }

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController confirmpasswordcontroller = TextEditingController();

  void _showForm(BuildContext cxt, int? itemKey) async {
    showModalBottomSheet(
        context: cxt,
        builder: (BuildContext cxt) {
          return Form(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                TextFormField(
                  controller: confirmpasswordcontroller,
                  decoration:
                      const InputDecoration(labelText: 'Confirm Password'),
                ),
                ElevatedButton(
                    onPressed: () {
                      
                      _create({
                        'name': nameController.text,
                        'email': emailController.text,
                        'password': passwordController.text,
                        'confirmpassword': confirmpasswordcontroller.text
                      });
                      _refreshItems();
                      nameController.text = '';
                      emailController.text = '';
                      passwordController.text = '';
                      confirmpasswordcontroller.text = '';
                    },
                    child: const Text('Submit'))
              ],
            ),
          );
        });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: //const Responsive(
          //   mobile: Mobile(),
          //   desktop: Desktop(),
          //
          Scaffold(
              appBar: AppBar(
                title: const Text('Flutter Clone'),
              ),
              body: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (_, index) {
                  final item = _list[index];

                  return Card(
                    child: ListTile(
                      onTap: () {
                        _showForm(_, item['key']);
                      },
                      title: Text(item['name']),
                      subtitle: Text(item['email']),
                      trailing: IconButton(
                          onPressed: () {
                            box.delete(item['key']);
                            _refreshItems();
                          },
                          icon: const Icon(Icons.delete)),
                    ),
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  _showForm(context, null);
                },
                child: const Icon(Icons.add),
              )),
    );
  }
}
