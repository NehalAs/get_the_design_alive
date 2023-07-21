import 'package:abs_task3/models/pets_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PetMarketScreen extends StatefulWidget {
  @override
  State<PetMarketScreen> createState() => _PetMarketScreenState();
}

class _PetMarketScreenState extends State<PetMarketScreen> {

  //Note: Some of the image links did not work, so I downloaded some of them and put them as asset image
  // and others didn't open at all so I used images from the internet

  List<Pets> petList = [
    Pets("Dog", "Golden", "20", "assets/images/dog1.jpg"),
    Pets("Labrador", 'Golden', '18', 'assets/images/labrador.jpg'),
    Pets('Dog', 'Cardigan', '12', 'assets/images/dog3.jpg'),
    Pets('Cat', 'Street Cat', '17', 'assets/images/cat1.jpg'),
    Pets('Cat', 'White Cat', '19', 'assets/images/WhiteCat.jpg'),
    Pets('Cat', 'Kitten', '18', 'assets/images/cat3.jpg'),
    Pets('Bird', 'House Bird', '15', 'assets/images/house.jpg'),
    Pets('Bird', 'Parrot', '14', 'assets/images/Parrot.jpg'),
    Pets('Bird', 'Pink Bird', '15', 'assets/images/PinkBird.jpg'),
    Pets('Bird', 'Talking Parrot', '17', 'assets/images/TalkingParrot.jpg'),
    Pets('Rat', 'Hamster', '9', 'assets/images/Hamster.jpg'),
    Pets('Rabbit', 'Brown Rabbit', '16', 'assets/images/BrownRabbit.jpg'),
    Pets('Rabbit', 'Gray Rabbit', '17', 'assets/images/rabbit2.jpg'),
  ];

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 130,
              width: double.infinity,
              color: Colors.grey[300], //CupertinoColors.systemGrey4,
              child: Center(
                  child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 40),
                child: Text(
                  'Pet Market',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30)),
                child: CupertinoSearchTextField(
                    controller: searchController,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      //onFieldSubmitted:(value){},
                    ),
                    itemColor: Colors.orange,
                    padding: EdgeInsets.all(10),
                    placeholderStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 19,
                    ),
                    placeholder: '   Search by pet type',
                    onSubmitted: (value){
                      searchPets(value);
                    },
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.grey[300],
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      petItemBuilder(petList[index]),
                  itemCount: petList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // search by pet type such as "golden","kitten"
  void searchPets(String query){
    petList = [
      Pets("Dog", "Golden", "20", "assets/images/dog1.jpg"),
      Pets("Labrador", 'Golden', '18', 'assets/images/labrador.jpg'),
      Pets('Dog', 'Cardigan', '12', 'assets/images/dog3.jpg'),
      Pets('Cat', 'Street Cat', '17', 'assets/images/cat1.jpg'),
      Pets('Cat', 'White Cat', '19', 'assets/images/WhiteCat.jpg'),
      Pets('Cat', 'Kitten', '18', 'assets/images/cat3.jpg'),
      Pets('Bird', 'House Bird', '15', 'assets/images/house.jpg'),
      Pets('Bird', 'Parrot', '14', 'assets/images/Parrot.jpg'),
      Pets('Bird', 'Pink Bird', '15', 'assets/images/PinkBird.jpg'),
      Pets('Bird', 'Talking Parrot', '17', 'assets/images/TalkingParrot.jpg'),
      Pets('Rat', 'Hamster', '9', 'assets/images/Hamster.jpg'),
      Pets('Rabbit', 'Brown Rabbit', '16', 'assets/images/BrownRabbit.jpg'),
      Pets('Rabbit', 'Gray Rabbit', '17', 'assets/images/rabbit2.jpg'),
    ];
   var suggestions = petList.where((element){
      var petTypeInLower=element.petType.toLowerCase();
      var input = query.toLowerCase();
      return petTypeInLower.contains(input);
    }).toList();
   setState(()=>petList=suggestions);
  }

  Widget petItemBuilder(Pets pet) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(
                  pet.petImage,
                ),
                width: 150,
                height: 150,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet.petType,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      pet.petCategory,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.pets,
                          color: Colors.orange[800],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Pet Love ${pet.petCount}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.orange[800],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
