import Mathlib

namespace Erdos1098

def nonCommutingGraph (G : Type*) [Group G] : SimpleGraph G where
  Adj g h := g * h ≠ h * g
  symm.symm := fun _ _ h => h.symm

@[simp]
theorem nonCommutingGraph_adj {G : Type*} [Group G] (g h : G) :
    (nonCommutingGraph G).Adj g h ↔ g * h ≠ h * g := Iff.rfl

theorem erdos_1098 :
    ∀ (G : Type*) [Group G], (∀ s : Set G, (nonCommutingGraph G).IsClique s → s.Finite) → ∃ n : ℕ, ∀ s : Finset G, (nonCommutingGraph G).IsClique (s : Set G) → s.card ≤ n := by
  sorry

theorem erdos_1098.variants.upper_bound (G : Type*) [Group G]
    [(Subgroup.center G).FiniteIndex] :
    (nonCommutingGraph G).CliqueFree ((Subgroup.center G).index + 1) := by
  intro s hs
  have hinj : Set.InjOn (fun g : G => (QuotientGroup.mk g : G ⧸ Subgroup.center G)) s := by
    intro x hx y hy hxy
    by_contra hne
    apply hs.isClique hx hy hne
    obtain ⟨z, hz, rfl⟩ : ∃ z ∈ Subgroup.center G, y = x * z :=
      ⟨x⁻¹ * y, QuotientGroup.eq.mp hxy, by group⟩
    rw [mul_assoc, Subgroup.mem_center_iff.mp hz x, ← mul_assoc]
  have : Finite (G ⧸ Subgroup.center G) := Subgroup.finite_quotient_of_finiteIndex
  let _ := Fintype.ofFinite (G ⧸ Subgroup.center G)
  have h1 := Finset.card_le_card_of_injOn _ (t := Finset.univ)
    (fun x _ => Finset.mem_coe.2 (Finset.mem_univ _)) hinj
  rw [hs.card_eq, Finset.card_univ, ← Nat.card_eq_fintype_card, ← Subgroup.index] at h1
  omega

end Erdos1098
