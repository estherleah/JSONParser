# JSON Parser
Validates JSON files according to the [ECMA-404 2013 JSON standard](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf) using the [JFlex Scanner](http://www.jflex.de/) and [CUP Parser](http://www2.cs.tum.edu/projects/cup/) generators.

### Prerequisites
* [Java SDK](http://www.oracle.com/technetwork/java/javase/overview/index.html)
* [Apache Ant](http://ant.apache.org/)

### Usage
1. Build using Apache Ant: `ant jar`
2. Run: `java -jar jar/Compiler.jar <input_file.json>`

### Testing
The files in the test_files directory can be used for testing and come from the official JSON website (http://www.json.org/JSON_checker).
