program test(mem_if intf);

  import mem_pkg::*;

  Transaction gen_q[$];
  Transaction mon_q[$];
  Transaction chk_q[$];

  task gen();
    Transaction t;

    for (int i = 0; i < 100; i++) begin
      t = new();
      t.addr    = i;
      t.data_in = i;
      gen_q.push_back(t.copy());
    end
  endtask

  task driver();
    Transaction t;

    repeat (100) begin
      wait(gen_q.size() > 0);
      t = gen_q.pop_front();

      // WRITE
      intf.cb.addr    <= t.addr;
      intf.cb.data_in <= t.data_in;
      intf.cb.write   <= 1;
      intf.cb.read    <= 0;
      @(intf.cb);

      intf.cb.write <= 0;
      @(intf.cb);

      // READ
      intf.cb.addr <= t.addr;
      intf.cb.read <= 1;
      @(intf.cb);

      mon_q.push_back(t.copy());

      intf.cb.read <= 0;
    end
  endtask

  task monitor();
    Transaction t;

    repeat (100) begin
      wait(mon_q.size() > 0);
      t = mon_q.pop_front();

      @(intf.cb);

      t.data_out      = intf.cb.data_out;
      t.expected_data = {^t.data_in, t.data_in};

      chk_q.push_back(t.copy());
    end
  endtask

  task checker();
    Transaction t;

    repeat (100) begin
      wait(chk_q.size() > 0);
      t = chk_q.pop_front();

      $display("%0t addr=%0d expected=%0h actual=%0h",
               $time, t.addr, t.expected_data, t.data_out);

      if (t.data_out != t.expected_data)
        Transaction::error++;
    end

    Transaction::print_error();
    #10 $finish;
  endtask

  initial begin
    intf.cb.write   <= 0;
    intf.cb.read    <= 0;
    intf.cb.addr    <= 0;
    intf.cb.data_in <= 0;

    fork
      gen();
      driver();
      monitor();
      checker();
    join
  end

endprogram
