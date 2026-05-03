package mem_pkg;

  class Transaction;

    rand bit [15:0] addr;
    rand bit [7:0]  data_in;
         bit [8:0]  data_out;
         bit [8:0]  expected_data;

    static int error;

    function new();
    endfunction

    function void print_data_out();
      $display("%0t %0h", $time, data_out);
    endfunction

    static function void print_error();
      $display("%0t %0d", $time, error);
    endfunction

    function void check();
      if (data_out != expected_data)
        error++;
    endfunction

    function Transaction copy();
      Transaction t;
      t = new();

      t.addr          = this.addr;
      t.data_in       = this.data_in;
      t.data_out      = this.data_out;
      t.expected_data = this.expected_data;

      return t;
    endfunction

  endclass

endpackage
