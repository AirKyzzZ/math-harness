import Mathlib

open Set Filter Pointwise Topology AdditiveCombinatorics

namespace Erdos1145

def Erdos1145Prop : Prop :=
  ∀ ⦃A B : Set ℕ⦄ (_ : A.Infinite) (_ : B.Infinite),
    Tendsto (fun n ↦ (Nat.nth (· ∈ A) n : ℝ) / (Nat.nth (· ∈ B) n : ℝ)) atTop (𝓝 1) →
    (∀ᶠ n in atTop, n ∈ A + B) →
    limsup (fun n => ↑(((𝟙_A ∗ 𝟙_B) : ℕ → ℕ) n)) atTop = (⊤ : ℕ∞)

theorem erdos_1145_neg :
    ¬ (Erdos1145Prop) := by
  sorry

theorem erdos_1145.test_implies_erdos_28 : Erdos1145Prop → type_of% Erdos28.erdos_28 := by
  delta sumRep
  intro h1145 s hs
  rcases hs.exists_le with ⟨m, hm⟩
  by_cases hfin : s.Finite
  · exact absurd hs (hfin.add hfin).infinite_compl
  · have hinf : s.Infinite := hfin
    refine h1145 hinf hinf ?_ ?_
    · refine Filter.Tendsto.congr' ?_ tendsto_const_nhds
      filter_upwards [Filter.eventually_gt_atTop 0] with n hn
      rw [div_self]
      exact mod_cast Nat.pos_iff_ne_zero.mp <|
        lt_of_lt_of_le hn (Nat.nth_strictMono hinf).le_apply
    · filter_upwards [Filter.eventually_gt_atTop m] with n hn
      by_contra hns
      exact not_le_of_gt hn (hm n hns)

end Erdos1145
