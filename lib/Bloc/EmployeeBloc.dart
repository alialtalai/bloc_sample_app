// TODO: imports
// TODO: List of employee
// TODO: Stream controllers
// TODO: Stream Sink getter
// TODO: Constructor - add data; listen to change
// TODO: Core functions
// TODO: dispose
///-------------------------------
import 'dart:async';
import 'package:bloc_sample_app/Model/Employee.dart';
// end TODO- imports

class EmployeeBloc{
  List<Employee> _employeeList =[
    Employee(id: 1, name: 'Employee 1', salary: 1000.0),
    Employee(id: 2, name: 'Employee 2', salary: 2000.0),
    Employee(id: 3, name: 'Employee 3', salary: 3000.0),
    Employee(id: 4, name: 'Employee 4', salary: 4000.0),
    Employee(id: 5, name: 'Employee 5', salary: 5000.0)
  ];
// end TODO- List of employee

final _employeeListStreamController = StreamController<List<Employee>>();

// for increment
final _employeeSalaryIncrementStreamController=StreamController<Employee>();
// for decrement
final _employeeSalaryDecrementStreamController=StreamController<Employee>();
// end TODO - Stream Controller

// getter
  // for output
Stream<List<Employee>> get employeeListStream => _employeeListStreamController.stream;
  // for input
StreamSink<List<Employee>> get employeeListSink =>_employeeListStreamController.sink;

StreamSink<Employee> get employeeSalaryIncrement => _employeeSalaryIncrementStreamController.sink;
StreamSink<Employee> get employeeSalaryDecrement => _employeeSalaryDecrementStreamController.sink;
// end TODO: Stream Sink getter

EmployeeBloc(){
  _employeeListStreamController.add(_employeeList);
  _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
  _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
}
// end TODO: Constructor - add data; listen to change

  _incrementSalary(Employee employee){
    double salary= employee.salary;
    double incrementedSalary = salary * 20/100;

    _employeeList[employee.id -1].salary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee){
    double salary= employee.salary;
    double decrementedSalary = salary * 20/100;

    _employeeList[employee.id -1].salary = salary - decrementedSalary;
    employeeListSink.add(_employeeList);
  }
  // end TODO: Core functions

  void dispose(){
   _employeeSalaryIncrementStreamController.close();
   _employeeSalaryDecrementStreamController.close();
   _employeeListStreamController.close();
  }

}
