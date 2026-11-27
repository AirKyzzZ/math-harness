import Mathlib

open Filter SimpleGraph

namespace Erdos533

open scoped Classical in
theorem erdos_533.variants.ehsss_upper (ε : ℝ) (hε : 0 < ε) :
    ∃ δ : ℝ, 0 < δ ∧ ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Fin n), G.CliqueFree 5 → (∀ S : Finset (Fin n), G.CliqueFreeOn (S : Set (Fin n)) 3 → (S.card : ℝ) ≤ δ * n) → (G.edgeFinset.card : ℝ) ≤ (1 / 12 + ε) * n ^ 2 := by
  sorry

theorem erdos_533.variants.test_bot (n : ℕ) (S : Finset (Fin n)) :
    (⊥ : SimpleGraph (Fin n)).CliqueFreeOn (S : Set (Fin n)) 3 :=
  fun t _ h => cliqueFree_bot (by norm_num) t h

end Erdos533
