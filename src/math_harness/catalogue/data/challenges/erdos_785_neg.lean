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

theorem erdos_785_neg :
    ¬ (∀ A B : Set ℕ, A.Infinite → B.Infinite → 0 ∉ A → 0 ∉ B → IsExactAdditiveComplement A B → Tendsto (fun x : ℕ => (counting A x * counting B x : ℝ) - (x : ℝ)) atTop atTop) := by
  sorry

end Erdos785
