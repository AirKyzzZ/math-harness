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

theorem erdos_1184.variants.lower (α : ℝ) (hα : 1 < α) :
    ∃ ε > 0, ∀ᶠ k : ℕ in atTop, ∀ n : ℕ, (k : ℝ) ^ α - k < n → k * (1 - 1 / α + ε) < (f n k : ℝ) := by
  sorry

end Erdos1184
