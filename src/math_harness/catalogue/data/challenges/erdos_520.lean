import Mathlib

open MeasureTheory ProbabilityTheory Nat Real Filter

namespace Erdos520

variable {Ω : Type*} [MeasureSpace Ω] [IsProbabilityMeasure (ℙ : Measure Ω)]

structure IsRademacherMultiplicative (f : ℕ → Ω → ℝ) : Prop where
  measurable_of_prime p : p.Prime → Measurable (f p)
  iIndepFun_primes : iIndepFun (fun p : Primes ↦ f p) ℙ
  prob_of_prime p : p.Prime → ℙ {ω | f p ω = 1} = 1 / 2 ∧ ℙ {ω | f p ω = -1} = 1 / 2
  map_one ω : f 1 ω = 1
  map_mul_of_coprime a b ω : a.Coprime b → f (a * b) ω = f a ω * f b ω
  map_of_not_squarefree n ω : ¬ Squarefree n → f n ω = 0

theorem erdos_520 :
    ¬ ∃ c > 0, ∀ (Ω : Type) [MeasureSpace Ω] [IsProbabilityMeasure (ℙ : Measure Ω)] (f : ℕ → Ω → ℝ), IsRademacherMultiplicative f → ∀ᵐ ω, limsup (fun N ↦ ∑ m ≤ N, f m ω / sqrt (N * log (log N))) atTop = c := by
  sorry

end Erdos520
