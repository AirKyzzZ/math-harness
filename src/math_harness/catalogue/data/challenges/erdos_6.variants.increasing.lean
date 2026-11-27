import Mathlib

namespace Erdos6

theorem erdos_6.variants.increasing (m : ℕ) :
    {n | ∀ i ∈ Finset.range m, primeGap (n + i) < primeGap (n + i + 1)}.Infinite := by
  sorry

end Erdos6
