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

// STATIC :ONE reusable StatelessWidget for the cards and use it three times
class SummaryCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;
  const SummaryCard({ super.key, required this.label, required this.value,required this.icon, required this.color, });

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      shadowColor: Colors.indigoAccent,
      shape: BeveledRectangleBorder( borderRadius: BorderRadiusGeometry.circular(4), side: const BorderSide(color: Colors.indigoAccent, width: 2),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text( value,
              style: TextStyle(fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 2),
            Text( label,textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
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
  // LOGIC : the data. A list of Maps with keys: subject, hours, done.
  final List<Map<String, dynamic>> goals = [
    {'subject': 'learn flutter', 'hours': 8, 'done': false},
    {'subject': 'learn python', 'hours': 6, 'done': false},
    {'subject': 'learn new skills of flutter', 'hours': 4, 'done': true},
  ];

  // STATIC : sample subjects used by the + button 
  final List<String> sampleSubjects = [
    'learn dart',
    'learn databases',
    'learn git',
    'learn UI design',
  ];
  
  int sampleCounter = 0;

  // STATIC : total planned hours. fold() starts at 0 and adds each goal's hours.
  // STATIC : number of completed goals. where() keeps only the done goals.
 //  STATIC : number of goals still to do


  int get totalHours => goals.fold<int>(0, (sum, goal) => sum + (goal['hours'] as int));
  int get completedCount => goals.where((goal) => goal['done'] == true).length;
  int get remainingCount => goals.length - completedCount;

  // STATIC  : add a sample goal to the list.
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

  // STATIC  : flip the done value of the goal at this position.
  void toggleGoal(int index) {
    setState(() {
      goals[index]['done'] = !goals[index]['done'];
    });
  }

  // STATIC : remove the goal at this position.
  void deleteGoal(int index) {
    setState(() {
      goals.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Study Planner'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      // STATIC : heading texts + summary row + the list area.
      body: Column(
        children: [
          const Text( 'Welcome to My Study Planner!', style: TextStyle( fontSize: 24,  fontWeight: FontWeight.bold,color: Color(0xFF1B1B1F),), ),
          const Text( 'well arranged study goals better improve', style: TextStyle(fontSize: 15, color: Colors.black54),),

          const SizedBox(height: 5),

          // STATIC : summary row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row( 
               children: [


                  Expanded(child: SummaryCard(label: 'TOTAL HOURS', value: '$totalHours', icon: Icons.schedule, color: const Color.fromARGB(255, 3, 18, 100))),
                  Expanded(child: SummaryCard(label: 'COMPLETED', value: '$completedCount', icon: Icons.check, color: const Color.fromARGB(255, 2, 105, 6))),
                  Expanded(child: SummaryCard(label: 'Remaining', value: '$remainingCount', icon: Icons.pending, color: const Color.fromARGB(255, 146, 89, 3)))
               
              ],
            ),
          ),

          const SizedBox(height: 15),

          // STATIC : empty message OR the scrollable list.
          Expanded(
            child: goals.isEmpty
                ?
                  
                  const Center(
                    child: Text( 'No goals yet.\nTap + to add your first study goal!', textAlign: TextAlign.center,style: TextStyle(fontSize: 16, color: Colors.grey), ),
                  )
                :
                 ListView.builder(
                    
                    itemCount: goals.length,
                    itemBuilder: (context, index) {
                      final goal = goals[index];
                      final bool done = goal['done'];

                      // STATIC : one goal card 
                      return Card(
                        borderOnForeground: true, shadowColor: Colors.indigoAccent,
                        shape: BeveledRectangleBorder( borderRadius: BorderRadiusGeometry.circular(4),
                          side: const BorderSide( color: Colors.indigoAccent, width: 2, ),
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
                              decoration: done
                                  ? TextDecoration.lineThrough : null,
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

      // STATIC : button adds a sample goal.
      floatingActionButton: FloatingActionButton(
        onPressed: addSampleGoal, // CONNECTION 2 : UI event calls LOGIC.
         backgroundColor: const Color.fromARGB(255, 105, 179, 171),
        child: const Icon(Icons.add, color: Colors.white70),
      ),
    );
  }
}
