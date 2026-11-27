import Mathlib

namespace Erdos418

theorem erdos_418.variants.conditional
    (goldbach : ∀ (n : ℕ), 6 < n → Even n → ∃ p q, p ≠ q ∧ p.Prime ∧ q.Prime ∧ n = p + q)
    (m : ℕ) (h : Odd m) :
    ∃ n, m + n.totient = n := by
  obtain rfl | rfl | rfl | h7m : m = 1 ∨ m = 3 ∨ m = 5 ∨ 7 ≤ m := by
    obtain ⟨m, rfl⟩ := h
    omega
  · exact ⟨2, rfl⟩
  · exact ⟨9, rfl⟩
  · exact ⟨25, rfl⟩
  obtain ⟨p, q, hpq, hp, hq, hm⟩ := goldbach (m + 1) (by omega) (by simpa [parity_simps])
  use p * q
  have h2p : 2 ≤ p := hp.two_le
  have h2q : 2 ≤ q := hq.two_le
  rw [Nat.totient_mul, Nat.totient_prime hp, Nat.totient_prime hq]
  · obtain ⟨p, rfl⟩ := le_iff_exists_add'.1 h2p
    obtain ⟨q, rfl⟩ := le_iff_exists_add'.1 h2q
    simp only [Nat.add_one_sub_one]
    linear_combination hm
  rwa [Nat.coprime_primes hp hq]

theorem erdos_418.variants.seven_mem_cototient :
    7 ∈ { (n - n.totient : ℕ) | n } :=
  ⟨15, by decide⟩

theorem erdos_418.variants.density :
    0 < { (n - n.totient : ℕ) | n }ᶜ.lowerDensity := by
  sorry

end Erdos418
