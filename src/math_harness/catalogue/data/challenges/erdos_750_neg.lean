import Mathlib

open Filter Finset NNReal SimpleGraph

universe u

namespace Erdos750

abbrev MycVerts (s : ℕ) (V : Type u) : Type u := (Fin s × V) ⊕ Unit

def MycAdj (s : ℕ) {V : Type u} (G : SimpleGraph V) : MycVerts s V → MycVerts s V → Prop
  | Sum.inl (i, u), Sum.inl (j, v) =>
      (i.val = 0 ∧ j.val = 0 ∧ G.Adj u v) ∨ (j.val = i.val + 1 ∧ G.Adj u v) ∨
        (i.val = j.val + 1 ∧ G.Adj u v)
  | Sum.inl (i, _), Sum.inr () => i.val + 1 = s
  | Sum.inr (), Sum.inl (i, _) => i.val + 1 = s
  | Sum.inr (), Sum.inr () => False

def genMyc (s : ℕ) {V : Type u} (G : SimpleGraph V) : SimpleGraph (MycVerts s V) :=
  .fromRel (MycAdj s G)

theorem genMyc_apex_adj_top {V : Type u} (G : SimpleGraph V) (s : ℕ) (hs : 0 < s) (v : V) :
    (genMyc s G).Adj (Sum.inr ()) (Sum.inl (⟨s - 1, by omega⟩, v)) := by
  refine ⟨by simp, Or.inl ?_⟩
  show s - 1 + 1 = s
  omega

theorem genMyc_adj_level_zero {V : Type u} (G : SimpleGraph V) {s : ℕ} (hs : 0 < s) {u v : V}
    (huv : G.Adj u v) :
    (genMyc s G).Adj (Sum.inl (⟨0, hs⟩, u)) (Sum.inl (⟨0, hs⟩, v)) := by
  refine ⟨by simpa using huv.ne, Or.inl ?_⟩
  exact Or.inl ⟨rfl, rfl, huv⟩

def IsRecursivelyBuiltMr : ∀ (_r : ℕ) {_V : Type u} (_G : SimpleGraph _V), Prop
  | 0, _, _ => False
  | 1, _, _ => False
  | 2, _, G => Nonempty (G ≃g completeGraph (Fin 2))
  | r + 3, _, G => ∃ (W : Type u) (H : SimpleGraph W) (s : ℕ),
      1 ≤ s ∧ IsRecursivelyBuiltMr (r + 2) H ∧ Nonempty (G ≃g genMyc s H)

theorem erdos_750_neg :
    ¬ (∀ (f : ℕ → ℝ≥0) (hf : atTop.Tendsto f atTop), ∃ (V : Type*) (G : SimpleGraph V), G.chromaticNumber = ⊤ ∧ ∀ (m : ℕ) (S : Set V), 0 < m → S.ncard = m → ∃ I ⊆ S, G.IsIndepSet I ∧ m / 2 - f m ≤ I.ncard) := by
  sorry

end Erdos750
