import Mathlib

namespace Erdos796

open Filter

open scoped Topology

def repCount (A : Finset ℕ) (m : ℕ) : ℕ :=
  ((A ×ˢ A).filter fun a => a.1 < a.2 ∧ a.1 * a.2 = m).card

def HasRepBound (k : ℕ) (A : Finset ℕ) : Prop := ∀ m : ℕ, repCount A m < k

open scoped Classical in
noncomputable def g (k n : ℕ) : ℕ :=
  ((Finset.Icc 1 n).powerset.filter (HasRepBound k)).sup Finset.card

noncomputable def normalizedError (n : ℕ) : ℝ :=
  ((g 3 n : ℝ) - (n : ℝ) * Real.log (Real.log n) / Real.log n) / ((n : ℝ) / Real.log n)

theorem erdos_796_neg :
    ¬ (∃ c : ℝ, Tendsto normalizedError atTop (𝓝 c)) := by
  sorry

end Erdos796
