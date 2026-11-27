import Mathlib

open Filter Real Finset

namespace Erdos525

def eval {n : ℕ} (ε : Fin (n + 1) → ℤˣ) (z : ℂ) : ℂ :=
  ∑ j, ((ε j : ℤ) : ℂ) * z ^ (j : ℕ)

def exceptional (n : ℕ) : Set (Fin (n + 1) → ℤˣ) :=
  {ε | ∀ z : ℂ, ‖z‖ = 1 → 1 ≤ ‖eval ε z‖}

noncomputable def m {n : ℕ} (ε : Fin (n + 1) → ℤˣ) : ℝ :=
  sInf ((fun z ↦ ‖eval ε z‖) '' Metric.sphere (0 : ℂ) 1)

open scoped Classical in
noncomputable def prob (n : ℕ) (P : (Fin (n + 1) → ℤˣ) → Prop) : ℝ :=
  ((univ.filter P).card : ℝ) / 2 ^ (n + 1)

theorem erdos_525.variants.kashin (δ : ℝ) (hδ : 0 < δ) :
    Tendsto (fun n : ℕ ↦ prob n fun f ↦ m f < δ) atTop (nhds 1) := by
  sorry

end Erdos525
