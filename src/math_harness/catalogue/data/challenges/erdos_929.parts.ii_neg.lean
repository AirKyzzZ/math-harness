import Mathlib

open Filter Asymptotics

namespace Erdos929

def AllHaveSmallPrimeFactor (x k n : ℕ) : Prop :=
  ∀ i ∈ Finset.Icc 1 k, ∃ p : ℕ, p.Prime ∧ p ≤ x ∧ p ∣ n + i

noncomputable def S (k : ℕ) : ℕ :=
  sInf {x : ℕ | {n : ℕ | AllHaveSmallPrimeFactor x k n}.HasPosDensity}

theorem S_le {k x : ℕ} (h : {n : ℕ | AllHaveSmallPrimeFactor x k n}.HasPosDensity) :
    S k ≤ x := by
  unfold S
  exact Nat.sInf_le h

theorem erdos_929.parts.ii_neg :
    ¬ (∀ ε : ℝ, 0 < ε → ∀ᶠ k : ℕ in atTop, (k : ℝ) ^ (1 - ε) ≤ (S k : ℝ)) := by
  sorry

end Erdos929
