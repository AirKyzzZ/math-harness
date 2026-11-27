import Mathlib

open Filter Asymptotics

namespace Erdos49

noncomputable def f (N : ℕ) : ℕ :=
  sSup {k | ∃ A : Finset ℕ, A ⊆ Finset.Icc 1 N ∧ StrictMonoOn Nat.totient (A : Set ℕ) ∧
    A.card = k}

noncomputable def g (N : ℕ) : ℕ :=
  sSup {k | ∃ A : Finset ℕ, A ⊆ Finset.Icc 1 N ∧ MonotoneOn Nat.totient (A : Set ℕ) ∧
    A.card = k}

theorem erdos_49.variants.primes_maximal_neg :
    ¬ (∀ N : ℕ, 2 ≤ N → f N = Nat.primeCounting N) := by
  sorry

end Erdos49
