import Mathlib

open Filter Asymptotics

namespace Erdos1204

def IsAdmissible (S : Finset ℕ) : Prop :=
  ∀ p : ℕ, p.Prime → ∃ r : ZMod p, ∀ a ∈ S, (a : ZMod p) ≠ r

noncomputable def A (k : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ S : Finset ℕ, S.card = k ∧ IsAdmissible S ∧ ∀ a ∈ S, a ≤ m}

noncomputable def minSum (k : ℕ) : ℕ :=
  sInf {s : ℕ | ∃ S : Finset ℕ, S.card = k ∧ IsAdmissible S ∧ ∑ a ∈ S, a = s}

noncomputable def B (k : ℕ) : ℝ := (minSum k : ℝ) / k

theorem A_le {k m : ℕ} {S : Finset ℕ} (hS : S.card = k) (hadm : IsAdmissible S)
    (hm : ∀ a ∈ S, a ≤ m) : A k ≤ m :=
  Nat.sInf_le ⟨S, hS, hadm, hm⟩

theorem erdos_1204.variants.B_upper :
    ∀ ε > (0 : ℝ), ∀ᶠ k : ℕ in atTop, B k ≤ (1 / 2 + ε) * k * Real.log k := by
  sorry

end Erdos1204
