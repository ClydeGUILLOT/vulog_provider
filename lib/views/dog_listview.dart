import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/functions/capitalize_string.dart';
import 'package:untitled/provider/dogs.dart';
import 'package:untitled/globals.dart' as globals;
import 'package:untitled/ui/modal_bottom_sheet.dart';


import '../api/request.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TEST Provider')
      ),

      body: Flex(
        direction: Axis.vertical,
        children: [
          const SizedBox(height: 20),
          const Text('LIST OF DOGS'),
          const SizedBox(height: 10),
          _buildPosts(context)
        ],
      )
    );
  }
  Widget _buildPosts(BuildContext context) {
    List<String> listDogs = Provider.of<DOGS>(context, listen: false).dogsNames;
//    List<String> listDogsUrl = Provider.of<DOGS>(context, listen: false).dogsUrls;

    return Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context,index){
              String img = globals.listUrls.isEmpty ?
              "https://images.dog.ceo/breeds/mix/Annabelle5.jpeg" :
              globals.listUrls[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: Image.network(img, fit: BoxFit.cover).image),
                  title: Text(listDogs[index].capitalize(),style: const TextStyle(fontSize: 20),),
                  onTap: () => showModal(context, listDogs[index], img),
                ),
              );
            },itemCount: listDogs.length,
          )
      );
  }
}
