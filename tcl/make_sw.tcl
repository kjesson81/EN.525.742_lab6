
setws ../vitis
platform create -name hwplat -hw ../fpga_files/lab6_prj.xsa
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform write
platform active {hwplat}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick

platform active hwplat
app create -name lab6_app
importsources -name lab6_app -path ../source_files/proc_software/helloworld.c
app build lab6_app
sysproj build -name lab6_app_system