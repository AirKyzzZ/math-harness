import Mathlib

open Nat Set Filter

open scoped Topology

namespace Erdos342

def UniqueUlamSum (a : ℕ → ℕ) (n m : ℕ) : Prop :=
  ∃! p : ℕ × ℕ, p.1 < p.2 ∧ p.2 < n ∧ m = a p.1 + a p.2

def IsUlamSequence (a : ℕ → ℕ) : Prop :=
  a 0 = 1 ∧ a 1 = 2 ∧
  ∀ n, 2 ≤ n →
    a (n - 1) < a n ∧
    UniqueUlamSum a n (a n) ∧
    ∀ m, a (n - 1) < m → m < a n → ¬ UniqueUlamSum a n m

theorem erdos_342.test.a0 : ∀ a : ℕ → ℕ, IsUlamSequence a → a 0 = 1 := by
  intro a ⟨ha0, _, _⟩; exact ha0

theorem erdos_342.test.a1 : ∀ a : ℕ → ℕ, IsUlamSequence a → a 1 = 2 := by
  intro a ⟨_, ha1, _⟩; exact ha1

theorem erdos_342.test.a2 : ∀ a : ℕ → ℕ, IsUlamSequence a → a 2 = 3 := by
  intro a ⟨ha0, ha1, ha⟩
  obtain ⟨_, ⟨⟨i, j⟩, ⟨hij, hj, hsum⟩, _⟩, _⟩ := ha 2 (by omega)
  interval_cases j <;> simp_all only [lt_one_iff, not_lt_zero]

theorem erdos_342.test.a3 : ∀ a : ℕ → ℕ, IsUlamSequence a → a 3 = 4 := by
  intro a ⟨ha0, ha1, ha⟩
  have ha2 := erdos_342.test.a2 a ⟨ha0, ha1, ha⟩
  obtain ⟨hinc, ⟨⟨i, j⟩, ⟨hij, hj, hsum⟩, _⟩, hmin⟩ := ha 3 (by omega)
  simp only [show (3 : ℕ) - 1 = 2 from rfl] at hinc hmin
  -- hinc : a 2 < a 3, hmin : ∀ m, a 2 < m → m < a 3 → ¬UniqueUlamSum a 3 m
  -- hsum : a 3 = a i + a j, hij : i < j, hj : j < 3
  -- Enumerate j ∈ {0, 1, 2}
  interval_cases j
  · -- j = 0: i < 0 impossible
    omega
  · -- j = 1: i = 0, so a 3 = a 0 + a 1 = 1 + 2 = 3, but a 3 > a 2 = 3
    have hi : i = 0 := by omega
    subst hi; rw [ha0, ha1] at hsum; rw [ha2] at hinc; omega
  · -- j = 2
    interval_cases i
    · -- i = 0: a 3 = a 0 + a 2 = 1 + 3 = 4
      rw [ha0, ha2] at hsum; exact hsum
    · -- i = 1: a 3 = a 1 + a 2 = 2 + 3 = 5
      rw [ha1, ha2] at hsum
      -- hsum : a 3 = 5. Use minimality: m = 4 has unique sum, contradiction.
      exfalso
      have h4 := hmin 4 (by rw [ha2]; omega) (by omega)
      apply h4
      -- Goal: UniqueUlamSum a 3 4, i.e. ∃! (p : ℕ × ℕ), p.1 < p.2 ∧ p.2 < 3 ∧ 4 = a p.1 + a p.2
      -- Witness: (0, 2) since a 0 + a 2 = 1 + 3 = 4
      refine ⟨⟨0, 2⟩, ⟨by omega, by omega, by rw [ha0, ha2]⟩, ?_⟩
      -- Uniqueness: check all pairs (i', j') with i' < j' < 3
      rintro ⟨i', j'⟩ ⟨hij', hj', hsum'⟩
      simp only [Prod.mk.injEq]
      interval_cases j'
      · omega
      · interval_cases i'
        · rw [ha0, ha1] at hsum'; omega
      · interval_cases i'
        · rw [ha0, ha2] at hsum'; constructor <;> omega
        · rw [ha1, ha2] at hsum'; omega

theorem erdos_342.parts.i :
    ∀ a : ℕ → ℕ, IsUlamSequence a → Set.Infinite {n : ℕ | ∃ m, a m = a n + 2} := by
  sorry

end Erdos342
