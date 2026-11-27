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

theorem erdos_838.variants.erdos_bounds :
    ∃ c₁ c₂ : ℝ, 0 < c₁ ∧ 0 < c₂ ∧ ∀ n : ℕ, 2 ≤ n → (n : ℝ) ^ (c₁ * Real.log n) < f n ∧ (f n : ℝ) < (n : ℝ) ^ (c₂ * Real.log n) := by
  sorry

end Erdos838
