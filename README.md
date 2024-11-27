# EN.525.742_lab6
## JHU F24 FPGA SoC Design Lab 6 - Radio Periphreal IP Core with Linux

### Instructions
Update the install path to your xilinx version in the make_project.bat file and execute to create project. 
Alternitively, open Vivado, and in the TCL Console, navitgate to the tcl folder and type `source make_project.tcl` to generatee the porject and output files.
Then, output .bit.bin file will be stored in the fpga_files directory for use on the Zybo Z7 board. 

SCP source_files/linux_sw to the Zybo Z7 with linux. 
Open permissions on all files using `chmod 777  ./*` in the directory with the copied files
Type `fpgautil -b lab6_top.bit.bin` to program the FPGA bitfile. The green done light should illuminate on the FPGA.
Type `gcc jesson_test_radio.c -o radio_test` to compile the C Program.
Then type `./radio_test` to run the test program
