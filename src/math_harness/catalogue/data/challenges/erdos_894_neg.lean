import Mathlib

namespace Erdos894

theorem erdos_894_neg :
    ¬ (∀ n : ℕ → ℕ, StrictMono n → (∀ k, 0 < n k) → IsLacunary n → ∃ (r : ℕ) (c : ℕ → Fin r), ∀ b k, c (b + n k) ≠ c b) := by
  sorry

end Erdos894
