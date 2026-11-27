import Mathlib

open MeasureTheory Filter

open scoped ProbabilityTheory Topology Real ENNReal

namespace Erdos1166

open Erdos1165

def maxLocalTime {Ω : Type*} (X : ℕ → Ω → ℤ × ℤ) (n : ℕ) (ω : Ω) : ℕ :=
  (Finset.range (n + 1)).sup fun k ↦ localTime X n ω (position X k ω)

theorem localTime_le_maxLocalTime {Ω : Type*} (X : ℕ → Ω → ℤ × ℤ) (n : ℕ) (ω : Ω)
    (x : ℤ × ℤ) : localTime X n ω x ≤ maxLocalTime X n ω := by
  by_cases h : localTime X n ω x = 0
  · rw [h]
    exact Nat.zero_le _
  · have hpos : 0 < ((Finset.range (n + 1)).filter fun k ↦ position X k ω = x).card :=
      Nat.pos_of_ne_zero h
    obtain ⟨k, hk⟩ := Finset.card_pos.1 hpos
    rw [Finset.mem_filter] at hk
    rw [← hk.2]
    exact Finset.le_sup (f := fun j ↦ localTime X n ω (position X j ω)) hk.1

theorem mem_favouriteSites_iff {Ω : Type*} (X : ℕ → Ω → ℤ × ℤ) (n : ℕ) (ω : Ω)
    (x : ℤ × ℤ) : x ∈ favouriteSites X n ω ↔ localTime X n ω x = maxLocalTime X n ω := by
  constructor
  · intro hx
    refine le_antisymm (localTime_le_maxLocalTime X n ω x) ?_
    exact Finset.sup_le fun k _ ↦ hx _
  · intro h
    show ∀ y, localTime X n ω y ≤ localTime X n ω x
    intro y
    rw [h]
    exact localTime_le_maxLocalTime X n ω y

theorem erdos_1166_neg :
    ¬ (∀ {Ω : Type*} [MeasureSpace Ω] [IsProbabilityMeasure (ℙ : Measure Ω)] {X : ℕ → Ω → ℤ × ℤ} (hX : IsSimpleRandomWalkSteps X), ∃ C : ℕ, ∀ᵐ ω, ∀ᶠ n : ℕ in atTop, ((⋃ k ≤ n, favouriteSites X k ω).encard : ℝ≥0∞) ≤ ENNReal.ofReal (Real.log n ^ C)) := by
  sorry

end Erdos1166
