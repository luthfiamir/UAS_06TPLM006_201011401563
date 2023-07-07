import 'package:intl/intl.dart';
import 'package:uas_luthfi/provider/provider_cuaca.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM dd, yyyy').format(now);
    String dayOfWeek = DateFormat('EEEE').format(now);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplikasi Cuaca Luthfi Amir Ramadhan"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.network(
            'https://cdn.pixabay.com/photo/2019/05/12/20/11/mountains-4199004_1280.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Consumer<ProviderCuaca>(
            builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: provider.cityNameText,
                      decoration: const InputDecoration(
                        hintText: "Masukkan Nama Kota",
                        labelText: "Nama Kota",
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        provider.showWeatherData();
                      },
                      child: const Text(
                        "Tampilkan Data Cuaca",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 80),
                    Text(
                      provider.modelCuaca?.name ?? "Waiting Data",
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$dayOfWeek, $formattedDate",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${provider.modelCuaca?.main?.temp?.toStringAsFixed(0)}°c",
                          style: const TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      provider.modelCuaca?.weather?.first.main ??
                          "Waiting data",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "${provider.modelCuaca?.main?.tempMin?.toStringAsFixed(0)}°c",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const TextSpan(
                                text: "/",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "${provider.modelCuaca?.main?.tempMax?.toStringAsFixed(0)}°c",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}