#include "consumer.h"
#include "producer_a.h"
#include "producer_b.h"

int main([[maybe_unused]] int argc, [[maybe_unused]] char *argv[]) {
  producer<producer_a> p1;
  consume(p1);

  producer<producer_b> p2;
  consume(p2);
}
