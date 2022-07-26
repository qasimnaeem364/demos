class mouth ;
  
  int teeth;
  
  extern function void copy(mouth arg);
  
  extern function new(int x);
  

  extern function display();
    
endclass 


function void mouth::copy(mouth arg);
      this.teeth= arg.teeth;
  endfunction 

function mouth:: new(int x);
    
    this.teeth=x;
    
endfunction 

 function mouth::display();
    
    $display("/t Teeth count = %0d",teeth);
    
endfunction 
