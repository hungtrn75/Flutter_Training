import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_train_1/components/add_transaction.dart';
import 'package:flutter_train_1/components/chart.dart';
import 'package:flutter_train_1/components/user_transactions.dart';
import 'package:flutter_train_1/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            button: TextStyle(color: Colors.white)),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: [
        const Locale('vi'),
        const Locale('en'),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaction> transactions = [
    Transaction(
      id: 'id_1',
      title: 'Trans 1',
      amount: 123.2,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: 'id_2',
      title: 'Trans 2',
      amount: 222.2,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: 'id_3',
      title: 'Trans 3',
      amount: 43233.2,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
  ];

  bool _showChart = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  void _addTransaction(String title, double amount, DateTime choosenDate) {
    transactions.add(Transaction(
      id: 'id_${transactions.length + 1}',
      title: title,
      amount: amount,
      date: choosenDate,
    ));
    setState(() {});
  }

  void _removeTransaction(int index) {
    setState(() {
      transactions.removeAt(index);
    });
  }

  void _addNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddTransaction(
            addTransaction: _addTransaction,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final bool isLandcape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle),
            iconSize: 30,
            onPressed: () => _addNewTransaction(context),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            isLandcape
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('Show chart'),
                      SizedBox(
                        width: 5,
                      ),
                      Switch(
                        value: _showChart,
                        onChanged: (status) {
                          setState(() {
                            _showChart = status;
                          });
                        },
                      )
                    ],
                  )
                : SizedBox.shrink(),
            _showChart || !isLandcape ? Chart(transactions) : SizedBox.shrink(),
            UserTransactions(
              transactions: transactions,
              removeTransaction: _removeTransaction,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addNewTransaction(context),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
