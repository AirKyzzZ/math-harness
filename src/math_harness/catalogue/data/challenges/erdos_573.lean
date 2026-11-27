import Mathlib

open Filter Asymptotics SimpleGraph

namespace Erdos573

open scoped Classical in
noncomputable def cycleExtremalNumber (L : Set ℕ) (n : ℕ) : ℕ :=
  (Finset.univ.filter fun G : SimpleGraph (Fin n) => ∀ k ∈ L, (cycleGraph k).Free G).sup
    fun G => G.edgeFinset.card

theorem erdos_573 :
    (fun n : ℕ ↦ (cycleExtremalNumber {3, 4} n : ℝ)) ~[atTop] fun n : ℕ ↦ ((n : ℝ) / 2) ^ (3 / 2 : ℝ) := by
  sorry

end Erdos573
