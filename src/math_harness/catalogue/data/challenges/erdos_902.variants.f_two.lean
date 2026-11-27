import Mathlib

open Filter Asymptotics

namespace Erdos902

def HasPropertyS {V : Type*} (G : Digraph V) (n : ℕ) : Prop :=
  ∀ E : Finset V, E.card = n → ∃ x ∉ E, ∀ e ∈ E, G.Adj x e

noncomputable def f (n : ℕ) : ℕ :=
  sInf {m : ℕ | n ≤ m ∧ ∃ G : Digraph (Fin m), G.IsTournament ∧ HasPropertyS G n}

theorem f_one_le : f 1 ≤ 3 := by
  refine Nat.sInf_le ⟨by norm_num, ⟨fun a b => b = a + 1⟩, ⟨by decide, by decide⟩, ?_⟩
  intro E hE
  obtain ⟨a, rfl⟩ := Finset.card_eq_one.1 hE
  have key : ∀ a : Fin 3, a + 2 ≠ a ∧ a = a + 2 + 1 := by decide
  refine ⟨a + 2, by simp [(key a).1], fun e he => ?_⟩
  rw [Finset.mem_singleton.1 he]
  exact (key a).2

theorem f_two_le : f 2 ≤ 7 := by
  refine Nat.sInf_le ⟨by norm_num, ⟨fun a b => b - a ∈ ({1, 2, 4} : Finset (Fin 7))⟩,
    ⟨by decide, by decide⟩, ?_⟩
  intro E hE
  obtain ⟨a, b, hab, rfl⟩ := Finset.card_eq_two.1 hE
  have key : ∀ a b : Fin 7, a ≠ b → ∃ x, x ≠ a ∧ x ≠ b ∧
      a - x ∈ ({1, 2, 4} : Finset (Fin 7)) ∧ b - x ∈ ({1, 2, 4} : Finset (Fin 7)) := by
    decide
  obtain ⟨x, hxa, hxb, ha, hb⟩ := key a b hab
  refine ⟨x, by simp [hxa, hxb], fun e he => ?_⟩
  rcases Finset.mem_insert.1 he with rfl | he
  · exact ha
  · rw [Finset.mem_singleton.1 he]
    exact hb

theorem erdos_902.variants.f_one : f 1 = 3 := by
  refine le_antisymm f_one_le (le_csInf ⟨3, ?_⟩ ?_)
  · refine ⟨by norm_num, ⟨fun a b => b = a + 1⟩, ⟨by decide, by decide⟩, ?_⟩
    intro E hE
    obtain ⟨a, rfl⟩ := Finset.card_eq_one.1 hE
    have key : ∀ a : Fin 3, a + 2 ≠ a ∧ a = a + 2 + 1 := by decide
    refine ⟨a + 2, by simp [(key a).1], fun e he => ?_⟩
    rw [Finset.mem_singleton.1 he]
    exact (key a).2
  · rintro m ⟨hm, G, hG, hS⟩
    by_contra! hm3
    interval_cases m
    · obtain ⟨x, hx, -⟩ := hS {0} rfl
      exact hx (by simp [Subsingleton.elim x 0])
    · have h01 := hG.2 0 1 (by decide)
      by_cases h : G.Adj 0 1
      · obtain ⟨x, hx, hx0⟩ := hS {0} rfl
        have hx1 : x = 1 := by fin_cases x <;> simp_all
        subst hx1
        exact h01.1 h (hx0 0 (by simp))
      · obtain ⟨x, hx, hx1⟩ := hS {1} rfl
        have hx0 : x = 0 := by fin_cases x <;> simp_all
        subst hx0
        exact h (hx1 1 (by simp))

theorem erdos_902.variants.f_two :
    f 2 = 7 := by
  sorry

end Erdos902
