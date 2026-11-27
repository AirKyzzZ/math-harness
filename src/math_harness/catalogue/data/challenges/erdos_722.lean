import Mathlib

namespace Erdos722

open Filter Asymptotics

theorem erdos_722 :
    ∀ r k : ℕ, 1 ≤ r → r < k → ∀ᶠ n : ℕ in atTop, (∀ i < r, (k - i).choose (r - i) ∣ (n - i).choose (r - i)) → ∃ H : Finset (Finset (Fin n)), H.IsBlockDesign r k := by
  sorry

end Erdos722
