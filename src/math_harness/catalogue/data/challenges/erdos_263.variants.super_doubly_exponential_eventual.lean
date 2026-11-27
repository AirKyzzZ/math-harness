import Mathlib

open Filter

open scoped Topology

namespace Erdos263

def IsIrrationalitySequence (a : ℕ → ℕ) : Prop :=
  (∀ n : ℕ, a n > 0) ∧
    StrictMono a ∧
    (∀ b : ℕ → ℕ, (∀ n : ℕ, b n > 0) ∧
      atTop.Tendsto (fun n : ℕ => (a n : ℝ) / (b n : ℝ)) (𝓝 1) →
      Irrational (∑' n, 1 / (b n : ℝ)))

def IsWeakIrrationalitySequence (a : ℕ → ℕ) : Prop :=
  (∀ n : ℕ, a n > 0) ∧
    Monotone a ∧
    (∀ b : ℕ → ℕ, (∀ n : ℕ, b n > 0) ∧
      atTop.Tendsto (fun n : ℕ => (a n : ℝ) / (b n : ℝ)) (𝓝 1) →
      Irrational (∑' n, 1 / (b n : ℝ)))

theorem erdos_263.variants.super_doubly_exponential_eventual (a : ℕ → ℕ) (ha : ∀ n : ℕ, a n > 0) (ha' : StrictMono a) (ha'' : ∃ ε c : ℝ, 0 < ε ∧ 0 < c ∧ ∀ᶠ n in atTop, c * (a n : ℝ) ^ (2 + ε) ≤ (a (n + 1) : ℝ)) :
    IsIrrationalitySequence a := by
  sorry

end Erdos263
