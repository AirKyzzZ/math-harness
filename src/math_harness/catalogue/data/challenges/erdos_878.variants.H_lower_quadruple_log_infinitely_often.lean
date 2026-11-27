import Mathlib

open Filter Asymptotics

open scoped Topology Real

namespace Erdos878

noncomputable def f (n : ℕ) : ℕ :=
  ∑ p ∈ n.primeFactors, p ^ Nat.log p n

open scoped Classical in
noncomputable def F (n : ℕ) : ℕ :=
  ((Finset.Icc 2 n).powerset.filter fun A ↦
    A ⊆ Finset.Icc 2 n ∧
      (A : Set ℕ).Pairwise (fun a b ↦ Nat.Coprime a b) ∧
      ∀ a ∈ A, ∀ p, p.Prime → p ∣ a → p ∣ n).sup fun A ↦ ∑ a ∈ A, a

noncomputable def maxUpTo (g : ℕ → ℕ) (x : ℕ) : ℕ :=
  (Finset.range (x + 1)).sup g

noncomputable def H (x : ℕ) : ℝ :=
  ∑ n ∈ Finset.Ico 1 x, (f n : ℝ) / n

theorem erdos_878.variants.H_lower_quadruple_log_infinitely_often :
    ∃ c : ℝ, 0 < c ∧ ∃ᶠ x : ℕ in atTop, c * ((x : ℝ) * Real.log (Real.log (Real.log (Real.log (x : ℝ))))) ≤ H x := by
  sorry

noncomputable def h (x : ℕ) : ℕ :=
  maxUpTo (fun n ↦ n.primeFactors.card) x

noncomputable def m (x : ℕ) : ℕ := maxUpTo f x

end Erdos878
