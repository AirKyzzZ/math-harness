import Mathlib

open SimpleGraph Filter

namespace Erdos667

def LocallyDense (p q : ℕ) {n : ℕ} (G : SimpleGraph (Fin n)) : Prop :=
  ∀ s : Finset (Fin n), s.card = p → q ≤ (G.induce s).edgeSet.ncard

open Classical in
noncomputable def H (p q n : ℕ) : ℕ :=
  Nat.findGreatest
    (fun m => ∀ G : SimpleGraph (Fin n), LocallyDense p q G → ¬ G.CliqueFree m) n

noncomputable def c (p q : ℕ) : ℝ :=
  liminf (fun n : ℕ => Real.log (H p q n) / Real.log n) atTop

theorem erdos_667.variants.ramsey_bounds (p : ℕ) (hp : 3 ≤ p) :
    1 / ((p : ℝ) - 1) ≤ c p 1 ∧ c p 1 ≤ 2 / ((p : ℝ) + 1) := by
  sorry

end Erdos667
