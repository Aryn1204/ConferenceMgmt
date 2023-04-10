import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsPage extends StatelessWidget {

  final nameController = TextEditingController();
  final areaOfInterestController = TextEditingController();
  final subjectController = TextEditingController();
  final expertController = TextEditingController();
  final documentController = TextEditingController();

  void createData(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection('Candidates').doc(nameController.text);

    Map<String,dynamic> candidate = {
        "candidateName":nameController.text,
        "areaOfInterest":areaOfInterestController.text,
        "subject":subjectController.text,
        "expert":expertController.text,
        "documentName":documentController.text
    };
    documentReference.set(candidate);
  }

  DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        const Padding(
          padding: EdgeInsets.all(12),
          child: Text('Enter Details to be added to database'),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Enter Name',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 3, color: Colors.blueAccent), //<-- SEE HERE
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: areaOfInterestController,
            decoration: InputDecoration(
              hintText: 'Enter Area of Interest',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 3, color: Colors.blueAccent), //<-- SEE HERE
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: subjectController,
            decoration: InputDecoration(
              hintText: 'Enter Subject',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 3, color: Colors.blueAccent), //<-- SEE HERE
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: documentController,
            decoration: InputDecoration(
              hintText: 'Enter FileName',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 3, color: Colors.blueAccent), //<-- SEE HERE
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: expertController,
            decoration: InputDecoration(
              hintText: 'Enter Preferred Expert',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(

                    width: 3, color: Colors.blueAccent), //<-- SEE HERE
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 45.0,
          width: MediaQuery.of(context).size.width-20,
          child: ElevatedButton(
            onPressed: createData,
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            child: const Text('Upload Documents'),
          ),
        ),
      ],
    );
  }


}
