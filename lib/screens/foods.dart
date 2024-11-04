import 'package:desafio/screens/primeiraTela.dart';
import 'package:flutter/material.dart';
import 'package:desafio/components/food.dart';

class Foods extends StatefulWidget {
  Foods({Key? key}) : super(key: key);

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Pet Care',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFF001D3D),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.amberAccent,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              final frutas = [
                {
                  "nome": "Maçã",
                  "descricao":
                      "Maçãs podem ser seguras para cães, mas as sementes devem ser removidas e oferecidas em pequenas quantidades. Consulte um veterinário antes de dar maçãs a qualquer animal.",
                  "image": "assets/images/9211.jpg"
                },
                {
                  "nome": "Manga",
                  "descricao":
                      "Mangas são seguras para cães, mas devem ser oferecidas sem casca e caroço para evitar obstruções. Sempre ofereça em pequenas quantidades e consulte um veterinário antes de incluir na dieta do seu animal.",
                  "image": "assets/images/18965829.jpg"
                },
                {
                  "nome": "Pera",
                  "descricao":
                      "Peras são seguras para cães, mas é importante removê-las as sementes e o caroço, pois podem ser tóxicos. Ofereça em pequenas quantidades e consulte um veterinário antes de adicionar à dieta do seu animal.",
                  "image":
                      "assets/images/pdwatercolorfruitbatch1-1098-gloy-b.jpg"
                },
                {
                  "nome": "Morango",
                  "descricao":
                      "Morangos são seguros para cães e podem ser oferecidos como um lanche saudável. Eles são ricos em vitaminas, mas devem ser dados em pequenas quantidades para evitar problemas digestivos. Sempre lave bem os morangos antes de servir.",
                  "image": "assets/images/8324761.jpg"
                },
                {
                  "nome": "Banana",
                  "descricao":
                      "Bananas são seguras para cães e podem ser um lanche saudável e energético. Ricas em potássio, devem ser oferecidas em pequenas quantidades devido ao alto teor de açúcar. Consulte um veterinário antes de incluí-las na dieta do seu animal.",
                  "image":
                      "assets/images/single-banana-isolated-white-background.jpg"
                },
                {
                  "nome": "Melão",
                  "descricao":
                      "Melão é seguro para cães e pode ser um lanche nutritivo e refrescante. Rico em vitaminas e com alto teor de água, deve ser oferecido sem sementes e casca. Consulte um veterinário antes de adicioná-lo à dieta do seu animal.",
                  "image": "assets/images/8324280.jpg"
                },
                {
                  "nome": "Pêssego",
                  "descricao":
                      "Pêssegos são seguros para cães, mas devem ser oferecidos sem caroço e casca. Dê em pequenas quantidades e consulte um veterinário antes de incluí-los na dieta do seu animal.",
                  "image": "assets/images/peach-table.jpg"
                },
                {
                  "nome": "Melancia",
                  "descricao":
                      "Melancia é segura para cães e pode ser um lanche refrescante. Ofereça sem sementes e casca, pois podem causar problemas digestivos. Consulte um veterinário antes de incluir melancia na dieta do seu animal.",
                  "image": "assets/images/slice-watermelon-white-background.jpg"
                },
                {
                  "nome": "Abacate",
                  "descricao":
                      "Abacate não é seguro para cães, pois contém persina, que pode ser tóxica. Mesmo pequenas quantidades podem causar problemas gastrointestinais, por isso é melhor evitá-lo na dieta do seu animal.",
                  "image": "assets/images/18965810.jpg"
                },
                {
                  "nome": "Cerejas",
                  "descricao":
                      "Cerejas são perigosas para cães, pois suas sementes contêm cianeto, que é tóxico. Além disso, a polpa pode causar desconforto digestivo em grandes quantidades. É melhor evitar dar cerejas ao seu animal.",
                  "image": "assets/images/8851424.jpg"
                },
              ];

              return Food(
                nome: frutas[index]['nome']!,
                descricao: frutas[index]['descricao']!,
                image: frutas[index]['image']!,
              );
            },
          ),
        ));
  }
}
