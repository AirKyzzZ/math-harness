import Mathlib

open Filter Asymptotics Real

namespace Erdos17

def IsClusterPrime (p : ℕ) : Prop :=
  p.Prime ∧
    ∀ {n : ℕ}, Even n → n ≤ (p - 3 : ℤ) →
      ∃ q₁ q₂ : ℕ, q₁.Prime ∧ q₂.Prime ∧
        q₁ ≤ p ∧ q₂ ≤ p ∧ n = (q₁ - q₂ : ℤ)

theorem erdos_17 :
    {p : ℕ | IsClusterPrime p}.Infinite := by
  sorry

noncomputable def clusterPrimeCount (n : ℕ) : ℕ :=
  Nat.card {p : ℕ | p ≤ n ∧ IsClusterPrime p}

theorem isClusterPrime_97_isLeast_non_cluster : IsLeast {p : ℕ | p.Prime ∧ ¬ IsClusterPrime p} 97 := by
  -- For a prime `p`, being a cluster prime is equivalent to a fully bounded
  -- (hence decidable) statement over `ℕ`: every even `n ≤ p - 3` is `q₁ - q₂`
  -- for primes `q₁, q₂ ≤ p`, which (since `n ≥ 0`) amounts to a prime `q₂ ≤ p`
  -- with `q₂ + n` again prime and `≤ p`.
  have cluster_iff : ∀ p : ℕ, p.Prime →
      (IsClusterPrime p ↔
        (∀ n ∈ Finset.range (p - 2), Even n →
          ∃ q₂ ∈ Finset.range (p + 1), (Nat.Prime q₂) ∧ Nat.Prime (q₂ + n) ∧ q₂ + n ≤ p)) := by
    intro p hp
    constructor
    · rintro ⟨-, h⟩ n hn hev
      simp only [Finset.mem_range] at hn
      have hn3 : (n : ℤ) ≤ (p - 3 : ℤ) := by omega
      obtain ⟨q₁, q₂, hq1p, hq2p, hq1le, hq2le, heq⟩ := h hev hn3
      refine ⟨q₂, ?_, hq2p, ?_, ?_⟩
      · simp only [Finset.mem_range]; omega
      · have hq2n : q₂ + n = q₁ := by omega
        rw [hq2n]; exact hq1p
      · omega
    · intro h
      refine ⟨hp, ?_⟩
      intro n hev hn3
      have hnp : n ≤ p - 3 := by omega
      have hnrange : n ∈ Finset.range (p - 2) := by
        simp only [Finset.mem_range]; omega
      obtain ⟨q₂, hq2r, hq2p, hq1p, hle⟩ := h n hnrange hev
      refine ⟨q₂ + n, q₂, hq1p, hq2p, hle, ?_, ?_⟩
      · simp only [Finset.mem_range] at hq2r; omega
      · push_cast; ring
  constructor
  · -- `97` is prime but not a cluster prime: the even number `88 ≤ 94` is not a
    -- difference of two primes `≤ 97`.
    refine ⟨by norm_num, ?_⟩
    rw [cluster_iff 97 (by norm_num)]
    simp only [Nat.reduceSub, Finset.mem_range, Nat.reduceAdd, not_forall, not_exists, not_and,
      not_le]
    refine ⟨88, by norm_num, by norm_num, ?_⟩
    intro x xl hx xl
    suffices 9 < x by
      lia
    contrapose! xl
    interval_cases x <;> norm_num
    · contrapose hx
      exact Nat.not_prime_one
    · contrapose hx
      norm_num
  · -- `97` is a lower bound: every prime `< 97` is a cluster prime, so cannot lie
    -- in the set of non-cluster primes.
    rintro b ⟨hbp, hbnc⟩
    by_contra! hlt
    interval_cases b <;>
      first
        | exact absurd hbp (by decide)
        | exact hbnc ((cluster_iff _ (by norm_num)).mpr (by set_option maxRecDepth 8000 in decide))

end Erdos17
