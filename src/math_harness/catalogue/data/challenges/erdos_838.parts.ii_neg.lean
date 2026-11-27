import Mathlib

open Filter Asymptotics EuclideanGeometry

namespace Erdos838

noncomputable def numConvexSubsets (P : Finset ℝ²) : ℕ :=
  Set.ncard {S : Finset ℝ² | S ⊆ P ∧ ConvexIndep (S : Set ℝ²)}

noncomputable def f (n : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ P : Finset ℝ², P.card = n ∧ NonTrilinear (P : Set ℝ²) ∧
    numConvexSubsets P = m}

theorem f_le {n : ℕ} {P : Finset ℝ²} (hcard : P.card = n) (hP : NonTrilinear (P : Set ℝ²)) :
    f n ≤ numConvexSubsets P :=
  Nat.sInf_le ⟨P, hcard, hP, rfl⟩

theorem erdos_838.parts.ii_neg :
    ¬ (∃ c : ℝ, Tendsto (fun n : ℕ ↦ Real.log (f n) / Real.log n ^ 2) atTop (nhds c)) := by
  sorry

end Erdos838
