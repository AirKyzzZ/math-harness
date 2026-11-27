import Mathlib

namespace Erdos844

def evenOrOddNonSquarefree (N : ℕ) : Finset ℕ :=
  (Finset.Icc 1 N).filter (fun n => 2 ∣ n ∨ ¬ Squarefree n)

theorem erdos_844_neg :
    ¬ (∀ N : ℕ, IsGreatest {k : ℕ | ∃ A ⊆ Finset.Icc 1 N, (∀ a ∈ A, ∀ b ∈ A, ¬ Squarefree (a * b)) ∧ A.card = k} (evenOrOddNonSquarefree N).card) := by
  sorry

end Erdos844
