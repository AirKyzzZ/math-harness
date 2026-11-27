import Mathlib

namespace Erdos414

-- The auxiliary function $h(n) = n + τ(n)$ (where $τ(n) counts the number of divisors of $n$)

def h (n : ℕ) : ℕ := n + n.divisors.card

theorem erdos_414_neg :
    ¬ (∀ᵉ (m > 0) (n > 0), ∃ i j, h^[i] m = h^[j] n) := by
  sorry

end Erdos414
