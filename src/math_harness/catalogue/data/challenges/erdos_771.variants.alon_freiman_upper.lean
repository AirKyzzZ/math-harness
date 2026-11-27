import Mathlib

open Filter Asymptotics

namespace Erdos771

def IsAdmissible (n k : ℕ) : Prop :=
  ∀ m : ℕ, 1 ≤ m → ∃ S ⊆ Finset.Icc 1 n, S.card = k ∧ ∀ A ⊆ S, (∑ a ∈ A, a) ≠ m

noncomputable def f (n : ℕ) : ℕ :=
  sSup {k : ℕ | IsAdmissible n k}

theorem isAdmissible_zero (n : ℕ) : IsAdmissible n 0 := fun m hm =>
  ⟨∅, Finset.empty_subset _, Finset.card_empty, fun A hA => by
    rw [Finset.subset_empty.1 hA, Finset.sum_empty]
    omega⟩

theorem IsAdmissible.le {n k : ℕ} (h : IsAdmissible n k) : k ≤ n := by
  obtain ⟨S, hS, rfl, -⟩ := h 1 le_rfl
  simpa using Finset.card_le_card hS

theorem le_f {n k : ℕ} (h : IsAdmissible n k) : k ≤ f n :=
  le_csSup ⟨n, fun _ hk => IsAdmissible.le hk⟩ h

theorem erdos_771.variants.alon_freiman_upper :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ n : ℕ in atTop, (f n : ℝ) ≤ (1 / 2 + ε) * ((n : ℝ) / Real.log n) := by
  sorry

end Erdos771
