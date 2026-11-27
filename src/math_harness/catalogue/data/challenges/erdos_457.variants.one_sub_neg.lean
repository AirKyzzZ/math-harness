import Mathlib

namespace Erdos457

noncomputable abbrev q (n : ℕ) (k : ℝ) : ℕ :=
    Nat.find (Nat.exists_prime_not_dvd (n := ∏ i ∈ Finset.Icc 1 ⌊k⌋₊, (n + i))
      (Finset.prod_ne_zero_iff.2 fun a ha => by aesop))

theorem erdos_457.variants.qnk : ∃ ε > (0 : ℝ),
    { (n : ℕ) | (2 + ε) * Real.log n ≤ q n (Real.log n) }.Infinite := by
  obtain ⟨ε, hε, hinf⟩ := erdos_457
  refine ⟨ε, hε, hinf.mono ?_⟩
  intro n hn
  by_contra h
  obtain ⟨hp, hndvd⟩ : (q n (Real.log n)).Prime ∧
      ¬q n (Real.log n) ∣ ∏ i ∈ Finset.Icc 1 ⌊Real.log n⌋₊, (n + i) :=
    Nat.find_spec (Nat.exists_prime_not_dvd (Finset.prod_ne_zero_iff.2 fun a ha => by aesop))
  exact hndvd (hn _ (not_le.1 h).le hp)

theorem erdos_457.variants.one_sub_neg :
    ¬ (∃ ε > (0 : ℝ), ∀ᶠ n in Filter.atTop, q n (Real.log n) < (1 - ε) * Real.log n ^ 2) := by
  sorry

end Erdos457
