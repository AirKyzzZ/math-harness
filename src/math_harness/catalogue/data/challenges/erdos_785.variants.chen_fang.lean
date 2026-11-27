import Mathlib

open Filter Pointwise

open scoped Topology

namespace Erdos785

noncomputable def counting (A : Set ℕ) (x : ℕ) : ℕ :=
  (A ∩ Set.Icc 1 x).ncard

noncomputable def aStar (A : Set ℕ) (x : ℕ) : ℕ :=
  sSup (A ∩ Set.Icc 1 x)

def IsExactAdditiveComplement (A B : Set ℕ) : Prop :=
  IsAdditiveComplement A B ∧
    Tendsto (fun x : ℕ => (counting A x * counting B x : ℝ) / (x : ℝ)) atTop (𝓝 1)

theorem erdos_785.variants.chen_fang (A B : Set ℕ) (hA : A.Infinite) (hB : B.Infinite) (hA₀ : 0 ∉ A) (hB₀ : 0 ∉ B) (h : IsExactAdditiveComplement A B) (M : ℝ) (hM : 1 < M) :
    ∀ᶠ x : ℕ in atTop, (min (counting A x) (counting B x) : ℝ) ^ M ≤ (counting A x * counting B x : ℝ) - (x : ℝ) := by
  sorry

end Erdos785
