import Mathlib

open Nat Set

namespace Erdos1209

theorem exists_prime_gt_not_prime_add (k m : ℕ) (hk : 1 ≤ k) :
    ∃ p, m < p ∧ p.Prime ∧ ¬ (k + p).Prime := by
  obtain ⟨q, hqk, hq⟩ := Nat.exists_infinite_primes (k + 1)
  have : NeZero q := ⟨hq.ne_zero⟩
  have hunit : IsUnit (-(k : ZMod q)) := by
    refine IsUnit.neg ?_
    rw [ZMod.isUnit_iff_coprime]
    exact (Nat.coprime_comm.1 ((Nat.Prime.coprime_iff_not_dvd hq).2
      (Nat.not_dvd_of_pos_of_lt (by omega) (by omega))))
  obtain ⟨p, hp, hpp, hpq⟩ := Nat.forall_exists_prime_gt_and_eq_mod hunit (max m q)
  refine ⟨p, by omega, hpp, ?_⟩
  have hdvd : q ∣ k + p := by
    rw [← ZMod.natCast_eq_zero_iff, Nat.cast_add, hpq]
    ring
  exact Nat.not_prime_of_dvd_of_lt hdvd hq.two_le (by omega)

noncomputable def seq (f : ℕ → ℕ) : ℕ → ℕ
  | 0 => Classical.choose (Nat.exists_infinite_primes (f 0))
  | k + 1 => Classical.choose (exists_prime_gt_not_prime_add (k + 1) (max (seq f k) (f (k + 1)))
      (by omega))

theorem seq_zero_spec (f : ℕ → ℕ) : f 0 ≤ seq f 0 ∧ (seq f 0).Prime :=
  Classical.choose_spec (Nat.exists_infinite_primes (f 0))

theorem seq_succ_spec (f : ℕ → ℕ) (k : ℕ) :
    max (seq f k) (f (k + 1)) < seq f (k + 1) ∧ (seq f (k + 1)).Prime ∧
      ¬ ((k + 1) + seq f (k + 1)).Prime :=
  Classical.choose_spec (exists_prime_gt_not_prime_add (k + 1) (max (seq f k) (f (k + 1)))
    (by omega))

theorem erdos_1209.parts.i :
    ¬ ∃ f : ℕ → ℕ, ∀ a : ℕ → ℕ, StrictMono a → (∀ k, f k ≤ a k) →
      (∃ n, ∀ k, (n + a k).Prime) →
      {n | ∀ k, (n + a k).Prime}.Infinite := by
  rintro ⟨f, hf⟩
  have hmono : StrictMono (seq f) :=
    strictMono_nat_of_lt_succ fun k => lt_of_le_of_lt (le_max_left _ _) (seq_succ_spec f k).1
  have hbound : ∀ k, f k ≤ seq f k := by
    intro k
    cases k with
    | zero => exact (seq_zero_spec f).1
    | succ k => exact (lt_of_le_of_lt (le_max_right _ _) (seq_succ_spec f k).1).le
  have hprime : ∀ k, (seq f k).Prime := by
    intro k
    cases k with
    | zero => exact (seq_zero_spec f).2
    | succ k => exact (seq_succ_spec f k).2.1
  have hinf := hf (seq f) hmono hbound ⟨0, fun k => by simpa using hprime k⟩
  -- but the set is contained in `{0}`
  refine hinf ((Set.finite_singleton 0).subset fun n hn => ?_)
  rw [Set.mem_singleton_iff]
  by_contra hn0
  exact (seq_succ_spec f (n - 1)).2.2 (by
    have := hn n
    rwa [show n - 1 + 1 = n by omega] )

theorem exists_prime_gt_not_squarefree_add (k m : ℕ) (hk : 1 ≤ k) :
    ∃ p, m < p ∧ p.Prime ∧ ¬ Squarefree (k + p) := by
  obtain ⟨q, hqk, hq⟩ := Nat.exists_infinite_primes (k + 1)
  have : NeZero (q ^ 2) := ⟨pow_ne_zero 2 hq.ne_zero⟩
  have hunit : IsUnit (-(k : ZMod (q ^ 2))) := by
    refine IsUnit.neg ?_
    rw [ZMod.isUnit_iff_coprime]
    exact Nat.Coprime.pow_right 2 (Nat.coprime_comm.1 ((Nat.Prime.coprime_iff_not_dvd hq).2
      (Nat.not_dvd_of_pos_of_lt (by omega) (by omega))))
  obtain ⟨p, hp, hpp, hpq⟩ := Nat.forall_exists_prime_gt_and_eq_mod hunit m
  refine ⟨p, hp, hpp, ?_⟩
  have hdvd : q ^ 2 ∣ k + p := by
    rw [← ZMod.natCast_eq_zero_iff, Nat.cast_add, hpq]
    ring
  rw [Nat.squarefree_iff_prime_squarefree]
  push Not
  exact ⟨q, hq, by rwa [← sq]⟩

noncomputable def seq' (f : ℕ → ℕ) : ℕ → ℕ
  | 0 => Classical.choose (Nat.exists_infinite_primes (f 0))
  | k + 1 => Classical.choose (exists_prime_gt_not_squarefree_add (k + 1)
      (max (seq' f k) (f (k + 1))) (by omega))

theorem seq'_succ_spec (f : ℕ → ℕ) (k : ℕ) :
    max (seq' f k) (f (k + 1)) < seq' f (k + 1) ∧ (seq' f (k + 1)).Prime ∧
      ¬ Squarefree ((k + 1) + seq' f (k + 1)) :=
  Classical.choose_spec (exists_prime_gt_not_squarefree_add (k + 1) (max (seq' f k) (f (k + 1)))
    (by omega))

theorem erdos_1209.parts.ii :
    ¬ ∃ f : ℕ → ℕ, ∀ a : ℕ → ℕ, StrictMono a → (∀ k, f k ≤ a k) →
      (∃ n, ∀ k, Squarefree (n + a k)) →
      {n | ∀ k, Squarefree (n + a k)}.Infinite := by
  rintro ⟨f, hf⟩
  have h0 := Classical.choose_spec (Nat.exists_infinite_primes (f 0))
  have hmono : StrictMono (seq' f) :=
    strictMono_nat_of_lt_succ fun k => lt_of_le_of_lt (le_max_left _ _) (seq'_succ_spec f k).1
  have hbound : ∀ k, f k ≤ seq' f k := by
    intro k
    cases k with
    | zero => exact h0.1
    | succ k => exact (lt_of_le_of_lt (le_max_right _ _) (seq'_succ_spec f k).1).le
  have hprime : ∀ k, (seq' f k).Prime := by
    intro k
    cases k with
    | zero => exact h0.2
    | succ k => exact (seq'_succ_spec f k).2.1
  have hinf := hf (seq' f) hmono hbound
    ⟨0, fun k => by simpa using (hprime k).prime.squarefree⟩
  refine hinf ((Set.finite_singleton 0).subset fun n hn => ?_)
  rw [Set.mem_singleton_iff]
  by_contra hn0
  exact (seq'_succ_spec f (n - 1)).2.2 (by
    have := hn n
    rwa [show n - 1 + 1 = n by omega])

theorem erdos_1209.parts.iii.a_neg :
    ¬ (¬ ∃ n : ℕ, ∀ k : ℕ, (n + 2 ^ (2 ^ k)).Prime) := by
  sorry

end Erdos1209
