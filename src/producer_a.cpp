#include "producer_a.h"

#include "producer.h"

template <> char producer<producer_a>::produce() const noexcept {
  return 'A';
}
