import Mathlib

open Filter

open scoped Topology Real

namespace Erdos416

noncomputable abbrev V (x : ℝ) : ℝ :=
  open scoped Classical in
  (Finset.Icc 1 ⌊x⌋₊ |>.filter (fun n => ∃ (m : ℕ), m.totient = n)).card

theorem erdos_416.variants.Erdos :
    ∃ f : ℝ → ℝ, f =o[atTop] (1 : ℝ → ℝ) ∧ ∀ᶠ x in Filter.atTop, V x = x * x.log ^ (-1 + f x) := by
  sorry

-- TODO: define the constant from the paper, 0.8178146... here and add it in the statement

-- TODO: add the constants `C₁, C₂, C₃` from the paper here

end Erdos416
