`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2024 12:23:22
// Design Name: 
// Module Name: Register_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Register_test();
    reg [2:0] FunSel;
    reg [15:0] A;
    reg E;
    reg clk;
    
    wire [15:0] O;
    
    Register uut(A,E,FunSel,clk,O);
    always #5 clk = ~clk;
    
    initial begin
    
            clk = 0;
            E = 0;
            A = 16'h0001;
            
            #50;
            E = 1;
            FunSel = 3'b001;
            
            #50;
            E = 1;
            FunSel = 3'b011;
            
            #50;
            A = 16'h0024;
            E = 1;
            FunSel = 3'b010;
    
            #50;
            E = 1;
            FunSel = 3'b000;
            
            #50;
            E = 1;
            FunSel = 3'b001;
            
            #50;
            A = 16'h2030;
            E = 1;
            FunSel = 3'b100;
            
            #50;
            A = 16'habcd;
            E = 1;
            FunSel = 3'b101;

            #50;
            A = 16'hffff;
            E = 1;
            FunSel = 3'b110;
            
            #50;
            A = 16'hb840;
            E = 1;
            FunSel = 3'b111;
            
        end
endmodule
