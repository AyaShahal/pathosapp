// import 'package:flutter/material.dart';

// class Order {
//   final int orderNumber;
//   final String name;
//   final String image;
//   final double price;
//   final TimeOfDay startedTime;
//   final bool isCompleted;

//   Order({
//     required this.orderNumber,
//     required this.name,
//     required this.image,
//     required this.price,
//     required this.startedTime,
//     required this.isCompleted,
//   });
// }

// class OrderWidget extends StatefulWidget {
//   @override
//   _OrderWidgetState createState() => _OrderWidgetState();
// }

// enum OrderStatus {
//   All,
//   Completed,
//   Open,
// }

// class _OrderWidgetState extends State<OrderWidget> {
//   List<Order> orders = [
//     Order(
//       orderNumber: 1,
//       name: 'John Doe',
//       image: 'assets/images/clerk.png',
//       price: 50.00,
//       startedTime: TimeOfDay(hour: 7, minute: 0),
//       isCompleted: true,
//     ),
//     Order(
//       orderNumber: 2,
//       name: 'John Doe',
//       image: 'assets/images/clerk.png',
//       price: 50.00,
//       startedTime: TimeOfDay(hour: 7, minute: 0),
//       isCompleted: false,
//     ),
//     Order(
//       orderNumber: 3,
//       name: 'John Doe',
//       image: 'assets/images/clerk.png',
//       price: 50.00,
//       startedTime: TimeOfDay(hour: 7, minute: 0),
//       isCompleted: true,
//     ),
//     Order(
//       orderNumber: 4,
//       name: 'John Doe',
//       image: 'assets/images/clerk.png',
//       price: 50.00,
//       startedTime: TimeOfDay(hour: 7, minute: 0),
//       isCompleted: false,
//     ),
//   ];

//   OrderStatus selectedStatus = OrderStatus.All;

//   List<Order> getFilteredOrders() {
//     if (selectedStatus == OrderStatus.Completed) {
//       return orders.where((order) => order.isCompleted).toList();
//     } else if (selectedStatus == OrderStatus.Open) {
//       return orders.where((order) => !order.isCompleted).toList();
//     } else {
//       return orders;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Order> filteredOrders = getFilteredOrders();

//     return Padding(
//       padding: EdgeInsets.all(40.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const Text(
//             "Order",
//             style: TextStyle(
//               fontSize: 54,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF3DC7F4),
//             ),
//           ),
//           const Text("10 orders found"),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     selectedStatus = OrderStatus.All;
//                   });
//                 },
//                 child: Text('All Orders',
//                     style: TextStyle(
//                         color: selectedStatus == OrderStatus.All
//                             ? Colors.black
//                             : Colors.grey,
//                         fontSize: 20)),
//               ),
//               SizedBox(width: 20),
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     selectedStatus = OrderStatus.Open;
//                   });
//                 },
//                 child: Text('Open',
//                     style: TextStyle(
//                         color: selectedStatus == OrderStatus.Open
//                             ? Colors.black
//                             : Colors.grey,
//                         fontSize: 20)),
//               ),
//               SizedBox(width: 20),
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     selectedStatus = OrderStatus.Completed;
//                   });
//                 },
//                 child: Text('Completed',
//                     style: TextStyle(
//                         color: selectedStatus == OrderStatus.Completed
//                             ? Colors.black
//                             : Colors.grey,
//                         fontSize: 20)),
//               ),
//             ],
//           ),
         
//           SizedBox(height: 20),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredOrders.length,
//               itemBuilder: (context, index) {
//                 final order = filteredOrders[index];
//                 final formattedTime = order.startedTime.format(context);
//                 return Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey, width: 1.0),
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                   ),
//                   padding:
//                       EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                   margin: EdgeInsets.only(bottom: 20.0),
//                   child: Row(
//                     children: [
//                       Text('${order.orderNumber}'),
//                       SizedBox(
//                         width: 100,
//                       ),
//                       Container(
//                         width: 10,
//                         height: 10,
//                         decoration: BoxDecoration(
//                           color: order.isCompleted
//                               ? Colors.grey
//                               : Color(0xFF3DC7F4),
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         order.isCompleted ? 'Completed' : 'Open',
//                         style: TextStyle(
//                           color: order.isCompleted
//                               ? Colors.grey
//                               : Color(0xFF3DC7F4),
//                         ),
//                       ),
//                       Spacer(),
//                       Image.asset(
//                         order.image,
//                         width: 50,
//                         height: 50,
//                       ),
//                       SizedBox(width: 20),
//                       Text(order.name),
//                       SizedBox(width: 300),
//                       Text(' $formattedTime'),
//                       SizedBox(width: 100),
//                       Text('\$${order.price.toStringAsFixed(2)}'),
//                       SizedBox(width: 20),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Order {
  final int orderNumber;
  final String name;
  final String image;
  final double price;
  final TimeOfDay startedTime;
  final bool isCompleted;

  Order({
    required this.orderNumber,
    required this.name,
    required this.image,
    required this.price,
    required this.startedTime,
    required this.isCompleted,
  });
}

class OrderWidget extends StatefulWidget {
  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

enum OrderStatus {
  All,
  Completed,
  Open,
}

enum OrderSortBy {
  OrderNumber,
  Status,
  Name,
  StartedTime,
  Price,
}

class _OrderWidgetState extends State<OrderWidget> {
  List<Order>  orders = [
    Order(
      orderNumber: 1,
      name: 'John Doe',
      image: 'assets/images/clerk.png',
      price: 50.00,
      startedTime: TimeOfDay(hour: 7, minute: 0),
      isCompleted: true,
    ),
    Order(
      orderNumber: 2,
      name: 'John Doe',
      image: 'assets/images/clerk.png',
      price: 50.00,
      startedTime: TimeOfDay(hour: 7, minute: 0),
      isCompleted: false,
    ),
    Order(
      orderNumber: 3,
      name: 'John Doe',
      image: 'assets/images/clerk.png',
      price: 50.00,
      startedTime: TimeOfDay(hour: 7, minute: 0),
      isCompleted: true,
    ),
    Order(
      orderNumber: 4,
      name: 'John Doe',
      image: 'assets/images/clerk.png',
      price: 50.00,
      startedTime: TimeOfDay(hour: 7, minute: 0),
      isCompleted: false,
    ),
  ];


  OrderStatus selectedStatus = OrderStatus.All;
  OrderSortBy selectedSortBy = OrderSortBy.OrderNumber;
  bool isSortAscending = true;
  int? filterOrderNumber;

  List<Order> getFilteredOrders() {
    List<Order> filtered = List.from(orders);

    if (selectedStatus == OrderStatus.Completed) {
      filtered = filtered.where((order) => order.isCompleted).toList();
    } else if (selectedStatus == OrderStatus.Open) {
      filtered = filtered.where((order) => !order.isCompleted).toList();
    }

    if (filterOrderNumber != null) {
      filtered = filtered.where((order) => order.orderNumber == filterOrderNumber).toList();
    }

    switch (selectedSortBy) {
      case OrderSortBy.Status:
        filtered.sort((a, b) => a.isCompleted ? 1 : -1);
        break;
      case OrderSortBy.Name:
        filtered.sort((a, b) => a.name.compareTo(b.name));
        break;
      case OrderSortBy.StartedTime:
        filtered.sort((a, b) =>
            a.startedTime.hour * 60 + a.startedTime.minute -
            b.startedTime.hour * 60 - b.startedTime.minute);
        break;
      case OrderSortBy.Price:
        filtered.sort((a, b) => a.price.compareTo(b.price));
        break;
      default:
        filtered.sort((a, b) => a.orderNumber.compareTo(b.orderNumber));
    }

    if (!isSortAscending) {
      filtered = List.from(filtered.reversed);
    }

    return filtered;
  }
  @override
  Widget build(BuildContext context) {
    List<Order> filteredOrders = getFilteredOrders();

    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Order",
            style: TextStyle(
              fontSize: 54,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3DC7F4),
            ),
          ),
          const Text("10 orders found"),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedStatus = OrderStatus.All;
                  });
                },
                child: Text('All Orders',
                    style: TextStyle(
                        color: selectedStatus == OrderStatus.All
                            ? Colors.black
                            : Colors.grey,
                        fontSize: 20)),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedStatus = OrderStatus.Open;
                  });
                },
                child: Text('Open',
                    style: TextStyle(
                        color: selectedStatus == OrderStatus.Open
                            ? Colors.black
                            : Colors.grey,
                        fontSize: 20)),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedStatus = OrderStatus.Completed;
                  });
                },
                child: Text('Completed',
                    style: TextStyle(
                        color: selectedStatus == OrderStatus.Completed
                            ? Colors.black
                            : Colors.grey,
                        fontSize: 20)),
              ),
    
              SizedBox(width: 50),
            
              SizedBox(
                width: 100,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      filterOrderNumber = int.tryParse(value);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Order #',
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
        Container(
  decoration: BoxDecoration(
    // border: Border.all(color: Colors.grey, width: 1.0),
    color: Color(0xFF3DC7F4),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  child: Row(
    children: [
      Text('Tables',style: TextStyle(fontSize: 20, color:Colors.white),),
      SizedBox(width: 100),
      GestureDetector(
        onTap: () {
          setState(() {
            selectedSortBy = OrderSortBy.Status;
          });
        },
        child: Row(
          children: [
          
            Text(
              'Status',
              style: TextStyle(
                color: selectedSortBy == OrderSortBy.Status
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
              Icon(
              Icons.arrow_drop_down_rounded,
              color: selectedSortBy == OrderSortBy.Status
                  ? Colors.white
                  : Colors.grey,
            ),
            SizedBox(width: 5),
          ],
        ),
      ),
      SizedBox(width: 100),
      GestureDetector(
        onTap: () {
          setState(() {
            selectedSortBy = OrderSortBy.Name;
          });
        },
        child: Row(
          children: [
           
            Text(
              'Waiter',
              style: TextStyle(
                color: selectedSortBy == OrderSortBy.Name
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
             Icon(
              Icons.arrow_drop_down_rounded,
              color: selectedSortBy == OrderSortBy.Name
                  ? Colors.white
                  : Colors.grey,
            ),
            SizedBox(width: 5),
          ],
        ),
      ),
      SizedBox(width: 100),
      GestureDetector(
        onTap: () {
          setState(() {
            selectedSortBy = OrderSortBy.StartedTime;
          });
        },
        child: Row(
          children: [
           
            SizedBox(width: 5),
            Text(
              'Started ',
              style: TextStyle(
                color: selectedSortBy == OrderSortBy.StartedTime
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
             Icon(
             Icons.arrow_drop_down_rounded,
              color: selectedSortBy == OrderSortBy.StartedTime
                  ? Colors.white
                  : Colors.grey,
            ),
          ],
        ),
      ),
      SizedBox(width: 100),
      GestureDetector(
        onTap: () {
          setState(() {
            selectedSortBy = OrderSortBy.Price;
          });
        },
        child: Row(
          children: [
           
            Text(
              'Price',
              style: TextStyle(
                color: selectedSortBy == OrderSortBy.Price
                    ? Colors.black
                    : Colors.grey,
              ),
            ),
            
          ],
        ),
      ),
    ],
  ),
),

        
           SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: filteredOrders.length,
              itemBuilder: (context, index) {
                final order = filteredOrders[index];
                final formattedTime = order.startedTime.format(context);
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: [
                      Text('${order.orderNumber}'),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: order.isCompleted
                              ? Colors.grey
                              : Color(0xFF3DC7F4),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        order.isCompleted ? 'Completed' : 'Open',
                        style: TextStyle(
                          color: order.isCompleted
                              ? Colors.grey
                              : Color(0xFF3DC7F4),
                        ),
                      ),
                      Spacer(),
                      Image.asset(
                        order.image,
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 20),
                      Text(order.name),
                      SizedBox(width: 300),
                      Text(' $formattedTime'),
                      SizedBox(width: 100),
                      Text('\$${order.price.toStringAsFixed(2)}'),
                      SizedBox(width: 20),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}