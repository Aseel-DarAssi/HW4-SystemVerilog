module top;

  logic clk;

  mem_if intf(clk);

  my_mem dut (
    .clk      (clk),
    .write    (intf.write),
    .read     (intf.read),
    .data_in  (intf.data_in),
    .address  (intf.addr),
    .data_out (intf.data_out)
  );

  test t(intf);

  initial clk = 0;
  always #50 clk = ~clk;   // 10 MHz

endmodule
