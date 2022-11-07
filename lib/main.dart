import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp([Key? key]) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numero = '0';
  double primeiroNumero = 0.0;
  String operacao = '';

  void calcular(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(() {
          numero += tecla;
          numero = numero.replaceAll(',', '.');
          if (numero.contains('.')) {
          } else {
            int numeroInt = int.parse(numero);
            numero = numeroInt.toString();
          }
          numero = numero.replaceAll('.', ',');
        });
        break;

      case 'AC':
        setState(() {
          numero = '0';
        });
        break;

      case '<X':
        setState(() {
          if (double.parse(numero) > 0) {
            numero = numero.substring(0, numero.length - 1);
          }
          if (numero == '') {
            numero = '0';
          }
        });
        break;

      case '+':
      case '-':
      case 'x':
      case '/':
        operacao = tecla;
        numero = numero.replaceAll(',', '.');
        primeiroNumero = double.parse(numero);
        numero = numero.replaceAll('.', ',');
        numero = '0';
        break;

      case '=':
        double resultado = 0.0;
        numero = numero.replaceAll(',', '.');
        if (operacao == '+') {
          resultado = primeiroNumero + double.parse(numero);
        }

        if (operacao == '-') {
          resultado = primeiroNumero - double.parse(numero);
        }

        if (operacao == 'x') {
          resultado = primeiroNumero * double.parse(numero);
        }

        if (operacao == '/') {
          if (double.parse(numero) * 1 == 0) {
            print('Erro divisão por zero');
          } else {
            resultado = primeiroNumero / double.parse(numero);
          }
        }

        String resultadoString = resultado.toString();
        List<String> resultadoPartes = resultadoString.split('.');

        if (int.parse(resultadoPartes[1]) * 1 == 0) {
          setState(() {
            numero = int.parse(resultadoPartes[0]).toString();
          });
        } else {
          setState(() {
            numero = resultado.toString();
          });
        }

        numero = numero.replaceAll('.', ',');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Calculadora')),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      numero,
                      style: const TextStyle(fontSize: 72),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => calcular('AC'),
                      child: const Text(
                        'AC',
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                    const Text(
                      '',
                      style: TextStyle(fontSize: 48),
                    ),
                    const Text(
                      '',
                      style: TextStyle(fontSize: 48),
                    ),
                    GestureDetector(
                      onTap: () => calcular('<x'),
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/0/340.png',
                        width: 72,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => calcular('7'),
                      child: Image.network(
                        'https://cdn.icon-icons.com/icons2/2796/PNG/96/number_seven_icon_178238.png',
                        width: 72,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('8'),
                      child: Image.network(
                        'https://cdn.icon-icons.com/icons2/2796/PNG/96/number_eight_icon_178239.png',
                        width: 72,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('9'),
                      child: Image.network(
                        'https://cdn.icon-icons.com/icons2/2796/PNG/96/number_nine_icon_178240.png',
                        width: 72,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('/'),
                      child: const Text(
                        '/',
                        style: TextStyle(fontSize: 48),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => calcular('4'),
                      child: Image.network(
                        'https://cdn.icon-icons.com/icons2/2796/PNG/96/number_four_icon_178235.png',
                        width: 72,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('5'),
                      child: Image.network(
                        'https://cdn.icon-icons.com/icons2/2717/PNG/96/number_circle_five_icon_173690.png',
                        width: 72,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('6'),
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdebMdMYGHxBtQPYLM37TVE4lks0ixR9R6kg&usqp=CAU',
                        width: 72,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('x'),
                      child: Image.network(
                        'https://cdn.icon-icons.com/icons2/1238/PNG/96/xbutton_83749.png',
                        width: 72,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => calcular('1'),
                      child: Image.network(
                        'https://cdn.icon-icons.com/icons2/2796/PNG/96/number_one_icon_178232.png',
                        width: 72,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('2'),
                      child: Image.network(
                        'https://cdn.icon-icons.com/icons2/2796/PNG/96/number_two_icon_178233.png',
                        width: 72,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('3'),
                      child: Image.network(
                        'https://cdn.icon-icons.com/icons2/2796/PNG/96/number_tree_icon_178234.png',
                        width: 72,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('-'),
                      child: Image.network(
                        'https://cdn.icon-icons.com/icons2/936/PNG/96/minus-sign-inside-a-black-circle_icon-icons.com_73488.png',
                        width: 72,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => calcular('0'),
                      child: Image.network(
                        'https://cdn.icon-icons.com/icons2/2796/PNG/512/number_zero_icon_178241.png',
                        width: 72,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular(','),
                      child: Image.network(
                        'https://cdn.icon-icons.com/icons2/2248/PNG/96/comma_circle_icon_137734.png',
                        width: 72,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('='),
                      child: Image.network(
                        'https://cdn.icon-icons.com/icons2/2622/PNG/96/math_equals_icon_158292.png',
                        width: 72,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => calcular('+'),
                      child: Image.network(
                        'https://cdn.icon-icons.com/icons2/2346/PNG/96/add_insert_new_plus_button_icon_142943.png',
                        width: 72,
                      ),
                    ),
                  ],
                ),
                const Text('Coluna 6'),
              ])),
    );
  }
}
