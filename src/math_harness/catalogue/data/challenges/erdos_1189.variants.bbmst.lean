import Mathlib

open Filter Asymptotics

namespace Erdos1189

def IsCoveringSet (M : Finset ℕ) : Prop :=
  (∀ m ∈ M, 1 < m) ∧ ∃ a : ℕ → ℤ, ∀ z : ℤ, ∃ m ∈ M, z ≡ a m [ZMOD m]

def IsIrreducibleCoveringSet (M : Finset ℕ) : Prop :=
  IsCoveringSet M ∧ ∀ N : Finset ℕ, N ⊂ M → ¬ IsCoveringSet N

theorem not_isCoveringSet_empty : ¬ IsCoveringSet ∅ := by
  rintro ⟨-, a, ha⟩
  obtain ⟨m, hm, -⟩ := ha 0
  simp at hm

noncomputable def irreducibleCount (k : ℕ) : ℕ :=
  {M : Finset ℕ | IsIrreducibleCoveringSet M ∧ M.card = k}.ncard

def largestModulus (k : ℕ) : Set ℕ :=
  {n | ∃ M : Finset ℕ, IsIrreducibleCoveringSet M ∧ M.card = k ∧ IsGreatest (M : Set ℕ) n}

noncomputable def maxReciprocalSum (k : ℕ) : ℝ :=
  sSup {s : ℝ | ∃ M : Finset ℕ, IsIrreducibleCoveringSet M ∧ M.card = k ∧
    s = ∑ m ∈ M, (m : ℝ)⁻¹}

noncomputable def bbmstTau : ℝ :=
  ∑' t : ℕ, Real.log (((t : ℝ) + 2) / ((t : ℝ) + 1)) ^ 2

theorem erdos_1189.variants.bbmst (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ k : ℕ in atTop, (irreducibleCount k : ℝ) ≤ Real.exp ((4 * Real.sqrt bbmstTau / 3 + ε) * ((k : ℝ) ^ (3 / 2 : ℝ) / Real.sqrt (Real.log k))) := by
  sorry

end Erdos1189
