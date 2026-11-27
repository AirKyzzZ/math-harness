import Mathlib

open Finset

namespace Erdos1198

theorem erdos_1198_neg :
    ¬ (¬ ∀ c : ℕ → Fin 2, ∃ a : ℕ → ℕ, StrictMono a ∧ 0 < a 0 ∧ ∃ col : Fin 2, ∀ (k : ℕ) (S : Fin k → Finset ℕ), 0 < k → (∀ j, (S j).Nonempty) → Pairwise (fun j j' => Disjoint (S j) (S j')) → ¬ (k = 1 ∧ ∀ j, #(S j) = 1) → c (∑ j, ∏ i ∈ S j, a i) = col) := by
  sorry

end Erdos1198
