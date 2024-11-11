import 'package:flutter/material.dart';

class BubleSortPage extends StatefulWidget {
  const BubleSortPage({super.key});

  @override
  State<BubleSortPage> createState() => _BubleSortPageState();
}

class _BubleSortPageState extends State<BubleSortPage> {
  final formKey = GlobalKey<FormState>();
  final tecData = TextEditingController();
  final tecSblmUrut = TextEditingController();
  final tecStlhUrut = TextEditingController();
  List<int> list = [];

  void bubbleSort(List arr) {
    int n = arr.length;
    int temp = 0;
    for (int i = 0; i < n; i++) {
      for (int j = 1; j < (n - i); j++) {
        if (arr[j - 1] > arr[j]) {
          temp = arr[j - 1];
          arr[j - 1] = arr[j];
          arr[j] = temp;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buble Sort'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 8, left: 8, right: 8),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: tecData,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Data masih kosong'
                      : null,
                  decoration: InputDecoration(
                      labelText: 'Data ke-',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                        onPressed: () {
                          setState(() {
                            if (formKey.currentState!.validate()) {
                              int data = int.parse(tecData.text);
                              list.add(data);

                              debugPrint('List awal : ${list}');

                              tecData.text = '';
                            }
                          });
                        },
                        child: Text('Input Data')),
                    ElevatedButton(
                        onPressed: () {
                          list.clear();
                        },
                        child: Text('Hapus Data')),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]),
                  child: Text('Data : ${list}'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  maxLines: 5,
                  readOnly: true,
                  controller: tecSblmUrut,
                  decoration: InputDecoration(
                      labelText: 'Data sebelum pengurutan',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  maxLines: 5,
                  readOnly: true,
                  controller: tecStlhUrut,
                  decoration: InputDecoration(
                      labelText: 'Data setelah pengurutan',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      String dataAcak = '';
                      String dataUrut = '';

                      list.forEach((element) {
                        dataAcak = '${dataAcak} ${element}';
                      });

                      tecSblmUrut.text = dataAcak;

                      bubbleSort(list);
                      debugPrint('Urut Data : ${list}');

                      list.forEach((element) {
                        dataUrut = '${dataUrut} ${element}';
                      });
                      tecStlhUrut.text = dataUrut;
                    },
                    child: Text('URUTKAN'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
