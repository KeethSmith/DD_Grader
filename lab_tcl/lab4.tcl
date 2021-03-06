proc pause {{message "\nHit Enter to continue ==> "}} {
    puts -nonewline $message
    flush stdout
    gets stdin
}


try {
    vsim -c -quiet work.clk_gen_true_testbench
    add wave *
    run -all
} on error {msg} {
    puts "SIMULATION FAILED"
    puts $msg
    set retry 1
    quit -sim
    puts "\n----------------------RETRY STUDENT SIMULATION-------------------------"
}

pause;

try {
    vsim -c -quiet work.gray_true_testbench
    add wave *
    run -all
} on error {msg} {
    puts "SIMULATION FAILED"
    puts $msg
    set retry 1
    quit -sim
    puts "\n----------------------RETRY STUDENT SIMULATION-------------------------"
}

pause; 


try {
    vsim -c -quiet work.counter_true_testbench
    add wave *
    run -all
} on error {msg} {
    puts "SIMULATION FAILED"
    puts $msg
    set retry 1
    quit -sim
    puts "\n----------------------RETRY STUDENT SIMULATION-------------------------"
}






