proc pause {{message "\nHit Enter to continue ==> "}} {
    puts -nonewline $message
    flush stdout
    gets stdin
}

try {
    vsim -c -quiet work.adder_true_testbench
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
    vsim -c -quiet work.fa_true_testbench
    add wave *
    run -all
} on error {msg} {
    puts "SIMULATION FAILED"
    puts $msg
    set retry 1
    quit -sim
    puts "\n----------------------RETRY STUDENT SIMULATION-------------------------"
}