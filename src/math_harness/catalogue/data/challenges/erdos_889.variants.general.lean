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

theorem erdos_889.variants.general :
    ∀ l, Tendsto (v_l l) atTop (𝓝 ⊤) := by
  sorry

def V (n k : ℕ) : ℕ :=
  ((n + k).primeFactors.filter (fun p =>
    ∀ i ∈ range k, ¬ p ^ ((n + k).factorization p) ∣ n + i)).card

noncomputable def V_l (l n : ℕ) : ℕ∞ :=
  ⨆ k ≥ l, (V n k : ℕ∞)

end Erdos889
