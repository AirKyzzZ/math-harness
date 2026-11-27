import Mathlib

open Finset Filter

open scoped Asymptotics

namespace Erdos865

theorem erdos_865.variants.k2 (N : ℕ) :
    ∀ A ⊆ Icc 1 (2 * N), A.card ≥ N + 2 →
    ∃ a ∈ A, ∃ b ∈ A, a ≠ b ∧ a + b ∈ A := by
  intro A hA hcard
  have hne : A.Nonempty := by
    rw [← Finset.card_pos]; omega
  set m := A.max' hne with hm
  have hmA : m ∈ A := Finset.max'_mem A hne
  have hmle : m ≤ 2 * N := by
    have := hA hmA
    rw [Finset.mem_Icc] at this
    omega
  have hcard' : (Icc 1 N).card < (A.erase m).card := by
    rw [Finset.card_erase_of_mem hmA, Nat.card_Icc]
    omega
  have hmaps : ∀ x ∈ A.erase m, min x (m - x) ∈ Icc 1 N := by
    intro x hx
    obtain ⟨hxm, hxA⟩ := Finset.mem_erase.mp hx
    have hxle : x ≤ m := Finset.le_max' A x hxA
    have hx1 := (Finset.mem_Icc.mp (hA hxA)).1
    rw [Finset.mem_Icc]
    omega
  obtain ⟨x, hx, y, hy, hxy, hxyeq⟩ :=
    Finset.exists_ne_map_eq_of_card_lt_of_maps_to hcard' hmaps
  obtain ⟨hxm, hxA⟩ := Finset.mem_erase.mp hx
  obtain ⟨hym, hyA⟩ := Finset.mem_erase.mp hy
  have hxle : x ≤ m := Finset.le_max' A x hxA
  have hyle : y ≤ m := Finset.le_max' A y hyA
  refine ⟨x, hxA, y, hyA, hxy, ?_⟩
  have : x + y = m := by omega
  rw [this]
  exact hmA

noncomputable def f (N k : ℕ) : ℕ :=
  sInf {m | ∀ A ⊆ Icc 1 N, A.card ≥ m →
    ∃ S ⊆ A, S.card = k ∧ ∀ x ∈ S, ∀ y ∈ S, x ≠ y → x + y ∈ A}

theorem erdos_865.variants.upper_bound (k : ℕ) (hk : 3 ≤ k) :
    ∃ ε > 0, ∀ᶠ N in atTop, (f N k : ℝ) ≤ (2 / 3 - ε) * N := by
  sorry

end Erdos865
