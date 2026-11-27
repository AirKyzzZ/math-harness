import Mathlib

namespace Erdos650

noncomputable def f (m : ℕ) : ℕ :=
  sSup {r : ℕ | ∀ N : ℕ, ∀ A ⊆ Finset.Icc 1 N, A.card = m → ∀ x : ℝ, 1 ≤ x →
    ∃ a b : Fin r → ℕ, (Function.Injective a) ∧ (Function.Injective b) ∧
      (∀ i, a i ∈ A) ∧ (∀ i, (b i : ℝ) ∈ Set.Ioo x (x + 2 * (N : ℝ))) ∧ (∀ i, a i ∣ b i)}

theorem erdos_650.variants.erdos_selfridge (m : ℕ) :
    f (m ^ 2) ≤ 2 * m := by
  sorry

end Erdos650
