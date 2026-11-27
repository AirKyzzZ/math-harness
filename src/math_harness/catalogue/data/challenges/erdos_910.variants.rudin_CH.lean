import Mathlib

open scoped Cardinal

namespace Erdos910

theorem erdos_910.variants.rudin_CH :
    (ℵ₁ = 𝔠) → ∃ M : Set (EuclideanSpace ℝ (Fin 2)), IsConnected M ∧ M.Nontrivial ∧ ∀ N ⊆ M, IsConnected N → N.Nontrivial → (M \ N).Countable := by
  sorry

end Erdos910
