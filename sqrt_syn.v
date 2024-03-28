/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Mon Jan 30 16:48:56 2023
/////////////////////////////////////////////////////////////


module sqrt_controller ( start, finish, clk, clear, ready, load_data, 
        incr_delta, find_next_sq );
  input start, finish, clk, clear;
  output ready, load_data, incr_delta, find_next_sq;
  wire   n1, n2, n3, n4, n6;
  wire   [1:0] state;
  wire   [1:0] next_state;

  DFFARX1 \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .RSTB(n6), .Q(
        state[0]), .QN(n1) );
  DFFARX1 \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .RSTB(n6), .Q(
        state[1]) );
  AO21X1 U3 ( .IN1(state[1]), .IN2(n2), .IN3(state[0]), .Q(next_state[1]) );
  NAND2X0 U4 ( .IN1(n3), .IN2(n4), .QN(next_state[0]) );
  INVX0 U5 ( .INP(n3), .ZN(find_next_sq) );
  NAND3X0 U6 ( .IN1(n2), .IN2(n1), .IN3(state[1]), .QN(n3) );
  INVX0 U7 ( .INP(finish), .ZN(n2) );
  INVX0 U8 ( .INP(clear), .ZN(n6) );
  INVX0 U9 ( .INP(n4), .ZN(load_data) );
  NAND2X0 U10 ( .IN1(start), .IN2(ready), .QN(n4) );
  NOR2X0 U11 ( .IN1(state[0]), .IN2(state[1]), .QN(ready) );
  AND2X1 U12 ( .IN1(state[1]), .IN2(state[0]), .Q(incr_delta) );
endmodule


module sqrt_data_path_DW01_add_0 ( A, B, CI, SUM, CO );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [6:1] carry;

  FADDX1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  FADDX1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  FADDX1 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  FADDX1 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  NAND2X1 U1 ( .IN1(carry[5]), .IN2(A[5]), .QN(n2) );
  AND2X1 U2 ( .IN1(B[0]), .IN2(A[0]), .Q(n1) );
  XNOR2X1 U3 ( .IN1(n2), .IN2(A[6]), .Q(SUM[6]) );
  XOR2X1 U4 ( .IN1(carry[5]), .IN2(A[5]), .Q(SUM[5]) );
  XOR2X1 U5 ( .IN1(B[0]), .IN2(A[0]), .Q(SUM[0]) );
endmodule


module sqrt_data_path ( num, load_data, incr_delta, find_next_sq, clk, finish, 
        result );
  input [6:0] num;
  output [3:0] result;
  input load_data, incr_delta, find_next_sq, clk;
  output finish;
  wire   N4, N5, N6, N7, N8, N9, N10, N17, N35, N36, N37, N38, N39, N41, N42,
         N43, N44, N45, N46, N47, N56, N57, N58, N59, N60, N61, N62, N63, N80,
         N82, N84, N86, N88, N90, n1, n2, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52;

  DFFX1 \Rdata_reg[6]  ( .D(N4), .CLK(clk), .QN(n43) );
  DFFX1 \Rdata_reg[5]  ( .D(N5), .CLK(clk), .QN(n42) );
  DFFX1 \Rdata_reg[4]  ( .D(N6), .CLK(clk), .QN(n41) );
  DFFX1 \Rdata_reg[3]  ( .D(N7), .CLK(clk), .QN(n40) );
  DFFX1 \Rdata_reg[2]  ( .D(N8), .CLK(clk), .QN(n39) );
  DFFX1 \Rdata_reg[1]  ( .D(N9), .CLK(clk), .QN(n38) );
  DFFX1 \Rdata_reg[0]  ( .D(N10), .CLK(clk), .QN(n44) );
  DFFX1 \Rdelta_reg[0]  ( .D(N39), .CLK(clk), .QN(n46) );
  DFFX1 \Rdelta_reg[1]  ( .D(N38), .CLK(clk), .Q(result[0]) );
  DFFX1 \Rdelta_reg[2]  ( .D(N37), .CLK(clk), .Q(result[1]) );
  DFFX1 \Rdelta_reg[3]  ( .D(N36), .CLK(clk), .Q(result[2]) );
  DFFX1 \Rn_reg[0]  ( .D(N62), .CLK(clk), .QN(n45) );
  DFFX1 \Rn_reg[1]  ( .D(N61), .CLK(clk), .Q(n47) );
  DFFX1 \Rn_reg[2]  ( .D(N60), .CLK(clk), .Q(n48) );
  DFFX1 \Rn_reg[3]  ( .D(N59), .CLK(clk), .Q(n49) );
  DFFX1 \Rn_reg[4]  ( .D(N58), .CLK(clk), .Q(n50) );
  DFFX1 \Rn_reg[5]  ( .D(N57), .CLK(clk), .Q(n51) );
  DFFX1 finish_reg ( .D(N63), .CLK(clk), .Q(finish) );
  DFFX1 \Rn_reg[6]  ( .D(N56), .CLK(clk), .Q(n52) );
  DFFX1 \Rdelta_reg[4]  ( .D(N35), .CLK(clk), .Q(result[3]) );
  sqrt_data_path_DW01_add_0 add_22_S2 ( .A({N80, N82, N84, N86, N88, N90, N17}), .B({1'b0, 1'b0, N35, N36, N37, N38, N39}), .CI(1'b0), .SUM({N47, N46, N45, 
        N44, N43, N42, N41}) );
  AND2X1 U3 ( .IN1(n1), .IN2(n47), .Q(N90) );
  INVX0 U4 ( .INP(n2), .ZN(N9) );
  AND2X1 U5 ( .IN1(n1), .IN2(n48), .Q(N88) );
  AND2X1 U6 ( .IN1(n1), .IN2(n49), .Q(N86) );
  AND2X1 U7 ( .IN1(n1), .IN2(n50), .Q(N84) );
  AND2X1 U9 ( .IN1(n1), .IN2(n51), .Q(N82) );
  AND2X1 U10 ( .IN1(n1), .IN2(n52), .Q(N80) );
  INVX0 U11 ( .INP(n4), .ZN(N8) );
  INVX0 U12 ( .INP(n5), .ZN(N7) );
  AO21X1 U13 ( .IN1(n6), .IN2(N56), .IN3(n7), .Q(N63) );
  OA221X1 U14 ( .IN1(N57), .IN2(n8), .IN3(N56), .IN4(n6), .IN5(n9), .Q(n7) );
  AO221X1 U15 ( .IN1(n8), .IN2(N57), .IN3(n10), .IN4(N58), .IN5(n11), .Q(n9)
         );
  OA221X1 U16 ( .IN1(N59), .IN2(n5), .IN3(N58), .IN4(n10), .IN5(n12), .Q(n11)
         );
  AO221X1 U17 ( .IN1(n5), .IN2(N59), .IN3(n4), .IN4(N60), .IN5(n13), .Q(n12)
         );
  OA222X1 U18 ( .IN1(N61), .IN2(n2), .IN3(n14), .IN4(n15), .IN5(N60), .IN6(n4), 
        .Q(n13) );
  AO21X1 U19 ( .IN1(n2), .IN2(N61), .IN3(N62), .Q(n15) );
  MUX21X1 U20 ( .IN1(n38), .IN2(n16), .S(load_data), .Q(n2) );
  INVX0 U21 ( .INP(num[1]), .ZN(n16) );
  MUX21X1 U22 ( .IN1(n39), .IN2(n17), .S(load_data), .Q(n4) );
  INVX0 U23 ( .INP(num[2]), .ZN(n17) );
  MUX21X1 U24 ( .IN1(n40), .IN2(n18), .S(load_data), .Q(n5) );
  INVX0 U25 ( .INP(num[3]), .ZN(n18) );
  INVX0 U26 ( .INP(n19), .ZN(N62) );
  MUX21X1 U27 ( .IN1(n20), .IN2(n45), .S(n21), .Q(n19) );
  NOR2X0 U28 ( .IN1(N41), .IN2(n22), .QN(n20) );
  INVX0 U29 ( .INP(find_next_sq), .ZN(n22) );
  AO22X1 U30 ( .IN1(find_next_sq), .IN2(N42), .IN3(n21), .IN4(n47), .Q(N61) );
  AO22X1 U31 ( .IN1(N43), .IN2(find_next_sq), .IN3(n21), .IN4(n48), .Q(N60) );
  INVX0 U32 ( .INP(n10), .ZN(N6) );
  MUX21X1 U33 ( .IN1(n41), .IN2(n23), .S(load_data), .Q(n10) );
  INVX0 U34 ( .INP(num[4]), .ZN(n23) );
  AO22X1 U35 ( .IN1(N44), .IN2(find_next_sq), .IN3(n21), .IN4(n49), .Q(N59) );
  AO22X1 U36 ( .IN1(N45), .IN2(find_next_sq), .IN3(n21), .IN4(n50), .Q(N58) );
  AO22X1 U37 ( .IN1(N46), .IN2(find_next_sq), .IN3(n21), .IN4(n51), .Q(N57) );
  AO22X1 U38 ( .IN1(N47), .IN2(find_next_sq), .IN3(n21), .IN4(n52), .Q(N56) );
  NOR2X0 U39 ( .IN1(find_next_sq), .IN2(load_data), .QN(n21) );
  INVX0 U40 ( .INP(n8), .ZN(N5) );
  MUX21X1 U41 ( .IN1(n42), .IN2(n24), .S(load_data), .Q(n8) );
  INVX0 U42 ( .INP(num[5]), .ZN(n24) );
  INVX0 U43 ( .INP(n6), .ZN(N4) );
  MUX21X1 U44 ( .IN1(n43), .IN2(n25), .S(load_data), .Q(n6) );
  INVX0 U45 ( .INP(num[6]), .ZN(n25) );
  NAND2X0 U46 ( .IN1(n46), .IN2(n1), .QN(N39) );
  MUX21X1 U47 ( .IN1(n26), .IN2(result[0]), .S(n27), .Q(N38) );
  NAND2X0 U48 ( .IN1(incr_delta), .IN2(n28), .QN(n26) );
  AO22X1 U49 ( .IN1(result[1]), .IN2(n27), .IN3(n29), .IN4(incr_delta), .Q(N37) );
  XNOR2X1 U50 ( .IN1(n30), .IN2(n28), .Q(n29) );
  NAND2X0 U51 ( .IN1(result[1]), .IN2(n1), .QN(n30) );
  AO22X1 U52 ( .IN1(result[2]), .IN2(n27), .IN3(incr_delta), .IN4(n31), .Q(N36) );
  XOR2X1 U53 ( .IN1(n32), .IN2(n33), .Q(n31) );
  AO22X1 U54 ( .IN1(result[3]), .IN2(n27), .IN3(incr_delta), .IN4(n34), .Q(N35) );
  XOR2X1 U55 ( .IN1(n35), .IN2(n36), .Q(n34) );
  NAND2X0 U56 ( .IN1(n33), .IN2(n32), .QN(n36) );
  AND3X1 U57 ( .IN1(n28), .IN2(n1), .IN3(result[1]), .Q(n32) );
  OR2X1 U58 ( .IN1(result[0]), .IN2(load_data), .Q(n28) );
  AND2X1 U59 ( .IN1(result[2]), .IN2(n1), .Q(n33) );
  NAND2X0 U60 ( .IN1(result[3]), .IN2(n1), .QN(n35) );
  NOR2X0 U61 ( .IN1(incr_delta), .IN2(load_data), .QN(n27) );
  NAND2X0 U62 ( .IN1(n45), .IN2(n1), .QN(N17) );
  INVX0 U63 ( .INP(load_data), .ZN(n1) );
  INVX0 U64 ( .INP(n14), .ZN(N10) );
  MUX21X1 U65 ( .IN1(n44), .IN2(n37), .S(load_data), .Q(n14) );
  INVX0 U66 ( .INP(num[0]), .ZN(n37) );
endmodule


module sqrt_Top ( start, clk, clear, num, ready, result );
  input [6:0] num;
  output [3:0] result;
  input start, clk, clear;
  output ready;
  wire   finish, load_data, incr_delta, find_next_sq;

  sqrt_controller m1 ( .start(start), .finish(finish), .clk(clk), .clear(clear), .ready(ready), .load_data(load_data), .incr_delta(incr_delta), 
        .find_next_sq(find_next_sq) );
  sqrt_data_path m2 ( .num(num), .load_data(load_data), .incr_delta(incr_delta), .find_next_sq(find_next_sq), .clk(clk), .finish(finish), .result(result) );
endmodule

