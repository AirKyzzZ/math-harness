import Mathlib

open Filter Asymptotics

namespace Erdos185

noncomputable def f3 (n : ℕ) : ℕ :=
  sSup {m : ℕ | ∃ A : Finset (Fin n → Fin 3),
    (∀ x ∈ A, ∀ y ∈ A, ∀ z ∈ A, x ≠ y → x ≠ z → y ≠ z →
      ¬ Collinear ℝ ({fun i => ((x i : ℕ) : ℝ), fun i => ((y i : ℕ) : ℝ),
        fun i => ((z i : ℕ) : ℝ)} : Set (Fin n → ℝ))) ∧ A.card = m}

theorem erdos_185_neg :
    ¬ ((fun n : ℕ => (f3 n : ℝ)) =o[atTop] fun n : ℕ => (3 : ℝ) ^ n) := by
  sorry

end Erdos185
