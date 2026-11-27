import Mathlib

open Filter Finset

namespace Erdos1179

variable {G : Type*} [AddCommGroup G] [Fintype G]

open scoped Classical in
noncomputable def repCount (A : Finset G) (g : G) : ℕ :=
  (A.powerset.filter fun S ↦ ∑ x ∈ S, x = g).card

def IsBalanced (ε : ℝ) (A : Finset G) : Prop :=
  ∀ g : G, |(repCount A g : ℝ) - 2 ^ A.card / Fintype.card G| ≤
    ε * (2 ^ A.card / Fintype.card G)

open scoped Classical in
noncomputable def successProbability (G : Type*) [AddCommGroup G] [Fintype G] (ε : ℝ) (k : ℕ) :
    ℝ :=
  (((univ : Finset G).powersetCard k).filter (IsBalanced ε)).card /
    ((univ : Finset G).powersetCard k).card

theorem erdos_1179_neg :
    ¬ (∀ ε : ℝ, 0 < ε → ε < 1 → ∃ k : ℕ → ℕ, Tendsto (fun N : ℕ ↦ (k N : ℝ) / Real.logb 2 N) atTop (nhds 1) ∧ ∀ (G : ℕ → Type) [∀ i, AddCommGroup (G i)] [∀ i, Fintype (G i)], Tendsto (fun i ↦ Fintype.card (G i)) atTop atTop → Tendsto (fun i ↦ successProbability (G i) ε (k (Fintype.card (G i)))) atTop (nhds 1)) := by
  sorry

end Erdos1179
