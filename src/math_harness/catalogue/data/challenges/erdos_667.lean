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

theorem erdos_667 :
    ∀ p : ℕ, StrictMonoOn (c p) (Set.Icc 1 (Nat.choose (p - 1) 2 + 1)) := by
  sorry

end Erdos667
