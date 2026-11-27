import Mathlib

open Nat Filter

namespace Erdos821

noncomputable def g (n : ℕ) : ℕ :=
  { m : ℕ | totient m = n }.ncard

theorem erdos_821.variants.lichtman :
    ∃ c > (0.71568 : ℝ), { n : ℕ | (n : ℝ) ^ c < (g n : ℝ) }.Infinite := by
  sorry

end Erdos821
