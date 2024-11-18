import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp/app/model/get_product_model.dart';
import 'package:whatsapp/app/model/order_product_model.dart';

class ApiService {
  final String baseUrl = 'http://100.0.106.118:4000/products';
  final String baseUrlForProduct = 'http://100.0.106.118:4000/orders';

  Future<List<GetProduct>> fetchProducts(String category) async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        return getProductFromJson(response.body);
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching products: $e');
      throw Exception('Failed to fetch products: $e');
    }
  }

  Future<List<ProductOrder>> fetchOrders() async {
    try {
      final response = await http.get(Uri.parse(baseUrlForProduct));

      if (response.statusCode == 200) {
        return productOrderFromJson(response.body);
      } else {
        throw Exception('Failed to load orders');
      }
    } catch (e) {
      debugPrint('Failed to load orders: $e');
      throw Exception('Failed to load orders: $e');
    }
  }
}
