# Build your own Shell

# Stage 1: Shell prompt

Program must print `$ ` and wait for input (it should not exit after printing the prompt).

# Stage 2: Missing commands

Program must read input and print `<command>: Command not found.` if the command is not found.

We won't test whether the prompt is printed again, we'll just check if `<command>: Command not found.` is printed to stdout.

# Stage 3: REPL

Now that a user has implemented the response for one command (the "unknown command" response), we
can get to implementing a REPL.

Send one command, assert `<command>: Command not found.` is printed to stdout. Send another command, assert `<command>: Command not found.` is printed to stdout. Repeat this process 3-5 (random) times. The program should not exit after the last command is sent.

# Stage 4: The exit built-in

When exit is received as a command, the program should exit with code 0.

# Stage 5: The echo built-in

When echo is received as a command, the program should print the rest of the line to stdout.

# Stage 6: Executing a program

An absolute path to a program is received as a command. The program should be executed with the arguments provided.

# Stage 7: Program arguments

An absolute path to a program is received as a command, followed by arguments. The program should be executed with the arguments provided.

# Stage 8: Quoted program arguments

An absolute path to a program is received as a command, followed by quoted arguments. The program should be executed with the arguments provided.

# Stage 9: Reading PATH with a single entry

A single `PATH` entry is provided, followed by a relative path to a program. The program should be executed.

# Stage 10: Reading PATH with multiple entries

A `PATH` is provided with multiple entries, followed by a relative path to a program. The program should be executed.

# Stage 11: The cd built-in (1/1)

When cd is received as a command, the program should change the current working directory.

# Stage 12: The cd built-in (2/2)
