import Mathlib

open Filter

open scoped ENNReal

namespace Erdos1217

noncomputable def doublyHarmonicWeight (n : ℕ) : ℝ :=
  if 2 ≤ n then ((n : ℝ) * Real.log n)⁻¹ else 0

noncomputable def lowerLogDensity (A : Set ℕ) : ℝ≥0∞ :=
  open scoped Classical in
  liminf (fun x : ℝ ↦ ENNReal.ofReal
    ((∑ n ∈ (Finset.Ico 1 ⌈x⌉₊).filter (· ∈ A), (n : ℝ)⁻¹) / Real.log x)) atTop

noncomputable def weightedRate (A : Set ℕ) : ℝ≥0∞ :=
  open scoped Classical in
  limsup (fun x : ℝ ↦ ENNReal.ofReal
    ((∑ n ∈ (Finset.Ico 1 ⌈x⌉₊).filter (· ∈ A), doublyHarmonicWeight n) /
      Real.log (Real.log x))) atTop

noncomputable def chainRate (c : ℕ → ℕ) : ℝ≥0∞ :=
  open scoped Classical in
  limsup (fun x : ℝ ↦ ENNReal.ofReal
    ((((Finset.Ico 1 ⌈x⌉₊).filter (· ∈ Set.range c)).card : ℝ) /
      Real.log (Real.log x))) atTop

theorem erdos_1217 :
    ∀ a : ℕ → ℕ, StrictMono a → (∀ i, 0 < a i) → 0 < lowerLogDensity (Set.range a) → ∃ n : ℕ → ℕ, StrictMono n ∧ (∀ i, a (n i) ∣ a (n (i + 1))) ∧ weightedRate (Set.range a) ≤ chainRate (a ∘ n) := by
  sorry

end Erdos1217
