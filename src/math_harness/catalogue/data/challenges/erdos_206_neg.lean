import Mathlib

open MeasureTheory

namespace Erdos206

noncomputable def egyptianSum (S : Finset ℕ) : ℝ :=
  ∑ m ∈ S, (1 : ℝ) / m

def IsUnderapprox (S : Finset ℕ) (x : ℝ) : Prop :=
  (∀ m ∈ S, 0 < m) ∧ egyptianSum S < x

def IsBestNTerm (S : Finset ℕ) (n : ℕ) (x : ℝ) : Prop :=
  S.card = n ∧ IsUnderapprox S x ∧
    ∀ T : Finset ℕ, T.card = n → IsUnderapprox T x → egyptianSum T ≤ egyptianSum S

def EventuallyGreedy (x : ℝ) : Prop :=
  x > 0 ∧ ∃ (m : ℕ → ℕ), StrictMono m ∧ (∀ k, 0 < m k) ∧
    ∃ n₀ : ℕ, ∀ n ≥ n₀,
      IsBestNTerm (Finset.image m (Finset.range n)) n x

theorem erdos_206_neg :
    ¬ (¬ ∀ᵐ x ∂(volume.restrict (Set.Ioi (0 : ℝ))), EventuallyGreedy x) := by
  sorry

end Erdos206
