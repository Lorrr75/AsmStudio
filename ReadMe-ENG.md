This is an attempt to create an IDE for assembly programming (Masm32 is my favourite), which allows control over the code as close as possible to Visual Studio 2022. It will certainly have fewer options and will be created a little at a time. Implemented in x86 assembly in 32 bit version for the time being and later 64 bit (and later when they are).

I will try to keep the source code, and the executable, on GitHub; the remaining files from the assembly will be deleted (or at least most of them).

The a.bat file allows me to assemble and link everything without having to continuously rewrite the (somewhat verbose) syntax on the command line.

This was followed by a series of objectives to reach the end of the project:

- Goal 1: create a text editor allowing the creation of solutions and projects with various search options and also a code completion function and suggestion of already declared variables to simplify the writing of code especially in structures.
	
- 2nd goal: integrate masm32 and other assemblers to compile projects

- 3rd objective: create an internal assembler with Intel syntax to compile projects internally

- 4th goal: Simultaneously create a linker to create executable files

- Goal 5: Integrated debugger to bring the editor to full IDE status.

- 6th goal: update the assembler to create an OOP assembler (ok, I guess I went too far this time)....
