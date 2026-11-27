import Mathlib

open Filter SimpleGraph

namespace Erdos533

open scoped Classical in
theorem erdos_533.variants.delta_seven_ge_quarter (ε δ : ℝ) (hε : 0 < ε) (hδ : 0 < δ) :
    ∀ᶠ n : ℕ in atTop, ∃ G : SimpleGraph (Fin n), G.CliqueFree 7 ∧ (∀ S : Finset (Fin n), G.CliqueFreeOn (S : Set (Fin n)) 3 → (S.card : ℝ) ≤ δ * n) ∧ (1 / 4 - ε) * (n : ℝ) ^ 2 ≤ G.edgeFinset.card := by
  sorry

theorem erdos_533.variants.test_bot (n : ℕ) (S : Finset (Fin n)) :
    (⊥ : SimpleGraph (Fin n)).CliqueFreeOn (S : Set (Fin n)) 3 :=
  fun t _ h => cliqueFree_bot (by norm_num) t h

end Erdos533
