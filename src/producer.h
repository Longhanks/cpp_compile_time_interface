#pragma once

// "producer" is a compile time interface with one function that produces a
// char.

template<typename>
struct producer final {
  [[nodiscard]] char produce() const noexcept;
};
