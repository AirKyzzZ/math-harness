import Mathlib

open Nat Filter

namespace Erdos821

noncomputable def g (n : ℕ) : ℕ :=
  { m : ℕ | totient m = n }.ncard

theorem erdos_821.variants.erdos :
    ∃ c > (0 : ℝ), { n : ℕ | (n : ℝ) ^ c < (g n : ℝ) }.Infinite := by
  sorry

end Erdos821
