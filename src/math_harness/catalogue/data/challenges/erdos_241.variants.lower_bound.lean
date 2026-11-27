import Mathlib

open Filter Finset

open scoped Asymptotics

namespace Erdos241

noncomputable def f (N r : ℕ) : ℕ :=
  open scoped Classical in
  letI candidates := (Icc 1 N).powerset.filter (fun A ↦
    ∀ m₁ m₂ : Multiset ℕ,
      m₁.card = r → m₂.card = r →
      (∀ x ∈ m₁, x ∈ A) → (∀ x ∈ m₂, x ∈ A) →
      m₁.sum = m₂.sum → m₁ = m₂)
  candidates.sup card

theorem erdos_241.variants.lower_bound :
    ∃ ε : ℕ → ℝ, ε =o[atTop] (fun _ ↦ (1 : ℝ)) ∧ ∀ᶠ N in atTop, (1 + ε N) * (N : ℝ) ^ ((1 : ℝ) / 3) ≤ (f N 3 : ℝ) := by
  sorry

def BoseChowlaConjecture (r : ℕ) : Prop :=
  (fun N ↦ (f N r : ℝ)) ~[atTop] (fun N ↦ (N : ℝ) ^ ((1 : ℝ) / r))

end Erdos241
