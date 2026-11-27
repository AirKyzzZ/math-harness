import Mathlib

open Filter Asymptotics

namespace Erdos1025

def IsIndependent {n : ℕ} (f : Sym2 (Fin n) → Fin n) (X : Finset (Fin n)) : Prop :=
  ∀ x ∈ X, ∀ y ∈ X, x ≠ y → f s(x, y) ∉ X

noncomputable def g (n : ℕ) : ℕ :=
  sSup {k : ℕ | k ≤ n ∧ ∀ f : Sym2 (Fin n) → Fin n,
    (∀ x y, x ≠ y → f s(x, y) ≠ x ∧ f s(x, y) ≠ y) →
      ∃ X : Finset (Fin n), IsIndependent f X ∧ k ≤ X.card}

theorem erdos_1025 :
    (fun n : ℕ => (g n : ℝ)) =Θ[atTop] fun n : ℕ => √n := by
  sorry

end Erdos1025
