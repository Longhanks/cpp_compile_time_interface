#include "producer_b.h"

#include "producer.h"

template <> char producer<producer_b>::produce() const noexcept {
  return 'B';
}
