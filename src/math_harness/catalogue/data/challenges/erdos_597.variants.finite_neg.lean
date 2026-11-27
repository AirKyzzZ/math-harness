import Mathlib

open Cardinal Ordinal

open scoped Cardinal Ordinal

namespace Erdos597

def OrdinalGraphRamsey {W : Type*} (α β : Ordinal.{0}) (G : SimpleGraph W) : Prop :=
  ∀ red blue : SimpleGraph α.ToType, IsCompl red blue →
    (∃ s, red.IsClique s ∧ typeLT s = β) ∨
    (∃ f : W → α.ToType, Function.Injective f ∧
      ∀ a b, G.Adj a b → blue.Adj (f a) (f b))

theorem erdos_597.variants.finite_neg :
    ¬ (∀ (W : Type) [Fintype W] (G : SimpleGraph W), G.CliqueFree 4 → OrdinalGraphRamsey ((ω_ 1) ^ (2 : ℕ)) ((ω_ 1) * ω) G) := by
  sorry

theorem ordinalGraphRamsey_bot :
    OrdinalGraphRamsey ((ω_ 1) ^ (2 : ℕ)) ((ω_ 1) * ω) (⊥ : SimpleGraph (Fin 1)) := by
  intro red blue _
  right
  have : Nonempty ((ω_ 1) ^ (2 : ℕ)).ToType := by
    rw [Ordinal.nonempty_toType_iff]
    exact pow_ne_zero 2 (omega_pos 1).ne'
  obtain ⟨x⟩ := this
  exact ⟨fun _ => x, fun a b _ => Subsingleton.elim a b, fun a b h => by simp at h⟩

end Erdos597
