import 'dart:convert';

List<ProductOrder> productOrderFromJson(String str) => List<ProductOrder>.from(
    json.decode(str).map((x) => ProductOrder.fromJson(x)));

String productOrderToJson(List<ProductOrder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductOrder {
  String? id;
  UserId? userId;
  String? orderId;
  int? amount;
  List<OrderItem>? orderItems;
  String? paymentStatus;
  int? v;

  ProductOrder({
    this.id,
    this.userId,
    this.orderId,
    this.amount,
    this.orderItems,
    this.paymentStatus,
    this.v,
  });

  factory ProductOrder.fromJson(Map<String, dynamic> json) => ProductOrder(
        id: json["_id"],
        userId: UserId.fromJson(json["userId"]),
        orderId: json["orderId"],
        amount: json["amount"],
        orderItems: List<OrderItem>.from(
            json["orderItems"].map((x) => OrderItem.fromJson(x))),
        paymentStatus: json["paymentStatus"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId?.toJson(),
        "orderId": orderId,
        "amount": amount,
        "orderItems": orderItems != null
            ? List<dynamic>.from(orderItems!.map((x) => x.toJson()))
            : [],
        "paymentStatus": paymentStatus,
        "__v": v,
      };
}

class OrderItem {
  String? id;
  String? category;
  String? orderItemId;
  String? name;
  String? description;
  int? price;
  int? purchasePrice;
  int? quantity;

  OrderItem({
    this.id,
    this.category,
    this.orderItemId,
    this.name,
    this.description,
    this.price,
    this.purchasePrice,
    this.quantity,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["_id"],
        category: json["category"],
        orderItemId: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        purchasePrice: json["purchasePrice"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
        "id": orderItemId,
        "name": name,
        "description": description,
        "price": price,
        "purchasePrice": purchasePrice,
        "quantity": quantity,
      };
}

class UserId {
  String? id;
  String? from;
  String? nextFlow;
  int? v;

  UserId({
    this.id,
    this.from,
    this.nextFlow,
    this.v,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        from: json["from"],
        nextFlow: json["next_flow"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "from": from,
        "next_flow": nextFlow,
        "__v": v,
      };
}
