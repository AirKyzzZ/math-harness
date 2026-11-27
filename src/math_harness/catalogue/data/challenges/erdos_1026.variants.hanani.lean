import Mathlib

namespace Erdos1026

open Filter

def monotonicSubsequenceSums {n : ℕ} (x : Fin n → ℝ) : Set ℝ :=
  {S | ∃ I : Finset (Fin n), (MonotoneOn x ↑I ∨ AntitoneOn x ↑I) ∧ (∑ i ∈ I, x i) = S}

def admissibleConstants : Set ℝ :=
  {c : ℝ | ∀ ε : ℝ, 0 < ε → ∀ᶠ n : ℕ in atTop, ∀ x : Fin n → ℝ, Function.Injective x →
    (∀ i, 0 < x i) →
    ∃ S ∈ monotonicSubsequenceSums x, (c - ε) / Real.sqrt (n : ℝ) * (∑ i, x i) ≤ S}

theorem erdos_1026.variants.hanani (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ n : ℕ in atTop, ∀ x : Fin n → ℝ, Function.Injective x → ∃ (m : ℕ) (I : Fin m → Finset (Fin n)), (∀ j, MonotoneOn x ↑(I j) ∨ AntitoneOn x ↑(I j)) ∧ (Pairwise fun j k => Disjoint (I j) (I k)) ∧ (Finset.univ : Finset (Fin m)).biUnion I = Finset.univ ∧ (m : ℝ) ≤ (Real.sqrt 2 + ε) * Real.sqrt (n : ℝ) := by
  sorry

end Erdos1026
