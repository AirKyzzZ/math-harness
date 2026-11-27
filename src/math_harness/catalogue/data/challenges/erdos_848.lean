import Mathlib

namespace Erdos848

def NonSquarefreeProductProp (A : Finset ℕ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ¬Squarefree (a * b + 1)

def A₇ (N : ℕ) : Finset ℕ :=
  (Finset.range N).filter (fun n => n % 25 = 7)

def Erdos848For (N : ℕ) : Prop :=
  ∀ A : Finset ℕ, A ⊆ Finset.range N → NonSquarefreeProductProp A →
    A.card ≤ (A₇ N).card

theorem erdos_848 :
    ∀ N, Erdos848For N := by
  sorry

end Erdos848
