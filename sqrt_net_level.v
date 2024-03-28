/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue Mar  7 20:38:58 2023
/////////////////////////////////////////////////////////////


module sqrt_controller_0 ( start, finish, clk, clear, ready, load_data, 
        incr_delta, find_next_sq );
  input start, finish, clk, clear;
  output ready, load_data, incr_delta, find_next_sq;
  wire   n2, n4, n6, n7, n8, n3, n5;
  wire   [1:0] state;
  wire   [1:0] next_state;

  DFFARX1 \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .RSTB(n5), .Q(
        state[0]), .QN(n4) );
  DFFARX1 \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .RSTB(n5), .Q(
        state[1]), .QN(n2) );
  AO21X1 U9 ( .IN1(state[1]), .IN2(n3), .IN3(state[0]), .Q(next_state[1]) );
  NAND3X0 U10 ( .IN1(n4), .IN2(n2), .IN3(start), .QN(n7) );
  AND2X1 U11 ( .IN1(start), .IN2(ready), .Q(load_data) );
  XOR2X1 U12 ( .IN1(state[1]), .IN2(state[0]), .Q(n8) );
  NAND3X0 U13 ( .IN1(n3), .IN2(n4), .IN3(state[1]), .QN(n6) );
  INVX0 U3 ( .INP(n6), .ZN(find_next_sq) );
  NOR2X0 U4 ( .IN1(n4), .IN2(n8), .QN(incr_delta) );
  NOR2X0 U5 ( .IN1(n8), .IN2(state[0]), .QN(ready) );
  NAND2X1 U6 ( .IN1(n6), .IN2(n7), .QN(next_state[0]) );
  INVX0 U7 ( .INP(finish), .ZN(n3) );
  INVX0 U8 ( .INP(clear), .ZN(n5) );
endmodule


module sqrt_data_path_0_DW01_add_0 ( A, B, CI, SUM, CO );
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
  FADDX1 U1_1 ( .A(A[1]), .B(B[1]), .CI(n2), .CO(carry[2]), .S(SUM[1]) );
  AND2X1 U1 ( .IN1(carry[5]), .IN2(A[5]), .Q(n1) );
  AND2X1 U2 ( .IN1(B[0]), .IN2(A[0]), .Q(n2) );
  XOR2X1 U3 ( .IN1(n1), .IN2(A[6]), .Q(SUM[6]) );
  XOR2X1 U4 ( .IN1(carry[5]), .IN2(A[5]), .Q(SUM[5]) );
  XOR2X1 U5 ( .IN1(B[0]), .IN2(A[0]), .Q(SUM[0]) );
endmodule


module sqrt_data_path_0 ( num, load_data, incr_delta, find_next_sq, clk, 
        finish, result );
  input [6:0] num;
  output [3:0] result;
  input load_data, incr_delta, find_next_sq, clk;
  output finish;
  wire   N4, N5, N6, N7, N8, N9, N10, N17, N21, N24, N25, N26, N27, N28, N35,
         N36, N37, N38, N39, N41, N42, N43, N44, N45, N46, N47, N56, N57, N58,
         N59, N60, N61, N62, N63, N80, N82, N84, N86, N88, N90, N94, N96, N98,
         n12, n13, n23, n24, n27, n28, n29, n30, n31, n32, n33,
         \add_21_S2/carry[4] , \add_21_S2/carry[3] , n1, n2, n4, n5, n6, n7,
         n8, n9, n10, n11, n14, n15, n16, n17, n18, n19, n20, n21, n22, n25,
         n26, n34, n35, n36, n37, n38, n39, n40;
  wire   [6:0] Rdata;

  DFFX1 \Rdata_reg[6]  ( .D(N4), .CLK(clk), .Q(Rdata[6]) );
  DFFX1 \Rdata_reg[5]  ( .D(N5), .CLK(clk), .Q(Rdata[5]) );
  DFFX1 \Rdata_reg[4]  ( .D(N6), .CLK(clk), .Q(Rdata[4]) );
  DFFX1 \Rdata_reg[3]  ( .D(N7), .CLK(clk), .Q(Rdata[3]) );
  DFFX1 \Rdata_reg[2]  ( .D(N8), .CLK(clk), .Q(Rdata[2]) );
  DFFX1 \Rdata_reg[1]  ( .D(N9), .CLK(clk), .Q(Rdata[1]) );
  DFFX1 \Rdata_reg[0]  ( .D(N10), .CLK(clk), .Q(Rdata[0]) );
  DFFX1 \Rdelta_reg[0]  ( .D(N39), .CLK(clk), .QN(n2) );
  DFFX1 \Rdelta_reg[1]  ( .D(N38), .CLK(clk), .Q(result[0]), .QN(n1) );
  DFFX1 \Rdelta_reg[2]  ( .D(N37), .CLK(clk), .Q(result[1]) );
  DFFX1 \Rdelta_reg[3]  ( .D(N36), .CLK(clk), .Q(result[2]) );
  DFFX1 \Rn_reg[0]  ( .D(N62), .CLK(clk), .QN(n4) );
  DFFX1 \Rn_reg[1]  ( .D(N61), .CLK(clk), .Q(n9), .QN(n33) );
  DFFX1 \Rn_reg[2]  ( .D(N60), .CLK(clk), .Q(n8), .QN(n32) );
  DFFX1 \Rn_reg[3]  ( .D(N59), .CLK(clk), .Q(n7), .QN(n31) );
  DFFX1 \Rn_reg[4]  ( .D(N58), .CLK(clk), .Q(n6), .QN(n30) );
  DFFX1 \Rn_reg[5]  ( .D(N57), .CLK(clk), .Q(n5), .QN(n29) );
  DFFX1 finish_reg ( .D(N63), .CLK(clk), .Q(finish) );
  DFFX1 \Rn_reg[6]  ( .D(N56), .CLK(clk), .Q(n10), .QN(n28) );
  DFFX1 \Rdelta_reg[4]  ( .D(N35), .CLK(clk), .Q(result[3]) );
  AND2X1 U3 ( .IN1(n40), .IN2(result[1]), .Q(N98) );
  AND2X1 U4 ( .IN1(n40), .IN2(result[2]), .Q(N96) );
  AND2X1 U5 ( .IN1(n40), .IN2(result[3]), .Q(N94) );
  AO22X1 U11 ( .IN1(num[1]), .IN2(load_data), .IN3(n40), .IN4(Rdata[1]), .Q(N9) );
  AO22X1 U17 ( .IN1(num[2]), .IN2(load_data), .IN3(n40), .IN4(Rdata[2]), .Q(N8) );
  AO22X1 U18 ( .IN1(num[3]), .IN2(load_data), .IN3(n40), .IN4(Rdata[3]), .Q(N7) );
  OAI22X1 U19 ( .IN1(n37), .IN2(n4), .IN3(n12), .IN4(n13), .QN(N62) );
  AO22X1 U23 ( .IN1(N42), .IN2(find_next_sq), .IN3(n12), .IN4(n9), .Q(N61) );
  AO22X1 U25 ( .IN1(N43), .IN2(find_next_sq), .IN3(n12), .IN4(n8), .Q(N60) );
  AO22X1 U27 ( .IN1(num[4]), .IN2(load_data), .IN3(n40), .IN4(Rdata[4]), .Q(N6) );
  AO22X1 U28 ( .IN1(N44), .IN2(find_next_sq), .IN3(n12), .IN4(n7), .Q(N59) );
  AO22X1 U30 ( .IN1(N45), .IN2(find_next_sq), .IN3(n12), .IN4(n6), .Q(N58) );
  AO22X1 U32 ( .IN1(N46), .IN2(find_next_sq), .IN3(n12), .IN4(n5), .Q(N57) );
  AO22X1 U34 ( .IN1(N47), .IN2(find_next_sq), .IN3(n12), .IN4(n10), .Q(N56) );
  AO22X1 U37 ( .IN1(num[5]), .IN2(load_data), .IN3(n40), .IN4(Rdata[5]), .Q(N5) );
  AO22X1 U38 ( .IN1(num[6]), .IN2(load_data), .IN3(n40), .IN4(Rdata[6]), .Q(N4) );
  OAI22X1 U39 ( .IN1(n39), .IN2(n2), .IN3(n23), .IN4(n24), .QN(N39) );
  OAI22X1 U41 ( .IN1(n39), .IN2(n1), .IN3(n23), .IN4(n27), .QN(N38) );
  AO22X1 U45 ( .IN1(N26), .IN2(incr_delta), .IN3(n23), .IN4(result[1]), .Q(N37) );
  AO22X1 U46 ( .IN1(N27), .IN2(incr_delta), .IN3(n23), .IN4(result[2]), .Q(N36) );
  AO22X1 U47 ( .IN1(N28), .IN2(incr_delta), .IN3(n23), .IN4(result[3]), .Q(N35) );
  AO22X1 U55 ( .IN1(num[0]), .IN2(load_data), .IN3(n40), .IN4(Rdata[0]), .Q(
        N10) );
  sqrt_data_path_0_DW01_add_0 add_22_S2 ( .A({N80, N82, N84, N86, N88, N90, 
        N17}), .B({1'b0, 1'b0, N35, N36, N37, N38, N39}), .CI(1'b0), .SUM({N47, 
        N46, N45, N44, N43, N42, N41}) );
  NOR2X0 U6 ( .IN1(n33), .IN2(load_data), .QN(N90) );
  INVX0 U7 ( .INP(n23), .ZN(n39) );
  INVX0 U9 ( .INP(load_data), .ZN(n40) );
  NOR2X0 U10 ( .IN1(incr_delta), .IN2(load_data), .QN(n23) );
  NAND2X1 U12 ( .IN1(n1), .IN2(n40), .QN(N21) );
  NAND2X1 U13 ( .IN1(n4), .IN2(n40), .QN(N17) );
  NOR2X0 U14 ( .IN1(N25), .IN2(n38), .QN(n27) );
  INVX0 U15 ( .INP(N21), .ZN(N25) );
  INVX0 U16 ( .INP(N7), .ZN(n21) );
  INVX0 U20 ( .INP(N8), .ZN(n20) );
  INVX0 U21 ( .INP(n12), .ZN(n37) );
  NOR2X0 U22 ( .IN1(N41), .IN2(n36), .QN(n13) );
  INVX0 U24 ( .INP(find_next_sq), .ZN(n36) );
  INVX0 U26 ( .INP(N61), .ZN(n34) );
  INVX0 U29 ( .INP(N4), .ZN(n26) );
  INVX0 U31 ( .INP(N60), .ZN(n35) );
  NOR2X0 U33 ( .IN1(find_next_sq), .IN2(load_data), .QN(n12) );
  INVX0 U35 ( .INP(incr_delta), .ZN(n38) );
  INVX0 U36 ( .INP(N5), .ZN(n25) );
  INVX0 U40 ( .INP(N6), .ZN(n22) );
  NOR2X0 U42 ( .IN1(n30), .IN2(load_data), .QN(N84) );
  NOR2X0 U43 ( .IN1(n32), .IN2(load_data), .QN(N88) );
  NOR2X0 U44 ( .IN1(n31), .IN2(load_data), .QN(N86) );
  NOR2X0 U48 ( .IN1(N24), .IN2(n38), .QN(n24) );
  NAND2X1 U49 ( .IN1(n2), .IN2(n40), .QN(N24) );
  NOR2X0 U50 ( .IN1(n28), .IN2(load_data), .QN(N80) );
  NOR2X0 U51 ( .IN1(n29), .IN2(load_data), .QN(N82) );
  XOR2X1 U52 ( .IN1(\add_21_S2/carry[4] ), .IN2(N94), .Q(N28) );
  AND2X1 U53 ( .IN1(N96), .IN2(\add_21_S2/carry[3] ), .Q(\add_21_S2/carry[4] )
         );
  XOR2X1 U54 ( .IN1(\add_21_S2/carry[3] ), .IN2(N96), .Q(N27) );
  AND2X1 U56 ( .IN1(N98), .IN2(N21), .Q(\add_21_S2/carry[3] ) );
  XOR2X1 U57 ( .IN1(N21), .IN2(N98), .Q(N26) );
  NOR2X0 U58 ( .IN1(N9), .IN2(n34), .QN(n11) );
  NOR2X0 U59 ( .IN1(N62), .IN2(n11), .QN(n14) );
  AOI222X1 U60 ( .IN1(N8), .IN2(n35), .IN3(n14), .IN4(N10), .IN5(N9), .IN6(n34), .QN(n15) );
  AO221X1 U61 ( .IN1(N60), .IN2(n20), .IN3(N59), .IN4(n21), .IN5(n15), .Q(n16)
         );
  OA221X1 U62 ( .IN1(N58), .IN2(n22), .IN3(N59), .IN4(n21), .IN5(n16), .Q(n17)
         );
  AO221X1 U63 ( .IN1(N58), .IN2(n22), .IN3(N57), .IN4(n25), .IN5(n17), .Q(n18)
         );
  OA221X1 U64 ( .IN1(N56), .IN2(n26), .IN3(N57), .IN4(n25), .IN5(n18), .Q(n19)
         );
  AO21X1 U65 ( .IN1(N56), .IN2(n26), .IN3(n19), .Q(N63) );
endmodule


module sqrt_Top ( start, clk, clear, num, ready, result );
  input [6:0] num;
  output [3:0] result;
  input start, clk, clear;
  output ready;
  wire   finish, load_data, incr_delta, find_next_sq;

  sqrt_controller_0 m1 ( .start(start), .finish(finish), .clk(clk), .clear(
        clear), .ready(ready), .load_data(load_data), .incr_delta(incr_delta), 
        .find_next_sq(find_next_sq) );
  sqrt_data_path_0 m2 ( .num(num), .load_data(load_data), .incr_delta(
        incr_delta), .find_next_sq(find_next_sq), .clk(clk), .finish(finish), 
        .result(result) );
endmodule

