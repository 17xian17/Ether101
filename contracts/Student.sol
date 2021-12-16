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
    }

    mapping(string => StudentInfo) studentInfo;

    StudentInfo[] public students;

    function create(
      string memory _studentId,
      string memory _firstName,
      string memory _lastName,
      Course _course,
      Status _status
    ) public {

      StudentInfo memory student;
      student.studentId = _studentId;
      student.firstName = _firstName;
      student.lastName = _lastName;
      student.isPassed = false;
      student.course = _course;
      student.status = _status;

      students.push(student);

    }
}