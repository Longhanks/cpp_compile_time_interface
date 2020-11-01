#pragma once

#include "producer.h"

// The consume function can utilize "subclasses" of producer.

template<typename T>
void consume(const producer<T> &p) noexcept;
