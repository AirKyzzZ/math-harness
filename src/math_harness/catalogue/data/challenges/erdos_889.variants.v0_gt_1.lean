import Mathlib

open Finset Nat Filter Topology

namespace Erdos889

def v (n k : ℕ) : ℕ :=
  ((n + k).primeFactors.filter (fun p =>
    ∀ i ∈ range k, ¬ p ∣ n + i)).card

noncomputable def v₀ (n : ℕ) : ℕ∞ :=
  ⨆ k, (v n k : ℕ∞)

theorem erdos_889.variants.v0_gt_1 :
    ∀ n : ℕ, n ∉ ({0, 1, 2, 3, 4, 7, 8, 16} : Finset ℕ) → 1 < v₀ n := by
  sorry

noncomputable def v_l (l n : ℕ) : ℕ∞ :=
  ⨆ k ≥ l, (v n k : ℕ∞)

def V (n k : ℕ) : ℕ :=
  ((n + k).primeFactors.filter (fun p =>
    ∀ i ∈ range k, ¬ p ^ ((n + k).factorization p) ∣ n + i)).card

noncomputable def V_l (l n : ℕ) : ℕ∞ :=
  ⨆ k ≥ l, (V n k : ℕ∞)

end Erdos889
