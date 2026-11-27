import Mathlib

open MeasureTheory Filter

open scoped ProbabilityTheory Topology Real

namespace Erdos522

@[ext]
structure KacCoefficients
    {k : Type*} [Field k] [MeasurableSpace k] (S : Set k)
    (Ω : Type*) [MeasureSpace Ω] (μ : Measure k := Measure.count) where
  toFun : ℕ → Ω → k
  h_indep : ProbabilityTheory.iIndepFun toFun ℙ
  h_unif : ∀ i, MeasureTheory.pdf.IsUniform (toFun i) S ℙ μ

variable {k : Type*} [Field k] [MeasurableSpace k] (S : Set k)

    (Ω : Type*) [MeasureSpace Ω] (μ : Measure k := Measure.count)

instance : FunLike (KacCoefficients S Ω μ) ℕ (Ω → k) where
  coe P := P.toFun
  coe_injective P Q h := by aesop

namespace KacCoefficients

open scoped Polynomial

variable {S Ω} {μ : Measure k}

noncomputable def polynomial (c : KacCoefficients S Ω μ) (n : ℕ) :
    Ω → k[X] := fun ω => ∑ i ∈ Finset.range (n + 1), Polynomial.monomial i (c i ω)

noncomputable def roots (c : KacCoefficients S Ω μ) (n : ℕ) : Ω → Multiset k :=
    fun ω => (c.polynomial n ω).roots

noncomputable def numRootsInUnitDisk [PseudoMetricSpace k] (c : KacCoefficients S Ω μ) (n : ℕ)
    (ω : Ω) : ℕ :=
  open scoped Classical in
  (c.roots n ω).countP (· ∈ Metric.closedBall 0 1)

end KacCoefficients

theorem erdos_522.variants.zero_one :
    ∀ {Ω : Type*} [MeasureSpace Ω] [IsProbabilityMeasure (ℙ : Measure Ω)] {n : ℕ} (hn : 1 ≤ n) (f : KacCoefficients ({0, 1} : Set ℂ) Ω), ℙ {ω | atTop.Tendsto (fun n : ℕ ↦ (2 * f.numRootsInUnitDisk n ω : ℝ) / n) (𝓝 1)} = 1 := by
  sorry

end Erdos522
