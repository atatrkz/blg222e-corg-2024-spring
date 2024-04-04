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
    reg [1:0] FunSel;
    reg [15:0] A;
    reg E;
    reg clk;
    
    wire [15:0] O;
    
    Register uut(A,E,FunSel,clk,O);
    always #5 clk = ~clk;
    
    initial begin
    
            clk = 0;
            E = 0;
            A = 16'b0000000000000001;
            
            #100;
            E = 1;
            FunSel = 2'b01;
            
            #100;
            E = 1;
            FunSel = 2'b11;
            
            #100;
            A = 16'b0000000000100100;
            E = 1;
            FunSel = 2'b10;
    
            #100;
            E = 1;
            FunSel = 2'b00;
            
            #100;
            E = 1;
            FunSel = 2'b01;
    
            
        end
endmodule
