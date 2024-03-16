import 'package:flutter/material.dart';
import 'MenuApp.dart';
class ContentApp extends StatefulWidget {
  const ContentApp({super.key});
  @override
  State<ContentApp> createState() => _ContentApp();
}

class _ContentApp extends State<ContentApp> {
  final List<String> listTitle = [
    'Abdomen aigue chirurgical',
    'Accident vasculaire cérébral',
    'Agitation',
    'Angine érythémateuse et érythématopultacée',
    'Asthme',
    'Bilharziose',
    'Classification des antalgiques',
    'Colique hépatique',
    'Colique nephretique',
    'Conjonctivites',
    'Convulsion fébrile de l’enfant',
    'Diabète de type 2',
    'Eclampsie',
    'Eczéma',
    'Etats de choc',
    'Ethylisme aigue',
    'Fièvre typhoïde',
    'Gale',
    'Gastro-entérite de l’enfant',
    'Goitre',
    'Goutte',
    'Grippe',
    'Hémorragie digestive haute',
    'Hémorragie méningée',
    'Hépatite virale aigue',
    'Hypertension artérielle',
    'Ictère néonatale',
    'Infarctus du myocarde',
    'Infection cutanée bactérienne',
    'Infection génitale de la femme',
    'Infection urinaire masculine',
    'Insuffisance cardiaque',
    'Insuffisance rénale chronique',
    'Lombosciatique aigue commune',
    'Migraine',
    'Neurocysticercose',
    'Oreillon',
    'Otite moyenne aigue de l’enfant',
    'Paludisme',
    'Pancréatite aigue',
    'Peste',
    'Prédiabète',
    'Psoriasis',
    'Rage',
    'Rhumatisme articulaire aigue',
    'Sinusite aigue de l’adulte',
    'Syphilis',
    'Ulcère gastroduodénale',
    'Varicelle',
  ];
  //const _ContentApp({super.key});
  List<String> listResult = [];
  void rechercherElement(String recherche) {
    listResult.clear();
    if (recherche.isEmpty) {
      listResult.addAll(listTitle);
    } else {
      for (String element in listTitle) {
        if (element.toLowerCase().contains(recherche.toLowerCase())) {
          listResult.add(element);
        }
      }
    }
    setState(() {});
  }

  Widget myDrawerHeader() {
    return DrawerHeader(
      child: Column(
        children: [
          const Text('Les sommaires en PDF'),
      SizedBox(
              height: 20), // Espacement entre le texte et la barre de recherche
          TextField(
            decoration: InputDecoration(
              hintText: 'Rechercher...',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              rechercherElement(value);
            },
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
      ),
    );
  }

  List<ListTile> listTiles = [];
  @override
  Widget build(BuildContext context) {
    if (listResult.isEmpty)
      listTiles = listTitle
          .map((element) => ListTile(
                title: Text(element),
                onTap: () {
                  Navigator.pop(context);
                },
              ))
          .toList();
    else
      listTiles = listResult
          .map((element) => ListTile(
                title: Text(element),
                onTap: () {
                  Navigator.pop(context);
                },
              ))
          .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('SCHÉMAS THÉRAPEUTIQUES DES MÉDECINS',
        style:TextStyle(
    fontFamily: 'Roboto',
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
  )
  ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            myDrawerHeader(),
            //...listTiles,
          ],
        ),
      ),
      body: const MenuApp(),
    );
  }
}
