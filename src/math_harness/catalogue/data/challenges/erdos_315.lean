import Mathlib

open Filter

namespace Erdos315

def u : ℕ → ℕ
  | 0 => 1
  | n + 1 => u n * (u n + 1)

noncomputable def c₀ : ℝ := limUnder atTop fun i => (u i : ℝ) ^ ((1 / 2 : ℝ) ^ (i + 1))

theorem erdos_315 :
    ∀ a : ℕ → ℕ, (∀ i, 0 < a i) → StrictMono a → (∃ i, a i ≠ u i + 1) → ∑' i, (1 : ℝ) / a i = 1 → atTop.liminf (fun i => (a i : ℝ) ^ ((1 / 2 : ℝ) ^ (i + 1))) < c₀ := by
  sorry

end Erdos315
