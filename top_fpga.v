module top_fpga (
    input  [7:0] sw,     // Slide switches on FPGA board
    output [7:0] led     // LEDs on FPGA board
);

    // Example 1: Full Adder driven by Switches 0, 1, 2 -> Output on LEDs 0, 1
    full_adder_df u_fa (
        .a(sw[0]),
        .b(sw[1]),
        .cin(sw[2]),
        .sum(led[0]),
        .cout(led[1])
    );

    // Example 2: Priority Encoder driven by Switches 0 to 7 -> Output on LEDs 7, 6, 5
    encoder_beh u_enc (
        .d(sw),
        .y(led[7:5])
    );

endmodule
