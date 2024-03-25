### Step 1

In this step your goal is to write a simple version of wc, let’s call it ccwc (cc for Coding Challenges) 
that takes the command line option `-c` and outputs the number of bytes in a file.

If you’ve done it right your output should match this:

```shell
>ccwc -c test.txt
342190 test.txt
```

```mermaid
---
title: Sequence diagram
---
sequenceDiagram
autonumber
actor user
participant program as wc
participant os as OS

user ->> program: -c 
Note over program: test.txt
activate program

program ->> os: read file test.txt
os -->> program: file handle

program -->> user: number of bytes
deactivate program
```

```mermaid
---
title: UML
---
classDiagram
    class Option {
        <<Enumeration>>
        NUM_OF_BYTES
        
        +String key
    }
    
    class CommandLine {
        
        +List~Option~ options
        +File file
    }
    
    class CommandLineExecutor {

        +execute(CommandLine commandLine)
    }
```