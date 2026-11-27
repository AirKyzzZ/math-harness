import Mathlib

open Cardinal Ordinal

open scoped Cardinal

namespace Erdos70

universe u

def OrdinalCardinalRamsey3 (α β : Ordinal.{u}) (c : Cardinal.{u}) : Prop :=
  -- For any partition of 3-element subsets into red and blue:
  ∀ (isRed : α.ToType → α.ToType → α.ToType → Prop),
    -- The colouring is well-defined on *unordered* triples of distinct elements:
    (∀ x y z, x ≠ y → y ≠ z → x ≠ z →
      (isRed x y z ↔ isRed y x z) ∧ (isRed x y z ↔ isRed x z y)) →
    -- either there is a red-monochromatic subset of order type β
    (∃ s : Set α.ToType, typeLT s = β ∧ s.Triplewise isRed) ∨
    -- or there is a blue-monochromatic subset of cardinality c
    (∃ s : Set α.ToType, #s = c ∧ s.Triplewise (fun x y z ↦ ¬ isRed x y z))

def RealCardinalRamsey3 (β : Ordinal.{0}) (c : Cardinal.{0}) : Prop :=
  -- For any partition of 3-element subsets of `ℝ` into red and blue:
  ∀ (isRed : ℝ → ℝ → ℝ → Prop),
    -- The colouring is well-defined on *unordered* triples of distinct elements:
    (∀ x y z, x ≠ y → y ≠ z → x ≠ z →
      (isRed x y z ↔ isRed y x z) ∧ (isRed x y z ↔ isRed x z y)) →
    -- either there is a red-monochromatic subset of order type β
    (∃ e : β.ToType ↪o ℝ, (Set.range e).Triplewise isRed) ∨
    -- or there is a blue-monochromatic subset of cardinality c
    (∃ s : Set ℝ, #s = c ∧ s.Triplewise (fun x y z ↦ ¬ isRed x y z))

theorem erdos_70 :
    ∀ᵉ (β : Ordinal.{0}) (n : ℕ) (_ : β.card ≤ ℵ₀) (_ : 2 ≤ n), RealCardinalRamsey3 β n := by
  sorry

namespace erdos_70.variants

theorem ordinalCardinalRamsey3_mono {α β β' : Ordinal.{u}} {c c' : Cardinal.{u}}
    (h : OrdinalCardinalRamsey3 α β c) (hβ : β' ≤ β) (hc : c' ≤ c) :
    OrdinalCardinalRamsey3 α β' c' := by
  intro isRed hSym
  obtain (⟨s, hs_type, hs_clique⟩ | ⟨s, hs_card, hs_clique⟩) := h isRed hSym
  · -- Red case: s has type β; find a sub-set of type β' ≤ β
    rw [← Ordinal.type_toType β'] at hβ
    obtain ⟨g⟩ := Ordinal.type_le_iff'.mp (hs_type ▸ hβ)
    let t : Set α.ToType := Set.range (Subtype.val ∘ g)
    refine Or.inl ⟨t, ?_, hs_clique.mono (by rintro x ⟨a, rfl⟩; exact (g a).2)⟩
    -- Show typeLT t = β'
    let emb : (· < · : β'.ToType → β'.ToType → Prop) ↪r (· < · : ↑t → ↑t → Prop) :=
      { toFun := fun a => ⟨(g a).val, a, rfl⟩
        inj' := fun a b heq => g.injective (Subtype.ext (congr_arg (fun x : ↑t => x.val) heq))
        map_rel_iff' := g.map_rel_iff }
    have hsurj : Function.Surjective emb := fun ⟨_, hy⟩ => ⟨hy.choose, Subtype.ext hy.choose_spec⟩
    exact (Ordinal.type_eq.mpr ⟨RelIso.ofSurjective emb hsurj |>.symm⟩).trans
      (Ordinal.type_toType β')
  · -- Blue case: s has cardinality c; find a sub-set of cardinality c' ≤ c
    obtain ⟨t, ht_sub, ht_card⟩ := (Cardinal.le_mk_iff_exists_subset).mp (hs_card ▸ hc)
    exact Or.inr ⟨t, ht_card, hs_clique.mono ht_sub⟩

end erdos_70.variants

end Erdos70
