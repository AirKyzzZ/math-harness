import Mathlib

open Filter Finset Real Nat Set

open scoped Topology

namespace Erdos25

theorem erdos_25 :
    ∀ (seq_n : ℕ → ℕ) (seq_a : ℕ → ℤ), (∀ i, 0 < seq_n i) → StrictMono seq_n → ∃ d, Set.HasLogDensity { x : ℕ | ∀ i, (x : ℤ) < seq_n i ∨ ¬((x : ℤ) ≡ seq_a i [ZMOD seq_n i]) } d := by
  sorry

end Erdos25
