import 'package:material_ui/material_ui.dart';
//STATIC : this is main class to run app 
void main() {
  runApp(const MyApp());
}
//STATIC : this is root class
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
// STATIC : HOME SCREEN 
class MyHomescreen extends StatefulWidget {
  const MyHomescreen({super.key});

  @override
  State<MyHomescreen> createState() => _MyHomescreenState();
}

class _MyHomescreenState extends State<MyHomescreen> {

        @override
  Widget build(BuildContext context) {

    // LOGIC : the data. A list of Maps with keys: subject, hours, done.
      final List<Map<String, dynamic>> goals = [
    {'subject': 'learn flutter', 'hours': 8, 'done': false},
    {'subject': 'learn python', 'hours': 6, 'done': false},
    {'subject': 'learn new skills of flutter', 'hours': 4, 'done': true},
  ];

  // LOGIC : sample subjects used by the + button (until the form in Phase 4).
  final List<String> sampleSubjects = [
    'learn dart',
    'learn databases',
    'learn git',
    'learn UI design',
  ];
  int sampleCounter = 0;

  // LOGIC : add a sample goal to the list.
  void addSampleGoal() {
    setState(() {
      goals.add({
        'subject': sampleSubjects[sampleCounter % sampleSubjects.length],
        'hours': 2 + sampleCounter,
        'done': false,
      });
      sampleCounter++;
    });
  }

  // LOGIC : flip the done value of the goal at this position.
  void toggleGoal(int index) {
    setState(() {
      goals[index]['done'] = !goals[index]['done'];
    });
  }

  // LOGIC : remove the goal at this position.
  void deleteGoal(int index) {
    setState(() {
      goals.removeAt(index);
    });
  }

    return Scaffold(
            appBar: AppBar(
        title: const Text('My Study Planner'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      // STATIC : heading texts + the list area.
      body:  Column(
          children: [
                  const Text(
            'Welcome to My Study Planner!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B1B1F),
            ),
          ),

          const Text(
            'well arranged study goals better improve',
            style: TextStyle(fontSize: 15, color: Colors.black54),
          ),

          const SizedBox(height: 8),

            // STATIC : scrollable list built from the data (no more hard-coded cards).
          Expanded(
            child: ListView.builder(
              // CONNECTION 1 : UI reads LOGIC data (the goals list).
              itemCount: goals.length,
              itemBuilder: (context, index) {
                final goal = goals[index];
                final bool done = goal['done'];

                // STATIC : one goal card (same style as Phase 1).
                return Card(
                  borderOnForeground: true,
                  shadowColor: Colors.indigoAccent,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(4),
                    side: const BorderSide(
                      color: Colors.indigoAccent,
                      width: 2,
                    ),
                  ),
                  elevation: 5,
                  child: ListTile(
                    // CONNECTION 2 : UI events call LOGIC functions.
                    onTap: () => toggleGoal(index),
                    leading: Checkbox(
                      value: done,
                      onChanged: (_) => toggleGoal(index),
                    ),
                    title: Text(
                      goal['subject'],
                      style: TextStyle(
                        decoration: done ? TextDecoration.lineThrough : null,
                        color: done ? Colors.grey : null,
                      ),
                    ),
                    subtitle: Text('${goal['hours']} hours'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteGoal(index),
                    ),
                  ),
                );
              },
            ),
          ),
        

          ],
        
        ),

           // STATIC : button now adds a sample goal.
      floatingActionButton: FloatingActionButton(
        onPressed: addSampleGoal, // CONNECTION 2 : UI event calls LOGIC.
        backgroundColor: const Color.fromARGB(255, 105, 179, 171),
        child: const Icon(Icons.add, color: Colors.white70),
      ),

        
      
    );
  }

}