import Mathlib

open Filter Asymptotics

namespace Erdos162

def colourEdgeCount {n : ℕ} (c : Sym2 (Fin n) → Bool) (H : Finset (Fin n)) (b : Bool) : ℕ :=
  (H.sym2.filter (fun e ↦ ¬ e.IsDiag ∧ c e = b)).card

def IsBalancedAbove (n : ℕ) (α : ℝ) (c : Sym2 (Fin n) → Bool) (k : ℕ) : Prop :=
  ∀ H : Finset (Fin n), k ≤ H.card → ∀ b : Bool,
    α * (H.card.choose 2 : ℝ) < colourEdgeCount c H b

noncomputable def F (n : ℕ) (α : ℝ) : ℕ :=
  sInf {k : ℕ | ∃ c : Sym2 (Fin n) → Bool, IsBalancedAbove n α c k}

theorem erdos_162 (α : ℝ) (h0 : 0 ≤ α) (h1 : α < 1 / 2) :
    ∃ c : ℝ, (fun n : ℕ ↦ (F n α : ℝ)) ~[atTop] (fun n : ℕ ↦ c * Real.log n) := by
  sorry

theorem erdos_162.variants.half (n : ℕ) : F n (1 / 2) = n + 1 := by
  have hvac : ∀ c : Sym2 (Fin n) → Bool, IsBalancedAbove n (1 / 2) c (n + 1) := by
    intro c H hH
    have := H.card_le_univ
    simp at this
    omega
  refine le_antisymm (Nat.sInf_le ⟨fun _ ↦ true, hvac _⟩) ?_
  refine le_csInf ⟨n + 1, fun _ ↦ true, hvac _⟩ ?_
  rintro k ⟨c, hc⟩
  by_contra! hk
  have ht := hc Finset.univ (by simp; omega) true
  have hf := hc Finset.univ (by simp; omega) false
  have hsum : colourEdgeCount c Finset.univ true + colourEdgeCount c Finset.univ false =
      n.choose 2 := by
    have h1 := Finset.card_filter_add_card_filter_not
      (s := (Finset.univ : Finset (Fin n)).sym2.filter fun e ↦ ¬ e.IsDiag) (fun e ↦ c e = true)
    simp only [Finset.filter_filter, Bool.not_eq_true] at h1
    rw [colourEdgeCount, colourEdgeCount, h1, Finset.sym2_univ, ← Fintype.card_subtype,
      Sym2.card_subtype_not_diag, Fintype.card_fin]
  simp only [Finset.card_univ, Fintype.card_fin] at ht hf
  have : (colourEdgeCount c Finset.univ true : ℝ) + colourEdgeCount c Finset.univ false =
      n.choose 2 := by exact_mod_cast hsum
  linarith

theorem isBalancedAbove_succ (n : ℕ) (α : ℝ) (c : Sym2 (Fin n) → Bool) :
    IsBalancedAbove n α c (n + 1) := by
  intro H hH
  have := H.card_le_univ
  simp at this
  omega

theorem F_le_succ (n : ℕ) (α : ℝ) : F n α ≤ n + 1 :=
  Nat.sInf_le ⟨fun _ ↦ true, isBalancedAbove_succ n α _⟩

end Erdos162
