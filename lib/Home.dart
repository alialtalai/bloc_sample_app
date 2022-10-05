import 'package:flutter/material.dart';
import 'package:bloc_sample_app/Bloc/EmployeeBloc.dart';
import 'package:bloc_sample_app/Model/Employee.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final EmployeeBloc _employeeBloc = EmployeeBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empolyee sample app'),
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
          stream: _employeeBloc.employeeListStream,
          builder: (BuildContext context,AsyncSnapshot<List<Employee>> snapshot){
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index){
                  return Card(
                    elevation: 5.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text('${snapshot.data?[index].id}'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('${snapshot.data?[index].name}'),
                            ),
                            Container(
                              child: Text('${snapshot.data?[index].salary}'),
                            ),
                            IconButton(
                                onPressed: (){
                                  _employeeBloc.employeeSalaryIncrement.add(snapshot.data![index]);
                                }
                                , icon: Icon(Icons.thumb_up)),
                            IconButton(
                                onPressed: (){
                                  _employeeBloc.employeeSalaryDecrement.add(snapshot.data![index]);
                                }
                                , icon: Icon(Icons.thumb_down))
                          ],
                        )
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
