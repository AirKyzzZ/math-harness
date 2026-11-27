import Mathlib

open Filter

namespace Erdos1180

def Represents (ε : ℝ) (p : ℕ) (a : ZMod p) (s : Multiset ℕ) : Prop :=
  (∀ n ∈ s, 1 ≤ n ∧ (n : ℝ) ≤ (p : ℝ) ^ ε ∧ n.Coprime p) ∧
    (s.map fun n : ℕ ↦ (n : ZMod p)⁻¹).sum = a

noncomputable def C (ε : ℝ) : ℕ :=
  sInf {C | ∀ p : ℕ, p.Prime → ∀ a : ZMod p, ∃ s : Multiset ℕ, s.card ≤ C ∧ Represents ε p a s}

theorem erdos_1180 :
    ∀ ε : ℝ, 0 < ε → ∃ C : ℕ, ∀ p : ℕ, p.Prime → ∀ a : ZMod p, ∃ s : Multiset ℕ, s.card ≤ C ∧ Represents ε p a s := by
  sorry

end Erdos1180
