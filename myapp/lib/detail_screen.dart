import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/country.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late String keyword;

  Future<Country> fetchCountry() async {
    final response = await http.get(Uri.parse(
        "https://restcountries.com/v3.1/name/$keyword")); // Tạo resquest lên API với phương thức get
    if (response.statusCode == 200) {
      List countries = jsonDecode(response
          .body); // Vì response trả về là 1 list nên phải tạo ra list để nhận kết quả trả về, ngược lại nếu response trả về 1 object thì tạo ra object để nhận kết quả trả về
      var data =
          countries[0]; // Lấy phần tử đầu tiên của list được trả về từ API
      return Country.fromJSON(data as Map<String,
          dynamic>); // Ánh xạ từ 1 Json Object sang Object mà chương trình định nghĩa
    } else {
      throw Exception("Không tìm thấy quốc gia");
    }
  }

  @override
  Widget build(BuildContext context) {
    keyword = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: const Text("Chi tiet"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            // Sử dụng FutureBuilder để hiển thị đối tượng lên màn hình
            future: fetchCountry(),
            builder: (BuildContext context, AsyncSnapshot<Country> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          snapshot.data!.flag,
                          scale: 1.5,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text("Ten: ${snapshot.data!.name}"),
                    Text("Thu do: ${snapshot.data!.capital}"),
                    Text("Chau luc: ${snapshot.data!.continents}"),
                    Text("Tien te: ${snapshot.data!.currencies}"),
                    Text("dan so: ${snapshot.data!.population}"),
                    Text("Mui gio: ${snapshot.data!.timezones}"),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
