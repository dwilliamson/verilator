#!/usr/bin/env perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition

scenarios(simulator => 1);

top_filename("t/t_flag_main_top_name.v");

compile(
    verilator_flags => ["-Mdir $Self->{obj_dir}", "--exe", "--build", "--main"],
    verilator_flags2 => ["--top-module top", "--main-top-name -", "-DMAIN_TOP_NAME_EMPTY"],
    verilator_make_cmake => 0,
    verilator_make_gmake => 0,
    make_main => 0,
    );

execute(
    check_finished => 1,
    );

ok(1);
1;
