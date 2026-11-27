import Mathlib

open Filter MeasureTheory Topology

namespace Erdos1001

noncomputable def approximableSet (N : ℕ) (A c : ℝ) : Set ℝ :=
  {α | α ∈ Set.Ioo (0 : ℝ) 1 ∧
    ∃ x : ℤ, ∃ y : ℕ, 0 < y ∧ N ≤ y ∧ (y : ℝ) ≤ c * (N : ℝ) ∧ x.natAbs.Coprime y ∧
      |α - (x : ℝ) / (y : ℝ)| < A / (y : ℝ) ^ 2}

noncomputable def S (N : ℕ) (A c : ℝ) : ℝ :=
  volume.real (approximableSet N A c)

theorem erdos_1001.parts.i (A c : ℝ) (hA : 0 < A) (hc : 1 ≤ c) :
    ∃ f : ℝ, Tendsto (fun N : ℕ ↦ S N A c) atTop (𝓝 f) := by
  sorry

end Erdos1001
