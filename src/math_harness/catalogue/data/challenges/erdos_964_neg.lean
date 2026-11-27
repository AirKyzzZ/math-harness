import Mathlib

open scoped ArithmeticFunction.sigma

namespace Erdos964

noncomputable def tauRatio (n : ℕ) : ℝ := (σ 0 (n + 1) : ℝ) / (σ 0 n : ℝ)

theorem tauRatio_pos {n : ℕ} (hn : 0 < n) : 0 < tauRatio n := by
  unfold tauRatio
  have h1 : 0 < σ 0 (n + 1) := ArithmeticFunction.sigma_pos_iff.2 (Nat.succ_pos n)
  have h2 : 0 < σ 0 n := ArithmeticFunction.sigma_pos_iff.2 hn
  exact div_pos (Nat.cast_pos.2 h1) (Nat.cast_pos.2 h2)

theorem erdos_964_neg :
    ¬ (Set.Ioi (0 : ℝ) ⊆ closure (tauRatio '' Set.Ici 1)) := by
  sorry

end Erdos964
