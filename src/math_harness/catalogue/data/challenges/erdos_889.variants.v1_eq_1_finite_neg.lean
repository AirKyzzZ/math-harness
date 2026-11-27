import Mathlib

open Finset Nat Filter Topology

namespace Erdos889

def v (n k : ℕ) : ℕ :=
  ((n + k).primeFactors.filter (fun p =>
    ∀ i ∈ range k, ¬ p ∣ n + i)).card

noncomputable def v₀ (n : ℕ) : ℕ∞ :=
  ⨆ k, (v n k : ℕ∞)

noncomputable def v_l (l n : ℕ) : ℕ∞ :=
  ⨆ k ≥ l, (v n k : ℕ∞)

def V (n k : ℕ) : ℕ :=
  ((n + k).primeFactors.filter (fun p =>
    ∀ i ∈ range k, ¬ p ^ ((n + k).factorization p) ∣ n + i)).card

noncomputable def V_l (l n : ℕ) : ℕ∞ :=
  ⨆ k ≥ l, (V n k : ℕ∞)

theorem erdos_889.variants.V1_eq_1_finite_neg :
    ¬ ({n | V_l 1 n = 1}.Finite) := by
  sorry

end Erdos889
