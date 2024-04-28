import 'package:flutter/material.dart';

class Billing extends StatefulWidget {
  const Billing({Key? key}) : super(key: key);

  @override
  State<Billing> createState() => _BillingState();
}

class _BillingState extends State<Billing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(250, 20, 0, 0),
            child: Text(
              "Payment",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(250, 30, 250, 0),
            child: Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                border: Border.all(
                  color: Colors.grey.shade100,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 4, // Blur radius
                    offset: Offset(0, 2), // Offset
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 1, 4, 180),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Text(
                            'Product',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                          child: Text(
                            'Base Price',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            'ESG Suite',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                          child: Text(
                            "Price",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            'Discount',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.green),
                          )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                          child: Text(
                            "Price",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 1, 4, 180),
                      border: Border(
                        bottom: BorderSide(
                          color:
                              Colors.black, // Choose your desired border color
                          width: 1.0, // Choose your desired border width
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Text(
                              'Sub Total',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            )),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                            child: Text(
                              "Price",
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 1, 4, 180),
                      border: Border(
                        bottom: BorderSide(
                          color:
                              Colors.black, // Choose your desired border color
                          width: 1.0, // Choose your desired border width
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            )),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                          child: Text(
                            "Price",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 20, 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         // Payment(), // Replace `NextPage` with your actual next page class
                              //   ),
                              // );
                            },
                            child: Text(
                              "Pay With Credit Card",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8.0),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 1, 4, 180),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 60,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "PayPal",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8.0),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 1, 4, 180),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
