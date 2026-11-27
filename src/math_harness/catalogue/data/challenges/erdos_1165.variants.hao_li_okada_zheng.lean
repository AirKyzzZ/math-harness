import Mathlib

open MeasureTheory Filter

open scoped ProbabilityTheory ENNReal

namespace Erdos1165

def steps : Set (ℤ × ℤ) := {(1, 0), (-1, 0), (0, 1), (0, -1)}

structure IsSimpleRandomWalkSteps {Ω : Type*} [MeasureSpace Ω] (X : ℕ → Ω → ℤ × ℤ) : Prop where
  measurable (k : ℕ) : Measurable (X k)
  indep : ProbabilityTheory.iIndepFun X ℙ
  isUniform (k : ℕ) : MeasureTheory.pdf.IsUniform (X k) steps ℙ Measure.count

def position {Ω : Type*} (X : ℕ → Ω → ℤ × ℤ) (n : ℕ) (ω : Ω) : ℤ × ℤ :=
  ∑ k ∈ Finset.range n, X k ω

def localTime {Ω : Type*} (X : ℕ → Ω → ℤ × ℤ) (n : ℕ) (ω : Ω) (x : ℤ × ℤ) : ℕ :=
  ((Finset.range (n + 1)).filter fun k ↦ position X k ω = x).card

def favouriteSites {Ω : Type*} (X : ℕ → Ω → ℤ × ℤ) (n : ℕ) (ω : Ω) : Set (ℤ × ℤ) :=
  {x | ∀ y, localTime X n ω y ≤ localTime X n ω x}

theorem position_zero {Ω : Type*} (X : ℕ → Ω → ℤ × ℤ) (ω : Ω) : position X 0 ω = 0 := by
  simp [position]

theorem position_succ {Ω : Type*} (X : ℕ → Ω → ℤ × ℤ) (n : ℕ) (ω : Ω) :
    position X (n + 1) ω = position X n ω + X n ω := by
  simp [position, Finset.sum_range_succ]

def erdos_1165.answer (r : ℕ) : ℝ≥0∞ := if r = 3 then 1 else 0

theorem erdos_1165.variants.hao_li_okada_zheng {Ω : Type*} [MeasureSpace Ω] [IsProbabilityMeasure (ℙ : Measure Ω)] {X : ℕ → Ω → ℤ × ℤ} (hX : IsSimpleRandomWalkSteps X) :
    ∀ᵐ ω, limsup (fun n ↦ (favouriteSites X n ω).encard) atTop = 3 := by
  sorry

end Erdos1165
