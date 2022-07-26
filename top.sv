class Transaction;
   
    bit [7:0] src,csm,data; //properties
     
    //methods 
     
    function void calCsm();
      csm=src^data;
    endfunction 
    
    function void print();
      $display("Csm = %0d",csm);
      
      $display("src = %0d",src);
      
      $display("data = %0d",data);
      
    endfunction
    
    function void copy(Transaction rhs);
      
      this.src = rhs.src;
      this.data = rhs.data;
      this.csm = rhs.csm;
      
    endfunction 
    
    function Transaction clone();
        clone = new();
        clone.copy(this);
    endfunction
    
endclass 

class BadTr extends Transaction;
    int badCsm;
    
 function void calCsm();
    super.calCsm();
       if(badCsm)
         csm=~csm;
  endfunction 
  
  function void print();
      super.print();
      $write("BadTr : BadCsm=%b",badCsm);
  endfunction 
  
endclass 


class generator;
  
  Transaction blueprint_h,r_h;
  
function new();
  blueprint_h=new();
endfunction

task run();
  for(int i=0;i<10;i++)
    begin
      r_h = blueprint_h.clone();
      r_h.src=i;
      r_h.data=i+1;
      
      drive(r_h);
      
    end  
endtask 

task drive(Transaction r_h);
  //
endtask 


endclass


class Test;
   generator g_h;
   
  function new();
      g_h=new();
  endfunction 

task run();
 g_h.run(); 
endtask 

endclass 

module top();
  
  Test t;
  
initial begin 
  t=new();
  t.run();
end 

endmodule 

class BadTest extends Test;
   BadTr badprint_h;
  
function new();
super.new();
  badprint_h=new();
  
  badprint_h.badCsm=1;
  g_h.blueprint_h=badprint_h;
  
endfunction

endclass 

  

 





  
  

  
      