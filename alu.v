module ALU (
    input [3:0] a, b,
    input [2:0] select,
    output [4:0] add_result, sub_result,
    output [3:0] xor_result, and_result, or_result, invt_result
);

wire [4:0] add_temp;
wire [4:0] sub_temp;
wire [3:0] xor_temp, and_temp, or_temp, invt_temp;

assign add_temp = a + b;
assign sub_temp = a - b;
assign xor_temp = a ^ b;
assign and_temp = a & b;
assign or_temp = a | b;
assign invt_temp = ~a;

assign add_result = (select == 3'b000) & add_temp | (select != 3'b000) & 5'b0;
assign sub_result = (select == 3'b001) & sub_temp | (select != 3'b001) & 5'b0;
assign xor_result = (select == 3'b010) & xor_temp | (select != 3'b010) & 4'b0;
assign and_result = (select == 3'b011) & and_temp | (select != 3'b011) & 4'b0;
assign or_result = (select == 3'b100) & or_temp | (select != 3'b100) & 4'b0;
assign invt_result = (select == 3'b101) & invt_temp | (select != 3'b101) & 4'b0;

endmodule


module ALU_Testbench;

reg [3:0] a, b;
reg [2:0] select;
wire [4:0] add_result, sub_result;
wire [3:0] xor_result, and_result, or_result, invt_result;

ALU uut (
    .a(a),
    .b(b),
    .select(select),
    .add_result(add_result),
    .sub_result(sub_result),
    .xor_result(xor_result),
    .and_result(and_result),
    .or_result(or_result),
    .invt_result(invt_result)
);

initial begin
    $display("Testing ALU");
    a = 4'b1010;
    b = 4'b0011;
    
    select = 3'b000; // ADD
    #10 $display("ADD: %b", add_result);
    
    select = 3'b001; // SUB
    #10 $display("SUB: %b", sub_result);
    
    select = 3'b010; // XOR
    #10 $display("XOR: %b", xor_result);
    
    select = 3'b011; // AND
    #10 $display("AND: %b", and_result);
    
    select = 3'b100; // OR
    #10 $display("OR: %b", or_result);
    
    select = 3'b101; // INVT
    #10 $display("INVT: %b", invt_result);
    
    $finish;
end

endmodule
