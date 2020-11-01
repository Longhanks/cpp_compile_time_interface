#include "consumer.h"

#include "producer_a.h"
#include "producer_b.h"

#include <iostream>

// The impl function allows following the DRY principle.
template <typename T> void consume_impl(const producer<T> &p) noexcept {
    std::cout << "This function does things not dependant on the actual "
                 "implementation\n";

    std::cout << p.produce() << '\n';

    std::cout << "Invocation finished\n\n";
}

// The explicit template instantiations simply call the impl function.

template <> void consume(const producer<producer_a> &p) noexcept {
    consume_impl(p);
}

template <> void consume(const producer<producer_b> &p) noexcept {
    consume_impl(p);
}
