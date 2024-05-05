# GAGE-InGAGE
This repository includes some Verilog descriptions of hardware implementations of elements of GAGE-InGAGE cypher. Read more about it at http://gageingage.org/

To run these testers you may install Icarus Verilog simulator. It's guide provides all the required instructions, but still:
1. Run this program in your console (in cmd as you run all other programs with console input).
2. Using cmd go to the directory with all the files, type 'iverilog -o ./a.out Ler_tester.v' command (or any other *_tester.v).
3. Type 'vvp ./a.out' to see the results.

In fact the only purpose of these testers is to show that the schemes work properly (the are correct results in the output files).



About the files:

Qer.v - 4-2-bit s-block Q;

leader_generator.v - leader constant generator (generates 32 2-bit constants depending on the round);

HDL_flop - direct flipflop implementation;

increment.v - round number counter (the number of tests is defined in header.v).
