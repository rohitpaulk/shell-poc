# Build your own Shell

- [x] Stage 1: Shell prompt
- [x] Stage 2: Missing commands
- [x] Stage 3: REPL
- [x] Stage 4: The exit built-in
- [x] Stage 5: The echo built-in
- [x] Stage 6: The type built-in: built-ins (1/2)
- [x] Stage 7: The type built-in: executable files using PATH (2/2)
- [ ] Stage 8: Run a program

<!-- TODO: Confirm if pwd is the best way to go vs. using a  -->
- [ ] Extension 1, Stage 1: The pwd built-in
- [ ] Extension 1, Stage 2: The cd built-in: absolute paths
- [ ] Extension 1, Stage 3: The cd built-in: relative paths
- [ ] Extension 1, Stage 4: The cd built-in: reading HOME

# Stage 1: Shell prompt

Program must print `$ ` and wait for input (it should not exit after printing the prompt).

```bash
$ ./myshell
$
```

# Stage 2: Missing commands

Program must read input and print `<command>: Command not found.` if the command is not found.

We won't test whether the prompt is printed again, we'll just check if `<command>: Command not found.` is printed to stdout.

```bash
$ nonexistent
nonexistent: Command not found.
```

# Stage 3: REPL

Now that a user has implemented the response for one command (the "unknown command" response), we
can get to implementing a REPL.

Send one command, assert `<command>: Command not found.` is printed to stdout. Send another command, assert `<command>: Command not found.` is printed to stdout. Repeat this process 3-5 (random) times. The program should not exit after the last command is sent.

```bash
$ ./myshell
$ nonexistent_1
nonexistent_1: Command not found.
$ nonexistent_2
nonexistent_2: Command not found.
$ nonexistent_3
nonexistent_3: Command not found.
```

# Stage 4: The exit built-in

When exit is received as a command, the program should exit with code 0. We'll issue two regular commands first, then invoke exit

```bash
$ nonexistent_1
nonexistent_1: Command not found.
$ nonexistent_2
nonexistent_2: Command not found.
$ exit
```

# Stage 5: The echo built-in

When echo is received as a command, the program should print the rest of the line to stdout.

```bash
$ echo hello
hello
$ echo world
world
$ echo hello world
hello world
```

Note: echo can also be a binary, so we should prevent shelling out to it.

# Stage 6: The type built-in: built-ins (1/3)

The `type` command should be implemented as a built-in.

`type echo` should print `echo is a shell built-in`.
`type type` should print `type is a shell built-in`.
`type nonexistent` should print `nonexistent: Command not found.`

```bash
$ type echo
echo is a shell built-in
$ type exit
exit is a shell built-in
$ type type
type is a shell built-in
$ type nonexistent
nonexistent: Command not found.
```

# Stage 7: The type built-in: Executable files using PATH (2/3)

When a command is received, the program should search for the command in the `PATH` environment variable. If the command is found, the program should print the path to the command. If the command is not found, the program should print `nonexistent: Command not found.`.

```bash
Setting PATH to /usr/bin:/usr/local/bin
$ type ls
/usr/bin/ls
$ type abcd
/usr/local/bin/abcd
$ type missing
missing: Command not found.
```

# Stage 8: Run a program

A valid program is received as input. The program should be executed with the arguments provided.

```bash
$ mkdir -p /tmp/test1/test2
$ touch /tmp/test1/test2/testing
$ ls /tmp/test1/test2
testing
```

# Extension: Navigation

# Extension 1, Stage 1: The pwd built-in

When `pwd` is received as a command, the program should print the current working directory.

We've run into problems with changing the working directory in the past (the Git challenge has a lot of hacks around this), so let's always execute the user's program in the default directory. We can use `cd` (later stages) to change the working directory and _actually_ test this command.

# Extension 1, Stage 2: The cd built-in: absolute paths (1/3)

When cd is received with an absolute path to a directory that exists, it should change the current working directory. If the directory doesn't exist, it should say "no such file or directory". We'll test this using `pwd`.

```bash
$ cd /usr/local/bin
$ pwd
/usr/local/bin
$ cd /does_not_exist
cd: /does_not_exist: No such file or directory
```

# Extension 1, Stage 3: The cd built-in: relative paths (2/3)

When cd is received with a relative path, it should change the current working directory. Verify using `pwd`.

Note that most of this is implemented in the chdir system call, so we dont' have to
split this into `.`, `..` etc. - it should be handled implicitly

```bash
$ cd /usr
$ pwd
/usr
$ cd ./local/bin
$ pwd
/usr/local/bin
$ cd ../../
$ pwd
/usr
$ cd missing
cd: missing: No such file or directory
```

# Extension 1, Stage 4: The cd built-in: reading HOME (3/3)

When cd is received with `~`, it should change the current working directory to the user's home directory. Verify using `pwd`.

```bash
$ cd /usr/local/bin
$ pwd
/usr/local/bin
$ cd ~
$ pwd
/home/user
```
