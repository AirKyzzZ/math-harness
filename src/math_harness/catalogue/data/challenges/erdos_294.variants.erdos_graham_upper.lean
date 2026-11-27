import Mathlib

open Filter

namespace Erdos294

def HasUnitFractionSolution (m N : ℕ) : Prop :=
  ∃ s : Finset ℕ, m ∈ s ∧ (∀ n ∈ s, m ≤ n ∧ n ≤ N) ∧ ∑ n ∈ s, (1 : ℚ) / n = 1

noncomputable def t (N : ℕ) : ℕ :=
  sInf {m : ℕ | 0 < m ∧ ¬ HasUnitFractionSolution m N}

theorem hasUnitFractionSolution_one {N : ℕ} (hN : 1 ≤ N) : HasUnitFractionSolution 1 N :=
  ⟨{1}, by simp, by simpa using hN, by simp⟩

theorem t_le_succ (N : ℕ) : t N ≤ N + 1 :=
  Nat.sInf_le ⟨Nat.succ_pos N, fun h => by
    obtain ⟨s, hs, hall, -⟩ := h
    have := (hall _ hs).2
    omega⟩

theorem erdos_294.variants.erdos_graham_upper :
    (fun N : ℕ => (t N : ℝ)) ≪ (fun N : ℕ => (N : ℝ) / Real.log N) := by
  sorry

end Erdos294
