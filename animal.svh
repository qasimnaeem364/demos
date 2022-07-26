class animal;
  //class properties
  mouth m_h;
  int age;
  string name;
  
  
 function animal clone();
    clone = new(0,"dummy",66);
    clone.copy(this);
endfunction 

 function new(int age,string name,int teeth);
      m_h = new(teeth);
      this.age=age;
      this.name=name;
endfunction 

function void copy(animal arg);
  
  this.age=arg.age;
  this.name=arg.name;
  m_h.copy(arg.m_h);
  
endfunction 


   
  //method-2
  function void display();
     $display("Value of age=%0d",age);
     $display("Value of h=%s",name);
     m_h.display();
  endfunction
endclass

