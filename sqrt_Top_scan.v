/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue Mar  7 20:39:06 2023
/////////////////////////////////////////////////////////////


module sqrt_data_path_test_0 ( num, load_data, incr_delta, find_next_sq, clk, 
        finish, result, test_si, test_so, test_se );
  input [6:0] num;
  output [3:0] result;
  input load_data, incr_delta, find_next_sq, clk, test_si, test_se;
  output finish, test_so;
  wire   N4, N5, N6, N7, N8, N9, N10, N17, N35, N36, N37, N38, N39, N41, N42,
         N43, N44, N45, N46, N47, N56, N57, N58, N59, N60, N61, N63, N80, N82,
         N84, N86, N88, N90, n28, n2, n5, n6, n7, n8, n9, n22, n23, n24, n25,
         n26, n27, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, add_22_S2_n2, add_22_S2_n1, n44, n45, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n1, n3, n4, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n46, n47, n48;
  wire   [6:0] Rdata;
  wire   [5:2] add_22_S2_carry;

  AND2X1 U29 ( .IN1(n96), .IN2(n9), .Q(N90) );
  AND2X1 U30 ( .IN1(n96), .IN2(n8), .Q(N88) );
  AND2X1 U31 ( .IN1(n96), .IN2(n7), .Q(N86) );
  AND2X1 U32 ( .IN1(n96), .IN2(n6), .Q(N84) );
  AND2X1 U33 ( .IN1(n96), .IN2(n5), .Q(N82) );
  AO21X1 U34 ( .IN1(N56), .IN2(n86), .IN3(n22), .Q(N63) );
  OA221X1 U35 ( .IN1(N57), .IN2(n87), .IN3(N56), .IN4(n86), .IN5(n23), .Q(n22)
         );
  AO221X1 U36 ( .IN1(N57), .IN2(n87), .IN3(N58), .IN4(n88), .IN5(n24), .Q(n23)
         );
  OA221X1 U37 ( .IN1(N59), .IN2(n89), .IN3(N58), .IN4(n88), .IN5(n25), .Q(n24)
         );
  AO221X1 U38 ( .IN1(N59), .IN2(n89), .IN3(N60), .IN4(n90), .IN5(n26), .Q(n25)
         );
  OA221X1 U39 ( .IN1(N61), .IN2(n91), .IN3(N60), .IN4(n90), .IN5(n27), .Q(n26)
         );
  NAND3X0 U40 ( .IN1(N10), .IN2(n29), .IN3(n30), .QN(n27) );
  AO22X1 U41 ( .IN1(num[1]), .IN2(load_data), .IN3(n96), .IN4(Rdata[1]), .Q(N9) );
  AO22X1 U42 ( .IN1(num[2]), .IN2(load_data), .IN3(n96), .IN4(Rdata[2]), .Q(N8) );
  AO22X1 U43 ( .IN1(num[3]), .IN2(load_data), .IN3(n96), .IN4(Rdata[3]), .Q(N7) );
  OA22X1 U44 ( .IN1(n31), .IN2(n44), .IN3(n93), .IN4(n32), .Q(n29) );
  AO22X1 U45 ( .IN1(N42), .IN2(find_next_sq), .IN3(n93), .IN4(n9), .Q(N61) );
  AO22X1 U46 ( .IN1(N43), .IN2(find_next_sq), .IN3(n93), .IN4(n8), .Q(N60) );
  AO22X1 U47 ( .IN1(num[4]), .IN2(load_data), .IN3(n96), .IN4(Rdata[4]), .Q(N6) );
  AO22X1 U48 ( .IN1(N44), .IN2(find_next_sq), .IN3(n93), .IN4(n7), .Q(N59) );
  AO22X1 U49 ( .IN1(N45), .IN2(find_next_sq), .IN3(n93), .IN4(n6), .Q(N58) );
  AO22X1 U50 ( .IN1(N46), .IN2(find_next_sq), .IN3(n93), .IN4(n5), .Q(N57) );
  AO22X1 U51 ( .IN1(N47), .IN2(find_next_sq), .IN3(n93), .IN4(n45), .Q(N56) );
  AO22X1 U52 ( .IN1(num[5]), .IN2(load_data), .IN3(n96), .IN4(Rdata[5]), .Q(N5) );
  AO22X1 U53 ( .IN1(num[6]), .IN2(load_data), .IN3(n96), .IN4(Rdata[6]), .Q(N4) );
  AO22X1 U54 ( .IN1(result[0]), .IN2(n33), .IN3(n34), .IN4(n95), .Q(N38) );
  AO22X1 U55 ( .IN1(result[1]), .IN2(n33), .IN3(n36), .IN4(incr_delta), .Q(N37) );
  XNOR2X1 U56 ( .IN1(n37), .IN2(n35), .Q(n36) );
  AO22X1 U57 ( .IN1(result[2]), .IN2(n33), .IN3(incr_delta), .IN4(n38), .Q(N36) );
  XOR2X1 U58 ( .IN1(n39), .IN2(n40), .Q(n38) );
  AO22X1 U59 ( .IN1(result[3]), .IN2(n33), .IN3(incr_delta), .IN4(n41), .Q(N35) );
  XOR2X1 U60 ( .IN1(n42), .IN2(n43), .Q(n41) );
  AND3X1 U61 ( .IN1(n35), .IN2(n96), .IN3(result[1]), .Q(n39) );
  OR2X1 U62 ( .IN1(result[0]), .IN2(load_data), .Q(n35) );
  AND2X1 U63 ( .IN1(result[2]), .IN2(n96), .Q(n40) );
  AO22X1 U64 ( .IN1(num[0]), .IN2(load_data), .IN3(n96), .IN4(Rdata[0]), .Q(
        N10) );
  SDFFX1 Rdata_reg_6_ ( .D(N4), .SI(n19), .SE(test_se), .CLK(clk), .Q(Rdata[6]), .QN(n18) );
  SDFFX1 Rdata_reg_5_ ( .D(N5), .SI(n20), .SE(test_se), .CLK(clk), .Q(Rdata[5]), .QN(n19) );
  SDFFX1 Rdata_reg_4_ ( .D(N6), .SI(n21), .SE(test_se), .CLK(clk), .Q(Rdata[4]), .QN(n20) );
  SDFFX1 Rdata_reg_3_ ( .D(N7), .SI(n46), .SE(test_se), .CLK(clk), .Q(Rdata[3]), .QN(n21) );
  SDFFX1 Rdata_reg_2_ ( .D(N8), .SI(n47), .SE(test_se), .CLK(clk), .Q(Rdata[2]), .QN(n46) );
  SDFFX1 Rdata_reg_1_ ( .D(N9), .SI(n48), .SE(test_se), .CLK(clk), .Q(Rdata[1]), .QN(n47) );
  SDFFX1 Rdata_reg_0_ ( .D(N10), .SI(test_si), .SE(test_se), .CLK(clk), .Q(
        Rdata[0]), .QN(n48) );
  SDFFX1 Rdelta_reg_0_ ( .D(N39), .SI(n18), .SE(test_se), .CLK(clk), .Q(n17), 
        .QN(n2) );
  SDFFX1 Rdelta_reg_1_ ( .D(N38), .SI(n17), .SE(test_se), .CLK(clk), .Q(
        result[0]), .QN(n16) );
  SDFFX1 Rdelta_reg_2_ ( .D(N37), .SI(n16), .SE(test_se), .CLK(clk), .Q(
        result[1]), .QN(n15) );
  SDFFX1 Rdelta_reg_3_ ( .D(N36), .SI(n15), .SE(test_se), .CLK(clk), .Q(
        result[2]), .QN(n14) );
  SDFFX1 Rn_reg_0_ ( .D(n92), .SI(n13), .SE(test_se), .CLK(clk), .Q(n12), .QN(
        n44) );
  SDFFX1 Rn_reg_1_ ( .D(N61), .SI(n12), .SE(test_se), .CLK(clk), .Q(n9), .QN(
        n11) );
  SDFFX1 Rn_reg_2_ ( .D(N60), .SI(n11), .SE(test_se), .CLK(clk), .Q(n8), .QN(
        n10) );
  SDFFX1 Rn_reg_3_ ( .D(N59), .SI(n10), .SE(test_se), .CLK(clk), .Q(n7), .QN(
        n4) );
  SDFFX1 Rn_reg_4_ ( .D(N58), .SI(n4), .SE(test_se), .CLK(clk), .Q(n6), .QN(n3) );
  SDFFX1 Rn_reg_5_ ( .D(N57), .SI(n3), .SE(test_se), .CLK(clk), .Q(n5), .QN(n1) );
  SDFFX1 finish_reg ( .D(N63), .SI(n45), .SE(test_se), .CLK(clk), .Q(finish), 
        .QN(test_so) );
  SDFFX1 Rn_reg_6_ ( .D(N56), .SI(n1), .SE(test_se), .CLK(clk), .Q(n45), .QN(
        n28) );
  SDFFX1 Rdelta_reg_4_ ( .D(N35), .SI(n14), .SE(test_se), .CLK(clk), .Q(
        result[3]), .QN(n13) );
  XOR2X1 add_22_S2_U5 ( .IN1(N39), .IN2(N17), .Q(N41) );
  XOR2X1 add_22_S2_U4 ( .IN1(add_22_S2_carry[5]), .IN2(N82), .Q(N46) );
  XOR2X1 add_22_S2_U3 ( .IN1(add_22_S2_n1), .IN2(N80), .Q(N47) );
  AND2X1 add_22_S2_U2 ( .IN1(N39), .IN2(N17), .Q(add_22_S2_n2) );
  AND2X1 add_22_S2_U1 ( .IN1(add_22_S2_carry[5]), .IN2(N82), .Q(add_22_S2_n1)
         );
  FADDX1 add_22_S2_U1_1 ( .A(N90), .B(N38), .CI(add_22_S2_n2), .CO(
        add_22_S2_carry[2]), .S(N42) );
  FADDX1 add_22_S2_U1_2 ( .A(N88), .B(N37), .CI(add_22_S2_carry[2]), .CO(
        add_22_S2_carry[3]), .S(N43) );
  FADDX1 add_22_S2_U1_3 ( .A(N86), .B(N36), .CI(add_22_S2_carry[3]), .CO(
        add_22_S2_carry[4]), .S(N44) );
  FADDX1 add_22_S2_U1_4 ( .A(N84), .B(N35), .CI(add_22_S2_carry[4]), .CO(
        add_22_S2_carry[5]), .S(N45) );
  INVX0 U3 ( .INP(n31), .ZN(n93) );
  NAND2X1 U4 ( .IN1(n94), .IN2(n96), .QN(n31) );
  INVX0 U5 ( .INP(n29), .ZN(n92) );
  INVX0 U6 ( .INP(find_next_sq), .ZN(n94) );
  INVX0 U7 ( .INP(load_data), .ZN(n96) );
  NOR2X0 U8 ( .IN1(incr_delta), .IN2(load_data), .QN(n33) );
  NAND2X1 U9 ( .IN1(n44), .IN2(n96), .QN(N17) );
  NAND2X1 U10 ( .IN1(N61), .IN2(n91), .QN(n30) );
  INVX0 U11 ( .INP(N7), .ZN(n89) );
  INVX0 U12 ( .INP(N4), .ZN(n86) );
  NOR2X0 U13 ( .IN1(N41), .IN2(n94), .QN(n32) );
  INVX0 U14 ( .INP(N9), .ZN(n91) );
  INVX0 U15 ( .INP(N8), .ZN(n90) );
  INVX0 U16 ( .INP(N6), .ZN(n88) );
  INVX0 U17 ( .INP(N5), .ZN(n87) );
  NAND2X1 U18 ( .IN1(result[1]), .IN2(n96), .QN(n37) );
  NAND2X1 U19 ( .IN1(incr_delta), .IN2(n35), .QN(n34) );
  INVX0 U20 ( .INP(n33), .ZN(n95) );
  NAND2X1 U21 ( .IN1(n96), .IN2(n2), .QN(N39) );
  NOR2X0 U22 ( .IN1(n28), .IN2(load_data), .QN(N80) );
  NAND2X1 U23 ( .IN1(result[3]), .IN2(n96), .QN(n42) );
  NAND2X1 U24 ( .IN1(n40), .IN2(n39), .QN(n43) );
endmodule


module sqrt_controller_test_0 ( start, finish, clk, clear, ready, load_data, 
        incr_delta, find_next_sq, test_si, test_so, test_se );
  input start, finish, clk, clear, test_si, test_se;
  output ready, load_data, incr_delta, find_next_sq, test_so;
  wire   n6, n7, n8, n14, n15, n17;
  wire   [1:0] state;
  wire   [1:0] next_state;

  AO21X1 U11 ( .IN1(state[1]), .IN2(n14), .IN3(state[0]), .Q(next_state[1]) );
  NAND3X0 U12 ( .IN1(n15), .IN2(test_so), .IN3(start), .QN(n7) );
  NAND3X0 U13 ( .IN1(n14), .IN2(n15), .IN3(state[1]), .QN(n6) );
  AND2X1 U14 ( .IN1(start), .IN2(ready), .Q(load_data) );
  XOR2X1 U15 ( .IN1(state[1]), .IN2(state[0]), .Q(n8) );
  SDFFARX1 state_reg_1_ ( .D(next_state[1]), .SI(n15), .SE(test_se), .CLK(clk), 
        .RSTB(n17), .Q(state[1]), .QN(test_so) );
  SDFFARX1 state_reg_0_ ( .D(next_state[0]), .SI(test_si), .SE(test_se), .CLK(
        clk), .RSTB(n17), .Q(state[0]), .QN(n15) );
  NOR2X0 U5 ( .IN1(n15), .IN2(n8), .QN(incr_delta) );
  INVX0 U6 ( .INP(n6), .ZN(find_next_sq) );
  NOR2X0 U7 ( .IN1(n8), .IN2(state[0]), .QN(ready) );
  NAND2X1 U8 ( .IN1(n6), .IN2(n7), .QN(next_state[0]) );
  INVX0 U9 ( .INP(finish), .ZN(n14) );
  INVX0 U10 ( .INP(clear), .ZN(n17) );
endmodule


module sqrt_Top ( start, clk, clear, num, ready, result, test_si, test_so, 
        test_se );
  input [6:0] num;
  output [3:0] result;
  input start, clk, clear, test_si, test_se;
  output ready, test_so;
  wire   finish, load_data, incr_delta, find_next_sq, n3, n5, n6, n7;

  sqrt_controller_test_0 m1 ( .start(start), .finish(finish), .clk(clk), 
        .clear(clear), .ready(ready), .load_data(load_data), .incr_delta(
        incr_delta), .find_next_sq(find_next_sq), .test_si(test_si), .test_so(
        n3), .test_se(n6) );
  sqrt_data_path_test_0 m2 ( .num(num), .load_data(load_data), .incr_delta(
        incr_delta), .find_next_sq(find_next_sq), .clk(clk), .finish(finish), 
        .result(result), .test_si(n3), .test_so(test_so), .test_se(n6) );
  INVX0 U1 ( .INP(n7), .ZN(n5) );
  INVX0 U2 ( .INP(n5), .ZN(n6) );
  DELLN2X2 U3 ( .INP(test_se), .Z(n7) );
endmodule

