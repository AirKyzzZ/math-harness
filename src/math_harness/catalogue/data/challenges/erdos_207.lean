import Mathlib

namespace Erdos207

open Filter Asymptotics

theorem erdos_207 :
    ∀ g : ℕ, 2 ≤ g → ∀ᶠ n : ℕ in atTop, n % 6 = 1 ∨ n % 6 = 3 → ∃ H : Finset (Finset (Fin n)), H.IsBlockDesign 2 3 ∧ ∀ E ⊆ H, 2 ≤ E.card → E.card ≤ g → E.card + 3 ≤ (E.biUnion id).card := by
  sorry

end Erdos207
