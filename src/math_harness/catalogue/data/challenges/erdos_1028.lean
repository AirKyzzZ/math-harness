import Mathlib

open Filter Asymptotics

namespace Erdos1028

def imbalance (f : ℕ → ℕ → ℤ) (X : Finset ℕ) : ℤ :=
  |∑ x ∈ X, ∑ y ∈ X.filter (fun y => x < y), f x y|

noncomputable def H (n : ℕ) : ℕ :=
  sInf {m | ∃ f : ℕ → ℕ → ℤ, (∀ x y, f x y = 1 ∨ f x y = -1) ∧
    ∀ X ⊆ Finset.Icc 1 n, imbalance f X ≤ (m : ℤ)}

theorem erdos_1028 :
    (fun n => (H n : ℝ)) =Θ[atTop] fun n : ℕ => (n : ℝ) ^ (3 / 2 : ℝ) := by
  sorry

end Erdos1028
