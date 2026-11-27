import Mathlib

namespace Erdos676

open Filter

theorem representation_iff_mod (n : ℕ) :
    (∃ a p b : ℕ, p.Prime ∧ 1 ≤ a ∧ b < p ∧ n = a * p ^ 2 + b) ↔
      ∃ p : ℕ, p.Prime ∧ p ^ 2 ≤ n ∧ n % p ^ 2 < p := by
  constructor
  · rintro ⟨a, p, b, hp, ha, hb, rfl⟩
    refine ⟨p, hp, ?_, ?_⟩
    · nlinarith
    · have hb' : b < p ^ 2 := by
        have := hp.two_le
        nlinarith
      simpa [Nat.add_mod, Nat.mul_mod, Nat.mod_eq_of_lt hb'] using hb
  · rintro ⟨p, hp, hn, hr⟩
    refine ⟨n / p ^ 2, p, n % p ^ 2, hp, ?_, hr, ?_⟩
    · exact Nat.div_pos hn (pow_pos hp.pos _)
    · simpa [Nat.mul_comm, Nat.add_comm] using (Nat.mod_add_div n (p ^ 2)).symm

theorem not_representable_35 :
    ¬ ∃ a p b : ℕ, p.Prime ∧ 1 ≤ a ∧ b < p ∧ 35 = a * p ^ 2 + b := by
  rw [representation_iff_mod]
  rintro ⟨p, hp, hn, hr⟩
  have hp6 : p < 6 := by nlinarith
  have hc : ∀ q : Fin 6, ¬ (q.val.Prime ∧ q.val ^ 2 ≤ 35 ∧ 35 % q.val ^ 2 < q.val) :=
    by decide
  exact hc ⟨p, hp6⟩ ⟨hp, hn, hr⟩

theorem not_representable_899 :
    ¬ ∃ a p b : ℕ, p.Prime ∧ 1 ≤ a ∧ b < p ∧ 899 = a * p ^ 2 + b := by
  rw [representation_iff_mod]
  rintro ⟨p, hp, hn, hr⟩
  have hp30 : p < 30 := by nlinarith
  have hc : ∀ q : Fin 30, ¬ (q.val.Prime ∧ q.val ^ 2 ≤ 899 ∧ 899 % q.val ^ 2 < q.val) :=
    by decide
  exact hc ⟨p, hp30⟩ ⟨hp, hn, hr⟩

theorem erdos_676 :
    ∀ᶠ n in atTop, ∃ a p b : ℕ, p.Prime ∧ 1 ≤ a ∧ b < p ∧ n = a * p ^ 2 + b := by
  sorry

end Erdos676
