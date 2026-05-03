interface mem_if(input logic clk);

  logic        read;
  logic        write;
  logic [15:0] addr;
  logic [7:0]  data_in;
  logic [8:0]  data_out;

  clocking cb @(posedge clk);
    output read, write, addr, data_in;
    input  data_out;
  endclocking

  always @(posedge clk) begin
    if (read && write)
      $fatal("ERROR: read and write asserted together");
  end

endinterface
