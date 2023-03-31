# QA-RobotFramework-DareIT

## Project Overview:

This project aims to demonstrate how to use the Robot Framework for testing purposes.
It includes examples of how to create test cases, test suites, and how to run them using the Robot Framework. 
The project is specifically designed for the DareIT QA course.
This documentation aims to provide a detailed overview of the project, its features, and how to use it.

## Getting Started:

Before you start working with this project, you need to make sure you have the following software installed on your machine:

Python (version 3.6 or later)
Robot Framework (version 4.1 or later)
Selenium Library (version 4.0 or later)
ChromeDriver (latest version)
Once you have all the necessary software installed, you can clone the repository from GitHub using the following command:

```bash
git clone https://github.com/aldoushux503/QA-RobotFramework-DareIT.git
```

## Writing Test Cases:

The test cases are written in the Robot Framework's syntax. You can create a new test case by creating a new file in the tests directory with the .robot extension. Each test case should have a descriptive name that explains what the test is doing.

The test cases are composed of keywords that perform actions on the system being tested.

## Running Test Suites:

You can run the test suites using the Robot Framework CLI. To run a test suite, navigate to the project directory and run the following command:

```
robot -d results tests_robotframework/
```
This command will run all the test cases in the tests directory and store the results in the results directory.
