import Mathlib

open Filter Set Topology

namespace Erdos347

local notation "𝓟" A => subsetSums A

theorem erdos_347_neg :
    ¬ (∃ a : ℕ → ℕ, (Monotone a) ∧ (Tendsto (fun n ↦ (a (n + 1) : ℝ) / (a n : ℝ)) atTop (𝓝 2)) ∧ (∀ ι : ℕ → ℕ, (range ι)ᶜ.Finite → HasDensity (𝓟 (range (a ∘ ι))) 1)) := by
  sorry

end Erdos347
