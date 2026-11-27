import Mathlib

open Nat Filter

namespace Erdos821

noncomputable def g (n : ℕ) : ℕ :=
  { m : ℕ | totient m = n }.ncard

theorem erdos_821_neg :
    ¬ (∀ ε > (0 : ℝ), { n : ℕ | (g n : ℝ) > (n : ℝ) ^ (1 - ε) }.Infinite) := by
  sorry

end Erdos821
