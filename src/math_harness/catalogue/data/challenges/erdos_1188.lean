import Mathlib

namespace Erdos1188

open Filter

open scoped Topology

abbrev CongruenceClass := ℕ × ℕ

def ValidClass (c : CongruenceClass) : Prop := 2 ≤ c.1 ∧ c.2 < c.1

def Satisfies (z : ℤ) (c : CongruenceClass) : Prop := z % (c.1 : ℤ) = (c.2 : ℤ)

def Covers (S : Finset CongruenceClass) : Prop := ∀ z : ℤ, ∃ c ∈ S, Satisfies z c

def HasDistinctModuli (S : Finset CongruenceClass) : Prop :=
  ∀ ⦃c₁⦄, c₁ ∈ S → ∀ ⦃c₂⦄, c₂ ∈ S → c₁.1 = c₂.1 → c₁ = c₂

def IsMinimalDistinctCoveringSystem (S : Finset CongruenceClass) : Prop :=
  (∀ c ∈ S, ValidClass c) ∧ HasDistinctModuli S ∧ Covers S ∧
    ∀ T : Finset CongruenceClass, T ⊂ S → ¬ Covers T

def ClassesUpTo (x : ℕ) : Finset CongruenceClass :=
  (Finset.Icc 2 x).biUnion fun n => (Finset.range n).image fun a => (n, a)

open scoped Classical in
noncomputable def coveringCount (x : ℕ) : ℕ :=
  ((ClassesUpTo x).powerset.filter IsMinimalDistinctCoveringSystem).card

theorem erdos_1188 :
    Tendsto (fun x : ℕ => Real.log (Real.log (coveringCount x : ℝ)) / Real.log (x : ℝ)) atTop (𝓝 1) := by
  sorry

end Erdos1188
