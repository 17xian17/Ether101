// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

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
        string studentId;
        string firstName;
        string lastName;
        bool isPassed;
        Course course;
        Status status;
        address sender;
    }

    mapping(address => StudentInfo) studentInfo;

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
      StudentInfo memory student;

      student.studentId = _studentId;
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

    function update(
      uint _index,
      string memory _studentId,
      string memory _firstName,
      string memory _lastName,
      Course _course,
      Status _status
    ) public returns (string memory){
      StudentInfo storage student = students[_index];

      student.studentId = _studentId;
      student.firstName = _firstName;
      student.lastName = _lastName;
      student.isPassed = false;
      student.course = _course;
      student.status = _status;
      student.sender = address(msg.sender);

      students.push(student);

      return _studentId;
    }

    function updateCourse(
      uint _index,
      Course _course
    ) public returns (string memory){
      StudentInfo storage student = students[_index];

      student.course = _course;
      student.sender = address(msg.sender);

      students.push(student);

      return student.studentId;
    }
}