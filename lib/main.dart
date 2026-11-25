import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Study Planner',
      theme: ThemeData(),
      home: const MyHomescreen(),
    );
  }
}

class MyHomescreen extends StatelessWidget {
  const MyHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Study Planner'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              
               const Text(
              'Welcome to My Study Planner!',
              style: TextStyle( fontSize: 24,fontWeight: FontWeight.bold, color: Color(0xFF1B1B1F), ),
            ),
             
            const Text(
              'well arranged study goals better improve',
              style: TextStyle(fontSize: 15, color: Colors.black54),),


           const SizedBox(height: 5),

             
            Card(borderOnForeground: true, shadowColor: Colors.indigoAccent, 
              shape: BeveledRectangleBorder(borderRadius: BorderRadiusGeometry.circular(4),
               side: const BorderSide(
               color: Colors.indigoAccent,
               width: 2,  ),),
              elevation: 5,
              child:  ListTile(
                    
                    leading: const Icon(Icons.code),
                    title: const Text('learn flutter'),
                    subtitle: const Text('learn flutter to build mobile apps')
                  ),  
              ),

              
            Card( borderOnForeground: true, shadowColor: Colors.indigoAccent,
                shape: BeveledRectangleBorder(borderRadius: BorderRadiusGeometry.circular(4), side: const BorderSide(
                 color: Colors.indigoAccent,
                 width: 2,),),
                elevation: 5,
                child: ListTile(
                    leading: const Icon(Icons.engineering),
                    title: const Text('learn python'),
                    subtitle: const Text('learn python for data science and automation')
                  ),
            ) ,


             Card( borderOnForeground: true, shadowColor: Colors.indigoAccent,
                shape: BeveledRectangleBorder(borderRadius: BorderRadiusGeometry.circular(4), side: const BorderSide(
                  color: Colors.indigoAccent,
                  width: 2,),),
                elevation: 5,
                child:  ListTile(
                    leading: const Icon(Icons.menu_book),
                    title: const Text('learn new skills of flutter'),
                    subtitle: const Text('expand your knowledge of flutter development')
                  )
            ) 
          ]
        ),
      ),
       
      floatingActionButton: FloatingActionButton(onPressed: () {},
       child: const Icon(Icons.add, color: Colors.white70),
      backgroundColor: const Color.fromARGB(255, 105, 179, 171),    
       ),
       
    );
  }
  

}

