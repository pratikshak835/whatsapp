import 'package:common_jds_flutter/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/app/api_service.dart';
import 'package:whatsapp/app/colors/app_colors.dart';
import 'package:whatsapp/app/common/app_bar.dart';
import 'package:whatsapp/app/common/custom_table.dart';
import 'package:whatsapp/app/common/sidebar.dart';
import 'package:whatsapp/app/common/strings.dart';
import 'package:whatsapp/app/model/order_product_model.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final ApiService _apiService = ApiService();
  List<ProductOrder> _orders = []; // Change to ProductOrder
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchOrders(); // Fetch orders instead
  }

  Future<void> _fetchOrders() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final orders = await _apiService.fetchOrders(); // Call fetchOrders
      setState(() {
        _orders = orders;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      backgroundColor: AppColors.FFE0E0E0,
      body: Sidebar(
        widget: Padding(
          padding: const EdgeInsets.only(left: 70.0, right: 10),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: AppColors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: Strings.allOrders,
                    color: Colors.black,
                    fontWeight: CustomFontWeight.bold,
                    isRilFont: true,
                    size: 24,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : _error != null
                            ? Center(child: Text('Error: $_error'))
                            : CustomTable(
                                isExpanded: false,
                                headerList: const [
                                  "Order ID",
                                  "Product Name",
                                  "Amount",
                                  "Quantity",
                                  "Description",
                                  "Status",
                                ],
                                rowsList: _orders.map((order) {
                                  return [
                                    order.orderId ?? "",
                                    order.orderItems?.isNotEmpty == true
                                        ? order.orderItems![0].name ?? ""
                                        : "",
                                    "\u{20B9}${order.amount ?? ""}",
                                    order.orderItems?.isNotEmpty == true
                                        ? order.orderItems![0].quantity
                                                .toString() ??
                                            ""
                                        : "",
                                    order.orderItems?.isNotEmpty == true
                                        ? order.orderItems![0].description ?? ""
                                        : "",
                                    order.paymentStatus == "success"
                                        ? "Success"
                                        : order.paymentStatus == "pending"
                                            ? "Pending"
                                            : order.paymentStatus ?? "",
                                  ];
                                }).toList(),
                              ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
