import Mathlib

namespace Erdos780

theorem erdos_780 (n k r t : ℕ) (hr : 1 ≤ r) (ht : 1 ≤ t) (hn : k * r + (t - 1) * (k - 1) ≤ n) (c : {e : Finset (Fin n) // e.card = r} → Fin t) :
    ∃ (i : Fin t) (e : Fin k → {e : Finset (Fin n) // e.card = r}), (∀ j, c (e j) = i) ∧ Pairwise fun a b ↦ Disjoint (e a).1 (e b).1 := by
  sorry

end Erdos780
