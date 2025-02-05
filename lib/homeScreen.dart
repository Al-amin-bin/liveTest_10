import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _name= TextEditingController();
  final TextEditingController _age= TextEditingController();
  final TextEditingController _salary= TextEditingController();
  final List<String> name = [];
  final List<String> age = [];
  final List<String> salary = [];
  Map<String, String> contactMap = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Employee "),
      ),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                      hintText: "Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person)
                  ),
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return "Please Enter Name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12,),
                TextFormField(
                  validator: (String? value){
                    if(value!.isEmpty  ){
                      return "Enter valid Number";
                    }
                    return null;
                  },
                  controller: _age,
                  decoration: InputDecoration(
                      hintText: "Age",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.contact_page)
                  ),
                ),
                SizedBox(height: 12,),
                TextFormField(
                  validator: (String? value){
                    if(value!.isEmpty  ){
                      return "Enter valid Number";
                    }
                    return null;
                  },
                  controller: _salary,
                  decoration: InputDecoration(
                      hintText: "Salary",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.money)
                  ),
                ),
                SizedBox(height: 12,),
                ElevatedButton(
                    onPressed: (){
                      if(_key.currentState!.validate()){
                        setState(() {
                          name.add(_name.text.trim());
                          age.add(_age.text.trim());
                          salary.add(_salary.text.trim());

                        });

                        _name.clear();
                        _age.clear();
                        _salary.clear();


                      }

                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 25),
                        backgroundColor: Colors.brown,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),
                    child:  Text("ADD Employee",style:TextStyle(color: Colors.white),)),
                SizedBox(height: 12,),

                Expanded(
                  child: ListView.builder(
                      itemCount: name.length,
                      itemBuilder: (context,index){

                        return Card(
                          child: ListTile(

                            title: Text("Name : ${name[index]}",style: TextStyle(fontSize: 18, color: Colors.black),),
                            subtitle: Text("Age : ${age[index]}"),
                            shape: RoundedRectangleBorder(),
                            leading: Icon(Icons.person),
                            trailing: Text("Salary : ${salary[index]}"),

                          ),
                        );

                      }),
                )
              ],
            ),
          ),
        )
    );
  }
}
