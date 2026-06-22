class A inherits IO {
  x : Int <- 5;

  inc(y : Int) : Int {
    x + y
  };

  me() : SELF_TYPE {
    self
  };
};

class B inherits A {
  x2 : Int <- 2;

  inc(y : Int) : Int {
    (x + y) + x2
  };
};

class Main inherits IO {
  main() : Object {{
    let a : A <- new B, i : Int <- 0, s : Int <- 0 in {
      while i < 4 loop {
        s <- s + i;
        i <- i + 1;
      } pool;

      out_int(a.inc(s));
      out_string("\n");

      out_int(a@A.inc(1));
      out_string("\n");

      out_int(case a of
        b : B => b.inc(1);
        aa : A => aa.inc(10);
      esac);
      out_string("\n");

      out_int((new SELF_TYPE).type_name().length());
      out_string("\n");

      if not isvoid a.me() then out_string("ok\n") else out_string("bad\n") fi;

      if "ab".concat("c") = "abc" then out_string("eqstr\n") else out_string("bad\n") fi;
      if 5 = 2 + 3 then out_string("eqint\n") else out_string("bad\n") fi;
      if false = not true then out_string("eqbool\n") else out_string("bad\n") fi;

      let d : Int, empty : String, obj : Object in {
        out_int(d);
        out_string("\n");
        out_int(empty.length());
        out_string("\n");
        if isvoid obj then out_string("void\n") else out_string("bad\n") fi;
      };
    };
  }};
};
