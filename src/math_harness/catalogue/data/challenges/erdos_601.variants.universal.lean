import Mathlib

open Cardinal Ordinal SimpleGraph

namespace Erdos601

universe u

def HasPathOrIndepSetOfType (α : Ordinal.{u}) : Prop :=
  ∀ G : SimpleGraph α.ToType,
    (∃ f : ℕ → α.ToType, Function.Injective f ∧ ∀ n, G.Adj (f n) (f (n + 1))) ∨
    (∃ s : Set α.ToType, G.IsIndepSet s ∧ typeLT s = α)

theorem erdos_601.variants.universal :
    ∀ α : Ordinal.{0}, Order.IsSuccLimit α → HasPathOrIndepSetOfType α := by
  sorry

namespace erdos_601.variants

private theorem at_omega_aux : HasPathOrIndepSetOfType.{u} ω := by
  intro G
  have : Infinite (ω : Ordinal.{u}).ToType :=
    Cardinal.infinite_iff.2 (le_of_eq (by rw [Cardinal.mk_toType, Ordinal.card_omega0]))
  let e := Infinite.natEmbedding (ω : Ordinal.{u}).ToType
  obtain ⟨g, hpath | hind⟩ := exists_increasing_or_nonincreasing_subseq' G.Adj e
  · exact Or.inl ⟨fun n => e (g n), e.injective.comp g.injective, hpath⟩
  have hinj : Function.Injective fun n => e (g n) := e.injective.comp g.injective
  refine Or.inr ⟨Set.range fun n => e (g n), (isIndepSet_iff G).2 ?_, le_antisymm ?_ ?_⟩
  · rintro _ ⟨m, rfl⟩ _ ⟨n, rfl⟩ hmn
    rcases lt_trichotomy m n with h | rfl | h
    · exact hind m n h
    · exact absurd rfl hmn
    · exact fun hadj => hind n m h hadj.symm
  · exact (Ordinal.type_set_le _).trans (Ordinal.type_toType ω).le
  · by_contra h
    have hcard := Ordinal.card_lt_aleph0.2 (not_le.1 h)
    rw [Ordinal.card_type] at hcard
    exact Set.infinite_range_of_injective hinj
      (Set.finite_coe_iff.1 (Cardinal.lt_aleph0_iff_finite.1 hcard))

theorem at_omega : HasPathOrIndepSetOfType ω :=
  at_omega_aux

end erdos_601.variants

end Erdos601
