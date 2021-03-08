import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'fetchtitles.dart';

// In Development feature. Currently figuring out how to dynamically load data into auocomplete field

class BookSearch extends StatefulWidget {

  @override
  _BookSearchState createState() => new _BookSearchState();
}

class _BookSearchState extends State<BookSearch> {
  AutoCompleteTextField searchTextField;

  _BookSearchState();

//  void _loadData() async {
//    await BooksLoadModel.fetchBooks("The Lord of the rings");
//  }

  @override
//  void initState() {
//    _loadData();
//    super.initState();
//  }


  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    GlobalKey<AutoCompleteTextFieldState<BookObjects>> key = new GlobalKey();
    return Scaffold(
        appBar: AppBar(
          title: Text('Auto Complete List Demo'),
        ),
        body: new Center(
            child: new Column(
                children: <Widget>[
                  new Column(
                      children: <Widget>[
                          searchTextField = AutoCompleteTextField<BookObjects>(
                              style: new TextStyle(color: Colors.black, fontSize: 16.0),
                                    decoration: new InputDecoration(
                                    suffixIcon: Container(
                                      width: 85.0,
                                      height: 60.0,
                                    ),
                                    contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                                    filled: true,
                                    hintText: 'Search Book Title',
                                    hintStyle: TextStyle(color: Colors.black)),
                              itemBuilder: (context, item) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(item.title,
                                          style: TextStyle(
                                            fontSize: 16.0
                                          ),),
                                    Padding(
                                      padding: EdgeInsets.all(15.0),
                                    )
                                  ],
                                );
                              },
                              itemFilter: (item, query) {
                                return item.title
                                            .toLowerCase()
                                            .startsWith(query.toLowerCase());
                              },
                            itemSorter: (a,b) {
                                return a.title.compareTo(b.title);
                            },
                            itemSubmitted: (item) {
                              setState(() => searchTextField.textField.controller.text = item.title);
                            },
                            key: key,
                            suggestions: BooksLoadModel.books,

                          )
                      ]),
                ])));
  }
}
