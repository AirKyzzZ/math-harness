import Mathlib

open Filter Asymptotics SimpleGraph

namespace Erdos573

open scoped Classical in
noncomputable def cycleExtremalNumber (L : Set ℕ) (n : ℕ) : ℕ :=
  (Finset.univ.filter fun G : SimpleGraph (Fin n) => ∀ k ∈ L, (cycleGraph k).Free G).sup
    fun G => G.edgeFinset.card

theorem erdos_573.variants.c4_c5 :
    ∃ C : ℝ, ∀ᶠ n : ℕ in atTop, (cycleExtremalNumber {4, 5} n : ℝ) ≤ ((n : ℝ) / 2) ^ (3 / 2 : ℝ) + C * n := by
  sorry

end Erdos573
