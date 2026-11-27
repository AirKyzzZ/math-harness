import Mathlib

open scoped Nat

namespace Erdos405

theorem erdos_405 :
    Set.Finite { x : ℕ × ℕ × ℕ | let (a, k, p) := x; p.Prime ∧ Odd p ∧ Nat.factorial (p - 1) + a ^ (p - 1) = p ^ k} := by
  sorry

theorem erdos_405.variants.nonodd_p :
    Set.Infinite { x : ℕ × ℕ × ℕ | let (a, k, p) := x; p.Prime ∧
      Nat.factorial (p - 1) + a ^ (p - 1) = p ^ k} := by
  -- Provide the infinite family of solutions
  apply Set.infinite_of_injective_forall_mem (f := fun k ↦ (2^k - 1, k, 2))
  · -- 1. Prove the function is injective
    intro x y h
    -- Simplify the tuple equality to individual components
    simp only [Prod.mk.injEq] at h
    -- The second component equality is exactly x = y
    exact h.2.1
  · -- 2. Prove all generated tuples belong to the set
    intro k
    simp only [Set.mem_ofPred_eq]
    -- Split into proving p is prime and the equation holds
    refine ⟨Nat.prime_two, ?_⟩
    -- Since p = 2, 2 - 1 = 1, so the equation simplifies definitionally
    change 1 + (2^k - 1)^1 = 2^k
    rw [pow_one]
    -- Prove 2^k is strictly positive so that (2^k - 1) doesn't underflow in Nat
    have h : 0 < 2^k := by positivity
    -- omega handles the Presburger arithmetic
    omega

end Erdos405
