import Mathlib

open Nat Filter

namespace Erdos138

def monoAP_guarantee_set (r k : ℕ) : Set ℕ :=
  { N | ∀ coloring : Finset.Icc 1 N → Fin r, ContainsMonoAPofLength coloring k}

noncomputable def monoAPNumber (r k : ℕ) : ℕ := sInf (monoAP_guarantee_set r k)

noncomputable abbrev W : ℕ → ℕ := monoAPNumber 2

theorem erdos_138.variants.quotient_neg :
    ¬ (atTop.Tendsto (fun k => ((W (k + 1) : ℚ)/(W k))) atTop) := by
  sorry
