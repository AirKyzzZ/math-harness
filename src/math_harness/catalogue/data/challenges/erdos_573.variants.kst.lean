import Mathlib

open Filter Asymptotics SimpleGraph

namespace Erdos573

open scoped Classical in
noncomputable def cycleExtremalNumber (L : Set ℕ) (n : ℕ) : ℕ :=
  (Finset.univ.filter fun G : SimpleGraph (Fin n) => ∀ k ∈ L, (cycleGraph k).Free G).sup
    fun G => G.edgeFinset.card

theorem erdos_573.variants.kst :
    (fun n : ℕ ↦ (cycleExtremalNumber ({4} ∪ {k | Odd k ∧ 3 ≤ k}) n : ℝ)) ~[atTop] fun n : ℕ ↦ ((n : ℝ) / 2) ^ (3 / 2 : ℝ) := by
  sorry

end Erdos573
