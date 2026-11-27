import Mathlib

namespace Erdos359

open Filter Asymptotics

def IsGoodFor (A : ℕ → ℕ) (n : ℕ) : Prop := A 0 = n ∧ StrictMono A ∧
  ∀ j, IsLeast
    {m : ℕ | A j < m ∧ ∀ a b, Finset.Icc a b ⊆ Finset.Iic j → m ≠ ∑ i ∈ Finset.Icc a b, A i}
    (A <| j + 1)

theorem erdos_359.parts.ii (A : ℕ → ℕ) (hA : IsGoodFor A 1) (c : ℝ) (hc : 0 < c) :
    atTop.Tendsto (fun k ↦ A k / (k : ℝ) ^ (1 + c)) (nhds 0) := by
  sorry

end Erdos359
