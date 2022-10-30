# Buffer Overflow Exploit
For now, the buffer overflow only works with the help of GDB (which we use for ignoring the SIGSEGV signals)

## Usage:
First, clone the project (THE DIRECTORY IS IMPORTANT FOR CALCULATING THE RETURN VALUE, SO PLEASE, FOLLOW THIS INSTRUCTIONS):

```bash
    $ cd /home/user # the username is important, for now only "user" is allowed
    $ git clone git@github.com:Pablito2020/bufferoverflow-exploit.git practica
    $ cd practica
```

Then, install the binaries and disable some stack protections:
```bash
    $ sudo make install
```

Finally, run the exploit:
```bash
    $ ./exploit.sh
```

## Limitations:
Since we are using GDB for ignoring the SIGSEGV signals, we can't scalate privileges from user to root. The solution is to implement ourselves a version of the exploit which ignores this signals and continues the instructions flow.
