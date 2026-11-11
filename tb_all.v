`timescale 1ns / 1ps

module tb_assignment3;

    // Standard 1-bit inputs
    reg a, b, cin, bin;
    reg [7:0] enc_in;
    reg [2:0] dec_in;

    // Outputs for Gates (sample AND & XOR)
    wire and_gl_y, and_df_y, and_beh_y;
    wire xor_gl_y, xor_df_y, xor_beh_y;

    // Full Adder Outputs
    wire fa_gl_s, fa_gl_c, fa_df_s, fa_df_c, fa_beh_s, fa_beh_c;

    // Full Subtractor Outputs
    wire fs_gl_d, fs_gl_b, fs_df_d, fs_df_b, fs_beh_d, fs_beh_b;

    // Comparator Outputs
    wire comp_eq, comp_gt, comp_lt;

    // Encoder / Decoder Outputs
    wire [2:0] enc_df_y, enc_beh_y;
    wire [7:0] dec_df_y, dec_beh_y;

    // Instantiate Modules
    and_gate_gl u_and_gl (.a(a), .b(b), .y(and_gl_y));
    and_gate_df u_and_df (.a(a), .b(b), .y(and_df_y));
    and_gate_beh u_and_beh (.a(a), .b(b), .y(and_beh_y));

    xor_gate_gl u_xor_gl (.a(a), .b(b), .y(xor_gl_y));
    xor_gate_df u_xor_df (.a(a), .b(b), .y(xor_df_y));
    xor_gate_beh u_xor_beh (.a(a), .b(b), .y(xor_beh_y));

    full_adder_gl u_fa_gl (.a(a), .b(b), .cin(cin), .sum(fa_gl_s), .cout(fa_gl_c));
    full_adder_df u_fa_df (.a(a), .b(b), .cin(cin), .sum(fa_df_s), .cout(fa_df_c));
    full_adder_beh u_fa_beh (.a(a), .b(b), .cin(cin), .sum(fa_beh_s), .cout(fa_beh_c));

    full_sub_gl u_fs_gl (.a(a), .b(b), .bin(bin), .diff(fs_gl_d), .bout(fs_gl_b));
    full_sub_df u_fs_df (.a(a), .b(b), .bin(bin), .diff(fs_df_d), .bout(fs_df_b));
    full_sub_beh u_fs_beh (.a(a), .b(b), .bin(bin), .diff(fs_beh_d), .bout(fs_beh_b));

    comparator_beh u_comp (.a(a), .b(b), .eq(comp_eq), .gt(comp_gt), .lt(comp_lt));

    encoder_beh u_enc (.d(enc_in), .y(enc_beh_y));
    decoder_beh u_dec (.a(dec_in), .y(dec_beh_y));

    initial begin
        $display("-------------------------------------------------------");
        $display("--- SIMULATION STARTED FOR ALL ASSIGNMENT 3 MODULES ---");
        $display("-------------------------------------------------------");

        // Test Gates & Adders
        a = 0; b = 0; cin = 0; bin = 0; #10;
        $display("Input: a=%b b=%b cin=%b | FA Sum=%b Cout=%b | FS Diff=%b Bout=%b | AND=%b XOR=%b",
                 a, b, cin, fa_beh_s, fa_beh_c, fs_beh_d, fs_beh_b, and_beh_y, xor_beh_y);

        a = 1; b = 0; cin = 1; bin = 1; #10;
        $display("Input: a=%b b=%b cin=%b | FA Sum=%b Cout=%b | FS Diff=%b Bout=%b | AND=%b XOR=%b",
                 a, b, cin, fa_beh_s, fa_beh_c, fs_beh_d, fs_beh_b, and_beh_y, xor_beh_y);

        a = 1; b = 1; cin = 1; bin = 0; #10;
        $display("Input: a=%b b=%b cin=%b | FA Sum=%b Cout=%b | FS Diff=%b Bout=%b | AND=%b XOR=%b",
                 a, b, cin, fa_beh_s, fa_beh_c, fs_beh_d, fs_beh_b, and_beh_y, xor_beh_y);

        // Test Comparator
        a = 1; b = 0; #10;
        $display("Comparator Input: a=%b b=%b -> EQ=%b GT=%b LT=%b", a, b, comp_eq, comp_gt, comp_lt);

        // Test Encoder & Decoder
        enc_in = 8'b00100000; dec_in = 3'b101; #10;
        $display("Encoder In: %b -> Out: %b | Decoder In: %b -> Out: %b", enc_in, enc_beh_y, dec_in, dec_beh_y);

        $display("-------------------------------------------------------");
        $finish;
    end
endmodule
