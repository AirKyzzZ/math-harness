import Mathlib

namespace Erdos433

open Filter

open scoped Topology

noncomputable def frobeniusNumber (A : Finset ℕ) : ℕ :=
  sSup {m | m ∉ AddSubmonoid.closure (A : Set ℕ)}

noncomputable def g (k n : ℕ) : ℕ :=
  sSup {m | ∃ A : Finset ℕ, A ⊆ Finset.Icc 1 n ∧ A.card = k ∧ A.gcd id = 1 ∧
    m = frobeniusNumber A}

theorem erdos_433_neg :
    ¬ (∀ k, 2 ≤ k → Tendsto (fun n : ℕ => (g k n : ℝ) / ((n : ℝ) ^ 2 / ((k : ℝ) - 1))) atTop (𝓝 1)) := by
  sorry

end Erdos433
