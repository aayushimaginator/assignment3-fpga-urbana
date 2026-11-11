// ==========================================
// 1. LOGIC GATES (Gate-Level, Dataflow, Behavioral)
// ==========================================

// AND Gate
module and_gate_gl(input a, b, output y);
    and (y, a, b);
endmodule

module and_gate_df(input a, b, output y);
    assign y = a & b;
endmodule

module and_gate_beh(input a, b, output reg y);
    always @(*) y = a & b;
endmodule

// OR Gate
module or_gate_gl(input a, b, output y);
    or (y, a, b);
endmodule

module or_gate_df(input a, b, output y);
    assign y = a | b;
endmodule

module or_gate_beh(input a, b, output reg y);
    always @(*) y = a | b;
endmodule

// NOT Gate
module not_gate_gl(input a, output y);
    not (y, a);
endmodule

module not_gate_df(input a, output y);
    assign y = ~a;
endmodule

module not_gate_beh(input a, output reg y);
    always @(*) y = ~a;
endmodule

// NOR Gate
module nor_gate_gl(input a, b, output y);
    nor (y, a, b);
endmodule

module nor_gate_df(input a, b, output y);
    assign y = ~(a | b);
endmodule

module nor_gate_beh(input a, b, output reg y);
    always @(*) y = ~(a | b);
endmodule

// NAND Gate
module nand_gate_gl(input a, b, output y);
    nand (y, a, b);
endmodule

module nand_gate_df(input a, b, output y);
    assign y = ~(a & b);
endmodule

module nand_gate_beh(input a, b, output reg y);
    always @(*) y = ~(a & b);
endmodule

// XOR Gate
module xor_gate_gl(input a, b, output y);
    xor (y, a, b);
endmodule

module xor_gate_df(input a, b, output y);
    assign y = a ^ b;
endmodule

module xor_gate_beh(input a, b, output reg y);
    always @(*) y = a ^ b;
endmodule

// XNOR Gate
module xnor_gate_gl(input a, b, output y);
    xnor (y, a, b);
endmodule

module xnor_gate_df(input a, b, output y);
    assign y = ~(a ^ b);
endmodule

module xnor_gate_beh(input a, b, output reg y);
    always @(*) y = ~(a ^ b);
endmodule

// ==========================================
// 2. FULL ADDER
// ==========================================
module full_adder_gl(input a, b, cin, output sum, cout);
    wire s1, c1, c2;
    xor (s1, a, b);
    xor (sum, s1, cin);
    and (c1, a, b);
    and (c2, s1, cin);
    or  (cout, c1, c2);
endmodule

module full_adder_df(input a, b, cin, output sum, cout);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module full_adder_beh(input a, b, cin, output reg sum, cout);
    always @(*) begin
        sum  = a ^ b ^ cin;
        cout = (a & b) | (b & cin) | (a & cin);
    end
endmodule

// ==========================================
// 3. FULL SUBTRACTOR
// ==========================================
module full_sub_gl(input a, b, bin, output diff, bout);
    wire x1, na, t1, t2, t3;
    xor (x1, a, b);
    xor (diff, x1, bin);
    not (na, a);
    and (t1, na, b);
    and (t2, na, bin);
    and (t3, b, bin);
    or  (bout, t1, t2, t3);
endmodule

module full_sub_df(input a, b, bin, output diff, bout);
    assign diff = a ^ b ^ bin;
    assign bout = (~a & b) | (~a & bin) | (b & bin);
endmodule

module full_sub_beh(input a, b, bin, output reg diff, bout);
    always @(*) begin
        diff = a ^ b ^ bin;
        bout = (~a & b) | (~a & bin) | (b & bin);
    end
endmodule

// ==========================================
// 4. COMPARATOR (1-bit Magnitude)
// ==========================================
module comparator_gl(input a, b, output eq, gt, lt);
    xnor (eq, a, b);
    wire na, nb;
    not (na, a);
    not (nb, b);
    and (gt, a, nb);
    and (lt, na, b);
endmodule

module comparator_df(input a, b, output eq, gt, lt);
    assign eq = ~(a ^ b);
    assign gt = a & ~b;
    assign lt = ~a & b;
endmodule

module comparator_beh(input a, b, output reg eq, gt, lt);
    always @(*) begin
        eq = (a == b);
        gt = (a > b);
        lt = (a < b);
    end
endmodule

// ==========================================
// 5. ENCODER (8-to-3 Priority Encoder)
// ==========================================
module encoder_df(input [7:0] d, output [2:0] y);
    assign y = d[7] ? 3'b111 :
               d[6] ? 3'b110 :
               d[5] ? 3'b101 :
               d[4] ? 3'b100 :
               d[3] ? 3'b011 :
               d[2] ? 3'b010 :
               d[1] ? 3'b001 : 3'b000;
endmodule

module encoder_beh(input [7:0] d, output reg [2:0] y);
    always @(*) begin
        casez (d)
            8'b1???????: y = 3'b111;
            8'b01??????: y = 3'b110;
            8'b001?????: y = 3'b101;
            8'b0001????: y = 3'b100;
            8'b00001???: y = 3'b011;
            8'b000001??: y = 3'b010;
            8'b0000001?: y = 3'b001;
            8'b00000001: y = 3'b000;
            default:     y = 3'b000;
        endcase
    end
endmodule

// ==========================================
// 6. DECODER (3-to-8 Decoder)
// ==========================================
module decoder_df(input [2:0] a, output [7:0] y);
    assign y = (8'b1 << a);
endmodule

module decoder_beh(input [2:0] a, output reg [7:0] y);
    always @(*) begin
        y = 8'b0;
        y[a] = 1'b1;
    end
endmodule
