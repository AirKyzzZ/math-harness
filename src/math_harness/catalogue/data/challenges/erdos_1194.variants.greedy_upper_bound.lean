import Mathlib

open Filter

namespace Erdos1194

def IsPerfectDifferenceSetInt (A : Set ℕ) : Prop :=
  0 ∉ A ∧ IsPerfectDifferenceSet A 0

def IsLargerElement (A : Set ℕ) (n a : ℕ) : Prop :=
  a ∈ A ∧ ∃ b ∈ A, a = b + n

def HasLargeElement (A : Set ℕ) (f : ℕ → ℝ) : Prop :=
  ∃ᶠ n in atTop, ∃ a, IsLargerElement A n a ∧ f n ≤ a

theorem IsPerfectDifferenceSetInt.exists_isLargerElement {A : Set ℕ}
    (hA : IsPerfectDifferenceSetInt A) {n : ℕ} (hn : 0 < n) : ∃ a, IsLargerElement A n a := by
  have hn' : (n : ZMod 0) ∈ {x : ZMod 0 | x ≠ 0} := by
    simpa [ZMod.natCast_eq_zero_iff] using hn.ne'
  obtain ⟨⟨a, b⟩, ⟨ha, hb, -⟩, hab⟩ := hA.2.surjOn hn'
  refine ⟨a, ha, b, hb, ?_⟩
  have h : ((a : ℤ) - b : ℤ) = n := hab
  omega

theorem IsLargerElement.unique {A : Set ℕ} {n a a' : ℕ} (hA : IsPerfectDifferenceSetInt A)
    (hn : 0 < n) (h : IsLargerElement A n a) (h' : IsLargerElement A n a') : a = a' := by
  obtain ⟨ha, b, hb, rfl⟩ := h
  obtain ⟨ha', b', hb', rfl⟩ := h'
  have h1 : (b + n, b) ∈ A.offDiag := Set.mem_offDiag.2 ⟨ha, hb, (show b + n ≠ b by omega)⟩
  have h2 : (b' + n, b') ∈ A.offDiag := Set.mem_offDiag.2 ⟨ha', hb', (show b' + n ≠ b' by omega)⟩
  have e := hA.2.injOn h1 h2 (by simp)
  exact congrArg Prod.fst e

theorem IsLargerElement.le_self {A : Set ℕ} {n a : ℕ} (h : IsLargerElement A n a) : n ≤ a := by
  obtain ⟨-, b, -, hab⟩ := h
  omega

theorem erdos_1194.variants.greedy_upper_bound :
    ∃ A : Set ℕ, IsPerfectDifferenceSetInt A ∧ ∃ C : ℝ, ∀ n : ℕ, 0 < n → ∀ a, IsLargerElement A n a → (a : ℝ) ≤ C * (n : ℝ) ^ 3 := by
  sorry

end Erdos1194
