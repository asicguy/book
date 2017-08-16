#include "tb.h"

void tb::source() {
  rst.write(false);
  wait();
  wait();
  rst.write(true);
  wait();
  wait();
  rst.write(false);
  wait();
  wait();
}
  
void tb::sink() {
  int a, b, c, d;
  while(!done) {
    wait();
  }
  sc_stop;
}
