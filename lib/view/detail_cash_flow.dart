import 'package:catatan_keuangan/db_helper.dart';
import 'package:catatan_keuangan/model/cash_flow.dart';
import 'package:flutter/material.dart';

class DetailCashFlow extends StatefulWidget {
  const DetailCashFlow({Key? key}) : super(key: key);

  @override
  State<DetailCashFlow> createState() => _DetailCashFlowState();
}

class _DetailCashFlowState extends State<DetailCashFlow> {
  List<CashFlow> listCashFlow = [];
  DbHelper db = DbHelper();
  @override
  void initState() {
    // menjalankan fungsi getallkontak saat pertama kali dimuat
    _getAllCashFlow();
    super.initState();
  }

  Future<void> _getAllCashFlow() async {
    var list = await db.getAllCashFlow();
    setState(() {
      listCashFlow.clear();
      list!.forEach((cashFlow) {
        listCashFlow.add(CashFlow.fromMap(cashFlow));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Cash Flow'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: listCashFlow.length,
          itemBuilder: (BuildContext context, int index) {
            CashFlow cashFlow = listCashFlow[index];
            return Card(
              child: ListTile(
                title: Text(
                  '${cashFlow.nominal}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cashFlow.ket}',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text('${cashFlow.tgl}')
                  ],
                ),
                trailing: Icon(
                  '${cashFlow.jenis}' == 'Pemasukan'
                      ? Icons.arrow_back
                      : Icons.arrow_forward,
                  color: '${cashFlow.jenis}' == 'Pemasukan'
                      ? const Color.fromARGB(255, 40, 202, 102)
                      : const Color.fromARGB(255, 228, 72, 60),
                ),
                isThreeLine: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
