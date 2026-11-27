import Mathlib

namespace Erdos730

abbrev S :=
  {(n, m) : ℕ × ℕ | n < m ∧ n.centralBinom.primeFactors = m.centralBinom.primeFactors}

theorem erdos_730_neg :
    ¬ (S.Infinite) := by
  sorry

theorem erdos_730.variants.explicit_pairs :
    {(87, 88), (607, 608)} ⊆ S := by
  rintro _ (rfl | rfl) <;> refine ⟨by decide, ?_⟩
  all_goals
    simp only [Nat.centralBinom, Nat.choose_eq_descFactorial_div_factorial]
    decide +kernel

theorem erdos_730.variants.delta_ne_one : ∃ (n m : ℕ), (n, m) ∈ S ∧ m ≠ n + 1 := by
  dsimp [S]
  use 10003
  use 10005
  norm_num [Finset.ext_iff, Nat.choose_eq_zero_iff, Nat.centralBinom]
  simp_rw [Nat.choose_eq_descFactorial_div_factorial]
  intro p hp
  constructor
  all_goals exact fun h' => or_self_iff.1 (hp.dvd_mul.1 (
    h'.trans (by refine' of_decide_eq_true (by constructor : _ = ↑_))))

end Erdos730
