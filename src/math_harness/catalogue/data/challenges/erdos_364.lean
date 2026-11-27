import Mathlib

open Nat

namespace Erdos364

theorem erdos_364 :
    ¬ ∃ (n : ℕ), Powerful n ∧ Powerful (n + 1) ∧ Powerful (n + 2) := by
  sorry

theorem erdos_364.variants.weak :
    ¬ ∃ (n : ℕ), Powerful n ∧ Powerful (n + 1) ∧ Powerful (n + 2) ∧ Powerful (n + 3) := by
  intro h
  obtain ⟨n, hn⟩ := h
  have h2mod4 : n % 4 = 2 ∨ (n + 1) % 4 = 2 ∨ (n + 2) % 4 = 2 ∨ (n + 3) % 4 = 2 := by omega
  rcases h2mod4 with (_|_|_|_) <;>
  simp_all [not_full_of_prime_mod_prime_sq _ 1 (Nat.prime_two)]

end Erdos364
