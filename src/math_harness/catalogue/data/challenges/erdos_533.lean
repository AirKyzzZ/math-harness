import Mathlib

open Filter SimpleGraph

namespace Erdos533

open scoped Classical in
theorem erdos_533 :
    ¬ ∀ δ : ℝ, 0 < δ → ∃ c : ℝ, 0 < c ∧ ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Fin n), G.CliqueFree 5 → δ * (n : ℝ) ^ 2 ≤ G.edgeFinset.card → ∃ S : Finset (Fin n), c * n ≤ (S.card : ℝ) ∧ G.CliqueFreeOn (S : Set (Fin n)) 3 := by
  sorry

theorem erdos_533.variants.test_bot (n : ℕ) (S : Finset (Fin n)) :
    (⊥ : SimpleGraph (Fin n)).CliqueFreeOn (S : Set (Fin n)) 3 :=
  fun t _ h => cliqueFree_bot (by norm_num) t h

end Erdos533
