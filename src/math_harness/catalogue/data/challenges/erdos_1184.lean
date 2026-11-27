import Mathlib

open Filter

open scoped Topology

namespace Erdos1184

def f (n k : ℕ) : ℕ :=
  ((Finset.Icc 1 k).filter fun i => k < (n + i).maxPrimeFac).card

theorem f_le (n k : ℕ) : f n k ≤ k := by
  unfold f
  exact (Finset.card_filter_le _ _).trans (by simp)

def IsDickman (ρ : ℝ → ℝ) : Prop :=
  ContinuousOn ρ (Set.Ici 0) ∧ (∀ u ∈ Set.Icc (0 : ℝ) 1, ρ u = 1) ∧
    ∀ u : ℝ, 1 ≤ u → u * ρ u = ∫ t in (u - 1)..u, ρ t

theorem IsDickman.apply_one {ρ : ℝ → ℝ} (h : IsDickman ρ) : ρ 1 = 1 :=
  h.2.1 1 ⟨zero_le_one, le_rfl⟩

theorem erdos_1184 :
    ∀ ρ : ℝ → ℝ, IsDickman ρ → ∀ α : ℝ, 1 < α → ∀ n : ℕ → ℕ, Tendsto (fun k : ℕ => Real.log (n k) / Real.log k) atTop (𝓝 α) → Tendsto (fun k : ℕ => (f (n k) k : ℝ) / k) atTop (𝓝 (1 - ρ α)) := by
  sorry

end Erdos1184
