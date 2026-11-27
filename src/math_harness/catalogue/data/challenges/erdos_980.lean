import Mathlib

open Filter Asymptotics

namespace Erdos980

noncomputable def leastNonresidue (k p : ℕ) : ℕ :=
  sInf {n : ℕ | 0 < n ∧ ¬ ∃ x : ZMod p, x ^ k = (n : ZMod p)}

noncomputable def residueSum (k : ℕ) (x : ℝ) : ℝ :=
  ∑ p ∈ (Nat.primesBelow ⌈x⌉₊).filter (fun p ↦ p % k = 1), (leastNonresidue k p : ℝ)

theorem leastNonresidue_two_three : leastNonresidue 2 3 = 2 := by
  have h2 : 2 ∈ {n : ℕ | 0 < n ∧ ¬ ∃ x : ZMod 3, x ^ 2 = (n : ZMod 3)} :=
    ⟨by norm_num, by decide⟩
  refine le_antisymm (Nat.sInf_le h2) (le_csInf ⟨2, h2⟩ ?_)
  rintro n ⟨hn, hn'⟩
  by_contra! h
  have h1 : n = 1 := by omega
  subst h1
  exact hn' ⟨1, by decide⟩

theorem erdos_980 (k : ℕ) (hk : 2 ≤ k) :
    ∃ c > (0 : ℝ), residueSum k ~[atTop] fun x ↦ c * x / Real.log x := by
  sorry

end Erdos980
