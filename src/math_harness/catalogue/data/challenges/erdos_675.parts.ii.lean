import Mathlib

open Asymptotics Filter

namespace Erdos675

def IsTranslation (A : Set ℕ) (n t : ℕ) : Prop :=
  1 ≤ t ∧ ∀ a : ℕ, 1 ≤ a → a ≤ n → (a ∈ A ↔ a + t ∈ A)

def HasTranslationProperty (A : Set ℕ) : Prop :=
  ∀ n : ℕ, ∃ t : ℕ, IsTranslation A n t

noncomputable def minTranslation (A : Set ℕ) (n : ℕ) : ℕ :=
  sInf {t : ℕ | IsTranslation A n t}

def composedOf (P : Set ℕ) : Set ℕ :=
  {m : ℕ | 0 < m ∧ ∀ p : ℕ, p.Prime → p ∣ m → p ∈ P}

theorem not_hasTranslationProperty_singleton_one : ¬ HasTranslationProperty {1} := by
  intro h
  obtain ⟨t, ht1, ht⟩ := h 1
  have h1 : 1 + t ∈ ({1} : Set ℕ) := (ht 1 le_rfl le_rfl).mp (Set.mem_singleton 1)
  rw [Set.mem_singleton_iff] at h1
  omega

theorem minTranslation_squarefree_three : minTranslation {m : ℕ | Squarefree m} 3 = 4 := by
  refine IsLeast.csInf_eq ⟨⟨by norm_num, fun a ha1 ha3 ↦ ?_⟩, fun t ⟨ht1, ht⟩ ↦ ?_⟩
  · interval_cases a <;> simp [Nat.squarefree_iff_nodup_primeFactorsList]
  · by_contra! h
    have := ht (4 - t) (by omega) (by omega)
    interval_cases t <;> simp [Nat.squarefree_iff_nodup_primeFactorsList] at this

theorem composedOf_primes : composedOf {p : ℕ | p.Prime} = {m : ℕ | 0 < m} := by
  ext m
  show (0 < m ∧ ∀ p : ℕ, p.Prime → p ∣ m → p ∈ {p : ℕ | p.Prime}) ↔ 0 < m
  exact ⟨fun h ↦ h.1, fun h ↦ ⟨h, fun _ hp _ ↦ hp⟩⟩

theorem erdos_675.parts.ii :
    ∃ P : Set ℕ, P ⊆ {p : ℕ | p.Prime} ∧ (fun x : ℕ ↦ (x : ℝ) / Real.log x) =O[atTop] (fun x ↦ ((P ∩ Set.Iic x).ncard : ℝ)) ∧ (fun x : ℕ ↦ (x : ℝ) / Real.log x) =O[atTop] (fun x ↦ ((({p : ℕ | p.Prime} \ P) ∩ Set.Iic x).ncard : ℝ)) ∧ HasTranslationProperty (composedOf P) := by
  sorry

end Erdos675
