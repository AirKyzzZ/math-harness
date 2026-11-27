import Mathlib

open Filter Real

namespace Erdos858

def IsAdmissible (A : Finset ℕ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ t : ℕ, a * t = b → t.minFac ≤ a

noncomputable def M (N : ℕ) : ℝ :=
  sSup {m | ∃ A ⊆ Finset.Icc 1 N, IsAdmissible A ∧ ∑ n ∈ A, (1 : ℝ) / n = m}

open scoped Classical in
theorem erdos_858.variants.infinite (A : Set ℕ) (hA : A.Infinite) (h0 : 0 ∉ A) (hadm : ∀ a ∈ A, ∀ b ∈ A, ∀ t : ℕ, a * t = b → t.minFac ≤ a) :
    (fun N : ℕ ↦ ∑ n ∈ (Finset.Icc 1 N).filter (· ∈ A), (1 : ℝ) / n) =o[atTop] fun N : ℕ ↦ log N := by
  sorry

end Erdos858
