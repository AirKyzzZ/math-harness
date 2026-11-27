import Mathlib

open Cardinal Ordinal Combinatorics

namespace Erdos1167

universe u

theorem erdos_1167 :
    ∀ (r : ℕ), 2 ≤ r → ∀ (lam : Cardinal.{u}), ℵ₀ ≤ lam → ∀ (γ : Ordinal.{u}), 2 ≤ γ → ∀ (κ : γ.ToType → Cardinal.{u}), (∀ α, (r : Cardinal.{u}) < κ α) → cardinalPartitionRel ((2 : Cardinal.{u}) ^ lam) (r + 1) γ (fun α => κ α + 1) → cardinalPartitionRel lam r γ κ := by
  sorry

namespace erdos_1167.variants

end erdos_1167.variants

noncomputable def i0 : (1 : Ordinal.{u}).ToType := default

lemma cardinalPartitionRel_one (μ : Cardinal.{u}) (r : ℕ)
    (ν : (1 : Ordinal.{u}).ToType → Cardinal.{u}) :
    cardinalPartitionRel μ r 1 ν ↔ μ ≥ ν i0 := by
  dsimp [cardinalPartitionRel]
  constructor
  · intro h
    have hA : #(μ.out) = μ := Cardinal.mk_out μ
    rcases h μ.out hA (fun _ => i0) with ⟨i, H, hH, _⟩
    have hi : i = i0 := Subsingleton.elim i i0
    subst hi
    have hle : #H ≤ #(μ.out) := Cardinal.mk_set_le H
    rw [hH, hA] at hle
    exact hle
  · intro h A hA col
    have hle : ν i0 ≤ #A := by rwa [hA]
    rcases Cardinal.le_mk_iff_exists_set.mp hle with ⟨H, hH⟩
    use i0, H, hH
    intro s hs hsH
    exact Subsingleton.elim _ _

theorem erdos_1167.unrestricted_is_false :
    ¬ (∀ (r : ℕ), 2 ≤ r →
    ∀ (lam : Cardinal.{u}), ℵ₀ ≤ lam →
    ∀ (γ : Ordinal.{u}) (κ : γ.ToType → Cardinal.{u}),
      cardinalPartitionRel ((2 : Cardinal.{u}) ^ lam) (r + 1) γ (fun α => κ α + 1) →
      cardinalPartitionRel lam r γ κ) := by
  intro h
  have h1 := h 2 (le_refl _) ℵ₀ (le_refl _) 1 (fun _ => ℵ₁)
  have h2 : cardinalPartitionRel ((2 : Cardinal.{u}) ^ ℵ₀) 3 1 (fun _ => ℵ₁ + 1) := by
    rw [cardinalPartitionRel_one]
    have h3 : (ℵ₁ : Cardinal.{u}) + 1 = ℵ₁ := add_one_of_aleph0_le (aleph0_le_aleph 1)
    rw [h3]
    exact aleph_one_le_continuum
  have h3 := h1 h2
  rw [cardinalPartitionRel_one] at h3
  have h4 : (ℵ₀ : Cardinal.{u}) < ℵ₁ := aleph0_lt_aleph_one
  exact h4.2 h3

theorem erdos_1167.variants.infinite_targets_needs_bound :
    ¬ (∀ (r : ℕ), 2 ≤ r →
    ∀ (lam : Cardinal.{u}), ℵ₀ ≤ lam →
    ∀ (γ : Ordinal.{u}) (κ : γ.ToType → Cardinal.{u}), (∀ i, ℵ₀ ≤ κ i) →
      cardinalPartitionRel ((2 : Cardinal.{u}) ^ lam) (r + 1) γ κ →
      cardinalPartitionRel lam r γ κ) := by
  intro h
  have h1 := h 2 (le_refl _) ℵ₀ (le_refl _) 1 (fun _ => (2 : Cardinal.{u}) ^ ℵ₀)
    (fun _ => (cantor ℵ₀).le)
  have h2 : cardinalPartitionRel ((2 : Cardinal.{u}) ^ ℵ₀) 3 1
      (fun _ => (2 : Cardinal.{u}) ^ ℵ₀) := by
    rw [cardinalPartitionRel_one]
  have h3 := h1 h2
  rw [cardinalPartitionRel_one] at h3
  exact (cantor ℵ₀).2 h3

end Erdos1167
