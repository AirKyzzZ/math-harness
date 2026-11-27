import Mathlib

open Cardinal Ordinal

open scoped Cardinal

namespace Erdos1169

universe u

theorem erdos_1169_neg :
    ¬ (¬ OrdinalRamsey ((ω_ 1) ^ (2 : ℕ)) ((ω_ 1) ^ (2 : ℕ)) (3 : Ordinal)) := by
  sorry

namespace erdos_1169.variants

end erdos_1169.variants

theorem ordinalRamsey_mono_blue {α β γ γ' : Ordinal.{u}}
    (h : OrdinalRamsey α β γ) (hγ : γ' ≤ γ) :
    OrdinalRamsey α β γ' := by
  intro red blue hCompl
  obtain (⟨s, hred, htype⟩ | ⟨s, hblue, htype⟩) := h red blue hCompl
  · exact Or.inl ⟨s, hred, htype⟩
  · -- s has type γ; find a sub-clique of type γ' ≤ γ.
    rw [← Ordinal.type_toType γ'] at hγ
    obtain ⟨g⟩ := Ordinal.type_le_iff'.mp (htype ▸ hγ)
    let t : Set α.ToType := Set.range (Subtype.val ∘ g)
    refine Or.inr ⟨t, ?_, ?_⟩
    · -- t is a blue clique
      rintro _ ⟨a, rfl⟩ _ ⟨b, rfl⟩ hne
      apply hblue (g a).2 (g b).2
      intro h
      apply hne
      simp [h]
    · -- typeLT t = γ'
      let emb : (· < · : γ'.ToType → γ'.ToType → Prop) ↪r (· < · : ↑t → ↑t → Prop) :=
        { toFun := fun a => ⟨(g a).val, a, rfl⟩
          inj' := fun a b heq =>
            g.injective (Subtype.ext (congr_arg (fun x : ↑t => x.val) heq))
          map_rel_iff' := g.map_rel_iff }
      have hsurj : Function.Surjective emb :=
        fun ⟨_, hy⟩ => ⟨hy.choose, Subtype.ext hy.choose_spec⟩
      exact (Ordinal.type_eq.mpr ⟨RelIso.ofSurjective emb hsurj |>.symm⟩).trans
        (Ordinal.type_toType γ')

end Erdos1169
