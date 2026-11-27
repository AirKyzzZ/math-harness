import Mathlib

namespace Erdos461

def smoothComponent (t n : ℕ) : ℕ :=
  (n.primeFactorsList.filter (· < t)).prod

def f (n t : ℕ) : ℕ :=
  ((Finset.Icc (n + 1) (n + t)).image (smoothComponent t)).card

theorem erdos_461 :
    ∃ c : ℝ, 0 < c ∧ ∀ n t : ℕ, c * (t : ℝ) ≤ (f n t : ℝ) := by
  sorry

theorem smoothComponent_mem_smoothNumbers (t n : ℕ) : smoothComponent t n ∈ Nat.smoothNumbers t :=
  Nat.prod_mem_smoothNumbers n t

theorem smoothComponent_prime_pow {p : ℕ} (hp : p.Prime) (k t : ℕ) :
    smoothComponent t (p ^ k) = if p < t then p ^ k else 1 := by
  by_cases h : p < t <;> simp [smoothComponent, hp.primeFactorsList_pow, h]

theorem f_zero (n : ℕ) : f n 0 = 0 := by
  simp only [f, Nat.add_zero, Finset.Icc_eq_empty_of_lt (Nat.lt_add_one n), Finset.image_empty,
    Finset.card_empty]

theorem f_one (n : ℕ) : f n 1 = 1 := by
  simp only [f, Finset.Icc_self, Finset.image_singleton, Finset.card_singleton]

end Erdos461
