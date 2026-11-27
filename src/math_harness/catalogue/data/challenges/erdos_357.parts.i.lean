import Mathlib

namespace Erdos357

open Filter Asymptotics

def HasDistinctSums {ι α : Type*} [Preorder ι] [AddCommMonoid α] (a : ι → α) : Prop :=
  {J : Finset ι | (J : Set ι).OrdConnected}.InjOn (fun J ↦ ∑ x ∈ J, a x)

noncomputable def f (n : ℕ) : ℕ :=
  sSup {k : ℕ | ∃ a : Fin k → ℤ, Set.range a ⊆ Set.Icc 1 n ∧ StrictMono a ∧ HasDistinctSums a}

theorem erdos_357.parts.i :
    (fun n ↦ (f n : ℝ)) =o[atTop] (fun n ↦ (n : ℝ)) := by
  sorry

noncomputable def g (n : ℕ) : ℕ :=
  sSup {k : ℕ | ∃ a : Fin k → ℕ, (Set.range a ⊆ Set.Icc 1 n) ∧ HasDistinctSums a}

noncomputable def h (n : ℕ) : ℕ :=
  sSup {k : ℕ | ∃ a : Fin k → ℤ, Set.range a ⊆ Set.Icc 1 n ∧ Monotone a ∧ HasDistinctSums a}

-- The analogous question assuming only monotonicity of the $a_i$. The wording of the website

-- suggests that this is open, though it's not clear whether the difficulty is the same as for the

-- strictly monotone case.

-- TODO(Paul-Lez): add results from last paragraph of the page.

end Erdos357
