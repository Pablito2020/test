# Buffer Overflow Exploit

## Usage:
First disable some protections that are enabled by default:

```bash
    $ sudo utils/enable-buffer.sh
```

Then, compile the program and the exploit (the sudo command is necessary because the owner of the program has to be 'root' and with u+s enabled) and execute gdb with some added steps:
```bash
    $ ./test.sh
```
Once you've executed this last command, you should insert the next instruction (ni) command inside gdb, until a shell appears.
