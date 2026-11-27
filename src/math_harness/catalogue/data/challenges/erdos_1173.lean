import Mathlib

open Cardinal Ordinal

open scoped Cardinal Ordinal

namespace Erdos1173

def IsSetMapping (f : (ω_ (ω + 1)).ToType → Set (ω_ (ω + 1)).ToType) : Prop :=
  (∀ α : (ω_ (ω + 1)).ToType, α ∉ f α) ∧
  (∀ α : (ω_ (ω + 1)).ToType, #(f α) ≤ ℵ_ ω) ∧
  (∀ α β : (ω_ (ω + 1)).ToType, α ≠ β → #(f α ∩ f β : Set (ω_ (ω + 1)).ToType) < ℵ_ ω)

def IsFreeSet (f : (ω_ (ω + 1)).ToType → Set (ω_ (ω + 1)).ToType)
    (Y : Set (ω_ (ω + 1)).ToType) : Prop :=
  ∀ α ∈ Y, ∀ β ∈ Y, α ≠ β → β ∉ f α

theorem erdos_1173 :
    GCH → ∀ f : (ω_ (ω + 1)).ToType → Set (ω_ (ω + 1)).ToType, IsSetMapping f → ∃ Y : Set (ω_ (ω + 1)).ToType, IsFreeSet f Y ∧ #Y = ℵ_ (ω + 1) := by
  sorry

theorem erdos_1173.sanity.card_domain :
    #(ω_ (ω + 1)).ToType = ℵ_ (ω + 1) := by
  rw [mk_toType, Ordinal.card_omega]

theorem erdos_1173.sanity.aleph_omega_lt_succ : ℵ_ ω < ℵ_ (ω + 1) := by
  exact Cardinal.aleph_lt_aleph.mpr (Order.lt_succ ω)

theorem erdos_1173.sanity.empty_is_free
    (f : (ω_ (ω + 1)).ToType → Set (ω_ (ω + 1)).ToType) :
    IsFreeSet f ∅ := by
  intro _ hα
  simp at hα

theorem erdos_1173.sanity.singleton_is_free
    (f : (ω_ (ω + 1)).ToType → Set (ω_ (ω + 1)).ToType)
    (α : (ω_ (ω + 1)).ToType) :
    IsFreeSet f {α} := by
  intro a ha b hb hab
  simp only [Set.mem_singleton_iff] at ha hb
  exact absurd (ha ▸ hb ▸ rfl) hab

theorem erdos_1173.variants.free_set_mono
    (f : (ω_ (ω + 1)).ToType → Set (ω_ (ω + 1)).ToType)
    {Y Z : Set (ω_ (ω + 1)).ToType}
    (hYZ : Z ⊆ Y) (hY : IsFreeSet f Y) : IsFreeSet f Z := by
  intro α hα β hβ hne
  exact hY α (hYZ hα) β (hYZ hβ) hne

theorem erdos_1173.variants.image_lt_aleph_succ
    (f : (ω_ (ω + 1)).ToType → Set (ω_ (ω + 1)).ToType)
    (hf : IsSetMapping f)
    (α : (ω_ (ω + 1)).ToType) :
    #(f α) < ℵ_ (ω + 1) := by
  exact (hf.2.1 α).trans_lt (Cardinal.aleph_lt_aleph.mpr (Order.lt_succ ω))

end Erdos1173
