import Mathlib

open MeasureTheory Filter

open scoped ProbabilityTheory Topology

namespace Erdos1164

open Erdos1165

def Covers {Ω : Type*} (X : ℕ → Ω → ℤ × ℤ) (n : ℕ) (ω : Ω) (S : Set (ℤ × ℤ)) : Prop :=
  ∀ x ∈ S, ∃ k ≤ n, position X k ω = x

def closedDisc (r : ℕ) : Set (ℤ × ℤ) :=
  {x : ℤ × ℤ | x.1 ^ 2 + x.2 ^ 2 ≤ (r : ℤ) ^ 2}

def openDisc (r : ℕ) : Set (ℤ × ℤ) :=
  {x : ℤ × ℤ | x.1 ^ 2 + x.2 ^ 2 < (r : ℤ) ^ 2}

noncomputable def coveringRadius {Ω : Type*} (X : ℕ → Ω → ℤ × ℤ) (n : ℕ) (ω : Ω) : ℕ :=
  sSup {r : ℕ | Covers X n ω (closedDisc r)}

theorem covers_closedDisc_zero {Ω : Type*} (X : ℕ → Ω → ℤ × ℤ) (n : ℕ) (ω : Ω) :
    Covers X n ω (closedDisc 0) := by
  intro x hx
  have hx' : x.1 ^ 2 + x.2 ^ 2 ≤ ((0 : ℕ) : ℤ) ^ 2 := hx
  rw [Nat.cast_zero] at hx'
  have h1 : x.1 ^ 2 = 0 := by nlinarith [sq_nonneg x.1, sq_nonneg x.2]
  have h2 : x.2 ^ 2 = 0 := by nlinarith [sq_nonneg x.1, sq_nonneg x.2]
  refine ⟨0, Nat.zero_le n, ?_⟩
  rw [position_zero]
  exact Prod.ext ((pow_eq_zero_iff two_ne_zero).1 h1).symm
    ((pow_eq_zero_iff two_ne_zero).1 h2).symm

theorem erdos_1164 {Ω : Type*} [MeasureSpace Ω] [IsProbabilityMeasure (ℙ : Measure Ω)] {X : ℕ → Ω → ℤ × ℤ} (hX : IsSimpleRandomWalkSteps X) :
    ∀ ε : ℝ, 0 < ε → ∃ c C : ℝ, 0 < c ∧ ∀ᶠ n : ℕ in atTop, 1 - ε ≤ (ℙ {ω | c * Real.sqrt (Real.log n) ≤ Real.log (coveringRadius X n ω) ∧ Real.log (coveringRadius X n ω) ≤ C * Real.sqrt (Real.log n)}).toReal := by
  sorry

end Erdos1164
