`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Ata Türköz
// Student ID: 150180011 
// 
// Create Date: 04.04.2024
// Module Name: 16_bit_d_flip_flop
// Project Name: Project 1
//
// Description: This module is a d flip-flop that is created to be used in the 16-bit register
//////////////////////////////////////////////////////////////////////////////////



module Register (I,E,FunSel,Clock,Q);
    input [15:0] I;
    input E;
    input [2:0] FunSel;
    input Clock;
    output [15:0] Q;
   
    wire [15:0] IS;
    wire [15:0] D;
    wire [15:0] LHO;
    wire [15:0] MUXO;
    wire [15:0] O;
    
    b16_MUX_4x1 MUXA(16'h0000, I, IS, IS, FunSel, D);
    l_or_h LH(O, I, FunSel, LHO);
    b8_MUX_2x1 MUXB(D, LHO, FunSel[2], MUXO);
    
   
    
    d_flip_flop DFF(MUXO, E, Clock, O);
    
    assign Q = O;
    
    bn_add_sub addsub(O, FunSel[0], IS);
    
endmodule

module d_flip_flop(D,E,clk,Q);
    input [15:0]D;
    input E;
    input clk;
    output reg [15:0]Q;
    
    always @(posedge clk)
    begin
        if(E == 1)
            Q <= D;
    end
endmodule

module b16_MUX_4x1(D0,D1,D2,D3,S0,Q);
    input wire [15:0]D0;
    input wire [15:0]D1;
    input wire [15:0]D2;
    input wire [15:0]D3;
    input wire [1:0]S0;
    output reg [15:0]Q;
    
    always @(D0 or D1 or D2 or D3 or S0)
    begin
        if(S0 == 2'b00)
            Q = D0;
        else if(S0 == 2'b01)
            Q = D1;
        else if(S0 == 2'b10)
            Q = D2;
        else if(S0 == 2'b11)
            Q = D3;
    end            
            
endmodule

module bn_add_sub (A,incordec,O);
    input [15:0] A;
    input incordec;
    output reg [15:0] O;
    
always @(*) begin
    if (incordec == 1) begin
        O = A + 1;
    end else begin
        O = A - 1;
    end
end
endmodule

module l_or_h (A, inp, S0, O);
    input [15:0] A;
    input [15:0] inp;
    input [2:0] S0;
    output reg [15:0] O;
    
always @(inp or S0 or A)
        begin
            if(S0 == 3'b100)
                O = {8'h00, inp[7:0]};
            else if(S0 == 3'b101)
                O = {A[15:8], inp[7:0]};
            else if(S0 == 3'b110)
                O = {inp[15:8], A[7:0]};
            else if(S0 == 3'b111)
                O = {{8{inp[7]}}, inp[7:0]};
        end            
                
    endmodule
    
module b8_MUX_2x1(D0,D1,S0,Q);
        input wire [16:0]D0;
        input wire [16:0]D1;
        input wire S0;
        output reg [16:0]Q;
        
        always @(D0 or D1 or S0)
        begin
            if(S0 == 0)
                Q = D0;
            else if(S0 == 1)
                Q = D1;
        end            
                
    endmodule