// SPDX-License-Identifier: MIT
pragma solidity >=0.4.17 <0.9.0;

contract Student {
    constructor() {}

    // Returns uint
    // BS_COMPUTER_ENGINEERING    - 0
    // BS_COMPUTER_SCIENCE        - 1
    // BS_INFORMATION_TECHNOLOGY  - 2
    enum Course {
        BS_COMPUTER_ENGINEERING,
        BS_COMPUTER_SCIENCE,
        BS_INFORMATION_TECHNOLOGY
    }

    // Returns uint
    // Pending  - 0
    // Accepted - 1
    // Rejected - 2
    // Canceled - 3
    enum Status {
        Pending,
        Accepted,
        Rejected,
        Canceled
    }

    struct StudentInfo {
        uint id;
        string studentId;
        string firstName;
        string lastName;
        bool isPassed;
        Course course;
        Status status;
        address sender;
    }

    mapping(string => StudentInfo) studentInfo;

    StudentInfo[] public students;

    event StudentEvent(
        string studentId,
        string firstName,
        string lastName,
        Course course,
        Status status
    );

    function create(
      string memory _studentId,
      string memory _firstName,
      string memory _lastName,
      Course _course,
      Status _status
    ) public returns (string memory){
      uint _id = students.length;
      _id++;

      StudentInfo memory student;

      student.id = _id;
      student.studentId = _studentId;
      student.firstName = _firstName;
      student.lastName = _lastName;
      student.isPassed = false;
      student.course = _course;
      student.status = _status;
      student.sender = address(msg.sender);

      students.push(student);
      // add to the mapping by  studentId
      studentInfo[_studentId] = student;

      emit StudentEvent(
        _studentId,
        _firstName,
        _lastName,
        _course,
        _status
      );

      return _studentId;
    }

    function update(
      string memory _studentId,
      string memory _firstName,
      string memory _lastName,
      Course _course,
      Status _status
    ) public 
    returns (string memory){
      StudentInfo storage student = studentInfo[_studentId];

      student.firstName = _firstName;
      student.lastName = _lastName;
      student.isPassed = false;
      student.course = _course;
      student.status = _status;
      student.sender = address(msg.sender);

      students.push(student);

      emit StudentEvent(
        _studentId,
        _firstName,
        _lastName,
        _course,
        _status
      );

      return _studentId;
    }

    function updateCourse(
      string memory _studentId,
      Course _course
    ) public 
    returns (string memory){
      StudentInfo storage student = studentInfo[_studentId];

      student.course = _course;
      student.sender = address(msg.sender);

      students.push(student);

      return student.studentId;
    }

    function getStudentInfoByStudentId(string memory _studentId)
      public view
      returns (
        string memory studentId,
        string memory firstName,
        string memory lastName,
        bool isPassed,
        Course course,
        Status status,
        address sender
      ) {
        StudentInfo memory student = studentInfo[_studentId];
        return (
          student.studentId,
          student.firstName,
          student.lastName,
          student.isPassed,
          student.course,
          student.status,
          student.sender
        );
      }

      function getStudentReturnStruct(string memory _studentId)
        public view 
        returns (StudentInfo memory) {
          return studentInfo[_studentId];
      }

      function allStudents() 
      public view 
      returns(StudentInfo[] memory) {
        return students;
    }
}