import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spring/providers/transaction_providers.dart';
import 'package:spring/ui_utils.dart';

class TransactionTile extends StatefulWidget {
  TransactionTile({Key? key, required this.id}) : super(key: key);
  String id;
  @override
  State<TransactionTile> createState() => _TransactionTileState();
}

class _TransactionTileState extends State<TransactionTile> {
  var _init = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<TransactionProvider>(context)
          .getProductList(widget.id)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    var transaction = Provider.of<TransactionProvider>(context).product;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width * 0.85,
        height: 50,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: UiUtils.medium),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${transaction.merchantName}",
                style: TextStyle(
                  fontFamily: UiUtils.fontFamily,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Text(
                "${transaction.modified}",
                style: TextStyle(
                  color: Color(0xffbdbdbd),
                  fontSize: 13,
                  fontFamily: UiUtils.fontFamily,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.07,
                ),
              )
            ],
          ),
          Expanded(
              child: Align(
                  alignment: FractionalOffset.topRight,
                  child: Text(
                    "${transaction.amount}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xff363853),
                      fontSize: 16,
                    ),
                  )))
        ]),
      ),
    );
  }
}
