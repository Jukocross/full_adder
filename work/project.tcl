set projDir "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/Testing\ for\ FPGA/work/vivado"
set projName "Testing for FPGA"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/Testing\ for\ FPGA/work/verilog/au_top_0.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/Testing\ for\ FPGA/work/verilog/full_adder_1.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/Testing\ for\ FPGA/work/verilog/counter_2.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/Testing\ for\ FPGA/work/verilog/seq_plus_one_3.v" "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/Testing\ for\ FPGA/work/verilog/reset_conditioner_4.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/YK/Desktop/School/50.002\ Comp\ Struc/Alchitry/Testing\ for\ FPGA/work/constraint/custom.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
