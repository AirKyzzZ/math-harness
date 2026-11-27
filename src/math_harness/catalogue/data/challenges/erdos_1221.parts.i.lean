import Mathlib

open Filter

open scoped ENNReal

namespace Erdos1221

noncomputable def pts (a : ℕ → ℝ) (n : ℕ) : Fin n → ℝ := fun j => Int.fract (a j)

noncomputable def sortedPoint (a : ℕ → ℝ) (n : ℕ) : Fin n → ℝ :=
  pts a n ∘ Tuple.sort (pts a n)

noncomputable def unrolled (a : ℕ → ℝ) (n j : ℕ) : ℝ :=
  if h : 0 < n then sortedPoint a n ⟨j % n, Nat.mod_lt j h⟩ + ((j / n : ℕ) : ℝ) else 0

noncomputable def rSpan (a : ℕ → ℝ) (n r i : ℕ) : ℝ := unrolled a n (i + r) - unrolled a n i

noncomputable def maxSpan (a : ℕ → ℝ) (n r : ℕ) : ℝ := ⨆ i : Fin n, rSpan a n r i

noncomputable def minSpan (a : ℕ → ℝ) (n r : ℕ) : ℝ := ⨅ i : Fin n, rSpan a n r i

noncomputable def bigLambda (r : ℕ) : ℝ≥0∞ :=
  ⨅ (a : ℕ → ℝ) (_ : Function.Injective fun k ↦ Int.fract (a k)),
    limsup (fun n : ℕ => ENNReal.ofReal ((n : ℝ) * maxSpan a n r)) atTop

noncomputable def smallLambda (r : ℕ) : ℝ≥0∞ :=
  ⨆ (a : ℕ → ℝ) (_ : Function.Injective fun k ↦ Int.fract (a k)),
    liminf (fun n : ℕ => ENNReal.ofReal ((n : ℝ) * minSpan a n r)) atTop

noncomputable def mu (r : ℕ) : ℝ≥0∞ :=
  ⨅ (a : ℕ → ℝ) (_ : Function.Injective fun k ↦ Int.fract (a k)),
    limsup (fun n : ℕ => ENNReal.ofReal (maxSpan a n r) / ENNReal.ofReal (minSpan a n r)) atTop

theorem erdos_1221.parts.i :
    ∀ K : ℝ, ∀ᶠ r : ℕ in atTop, ENNReal.ofReal ((r : ℝ) + K) < bigLambda r := by
  sorry

end Erdos1221
