import Mathlib

open Filter Asymptotics

namespace Erdos360

noncomputable def f (n : ℕ) : ℕ :=
  sInf {r : ℕ | ∃ P : Finpartition (Finset.Icc 1 (n - 1)),
    P.parts.card = r ∧ ∀ A ∈ P.parts, n ∉ subsetSums (A : Set ℕ)}

noncomputable def erdos_360.answer (n : ℕ) : ℝ :=
  (n : ℝ) ^ (1 / 3 : ℝ) * ((n : ℝ) / (n.totient : ℝ)) /
    (Real.log n ^ (1 / 3 : ℝ) * Real.log (Real.log n) ^ (2 / 3 : ℝ))

theorem erdos_360.variants.alon_erdos :
    (fun n : ℕ ↦ (n : ℝ) ^ (1 / 3 : ℝ) / Real.log n ^ (4 / 3 : ℝ)) =O[atTop] (fun n : ℕ ↦ (f n : ℝ)) ∧ (fun n : ℕ ↦ (f n : ℝ)) =O[atTop] (fun n : ℕ ↦ (n : ℝ) ^ (1 / 3 : ℝ) / Real.log n ^ (1 / 3 : ℝ) * Real.log (Real.log n) ^ (1 / 3 : ℝ)) := by
  sorry

end Erdos360
