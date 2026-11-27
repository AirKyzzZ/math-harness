import Mathlib

namespace Erdos287

def max_gap (k : ℕ) (s : Fin k → ℕ ) : ℕ  :=
   Finset.sup Finset.univ (fun i : Fin (k - 1) =>
      s  ⟨i.val + 1, by omega⟩ - s ⟨i.val, by omega⟩)

theorem erdos_287.test.best_possible :
    let s : Fin 3 → ℕ := ![2, 3, 6]
    StrictMono s ∧
    1 < s 0 ∧
    ∑ i : Fin 3, 1 / (s i : ℝ) = 1 ∧
    max_gap 3 s = 3 := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · decide
  · decide
  · norm_num [Fin.sum_univ_three, max_gap, show (![2, 3, 6] : Fin 3 → ℕ) 0 = 2 from rfl,
      show (![2, 3, 6] : Fin 3 → ℕ) 1 = 3 from rfl,
      show (![2, 3, 6] : Fin 3 → ℕ) 2 = 6 from rfl]
  · rfl

theorem erdos_287.variants.prime_conjecture_neg :
    ¬ (∃ N₀ : ℕ, ∀ N : ℕ, N₀ ≤ N → ∃ p : ℕ, Nat.Prime p ∧ N ≤ p ∧ p ≤ 2 * N ∧ Nat.Prime ((p + 1) / 2)) := by
  sorry

end Erdos287
