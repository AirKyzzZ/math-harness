import Mathlib

namespace Erdos937

open Nat

def IsCoprimePowerfulAP4 (a d : ℕ) : Prop :=
  0 < d ∧
  a.Powerful ∧ (a + d).Powerful ∧ (a + 2 * d).Powerful ∧ (a + 3 * d).Powerful ∧
  a.Coprime (a + d) ∧ a.Coprime (a + 2 * d) ∧ a.Coprime (a + 3 * d) ∧
  (a + d).Coprime (a + 2 * d) ∧ (a + d).Coprime (a + 3 * d) ∧ (a + 2 * d).Coprime (a + 3 * d)

theorem erdos_937 :
    {p : ℕ × ℕ | IsCoprimePowerfulAP4 p.1 p.2}.Infinite := by
  sorry

theorem not_isCoprimePowerfulAP4_zero_one : ¬ IsCoprimePowerfulAP4 0 1 := by
  intro h
  obtain ⟨-, -, -, h2, -⟩ := h
  exact Nat.not_full_of_prime_mod_prime_sq 2 1 Nat.prime_two (by norm_num) h2

end Erdos937
