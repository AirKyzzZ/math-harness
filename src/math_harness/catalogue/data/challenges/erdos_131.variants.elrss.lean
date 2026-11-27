import Mathlib

open Filter Topology

namespace Erdos131

def NonDividing (A : Finset ℕ) : Prop :=
  ∀ a ∈ A, ∀ S ⊆ A.erase a, S.Nonempty → ¬ a ∣ ∑ x ∈ S, x

instance (A : Finset ℕ) : Decidable (NonDividing A) := by
  unfold NonDividing; infer_instance

def F (N : ℕ) : ℕ :=
  (((Finset.Icc 1 N).powerset).filter NonDividing).sup Finset.card

theorem exists_card_eq_F (N : ℕ) :
    ∃ A ⊆ Finset.Icc 1 N, NonDividing A ∧ A.card = F N := by
  obtain ⟨A, hA, h⟩ := Finset.exists_mem_eq_sup
    (((Finset.Icc 1 N).powerset).filter NonDividing)
    ⟨∅, by simp [NonDividing]⟩ Finset.card
  simp only [Finset.mem_filter, Finset.mem_powerset] at hA
  exact ⟨A, hA.1, hA.2, h.symm⟩

theorem card_le_F {N : ℕ} {A : Finset ℕ} (hA : A ⊆ Finset.Icc 1 N) (hnd : NonDividing A) :
    A.card ≤ F N :=
  Finset.le_sup (f := Finset.card) (by simp [hA, hnd])

theorem F_le (N : ℕ) : F N ≤ N := by
  obtain ⟨A, hA, -, h⟩ := exists_card_eq_F N
  simpa [← h] using Finset.card_le_card hA

theorem F_mono : Monotone F := fun _ _ hMN =>
  let ⟨_, hA, hnd, h⟩ := exists_card_eq_F _
  h ▸ card_le_F (hA.trans (Finset.Icc_subset_Icc_right hMN)) hnd

theorem one_le_F {N : ℕ} (hN : 1 ≤ N) : 1 ≤ F N := by
  have h := card_le_F (N := N) (A := {N}) (by simp [hN]) (by
    intro a ha S hS hne
    have : S = ∅ := by simpa [Finset.mem_singleton.1 ha] using hS
    simp [this] at hne)
  simpa using h

theorem erdos_131.variants.elrss (N : ℕ) :
    (F N : ℝ) < 3 * Real.sqrt N + 1 := by
  sorry

theorem erdos_131 :
    ¬ ∃ f : ℕ → ℝ, Tendsto f atTop (𝓝 0) ∧
      ∀ᶠ N : ℕ in atTop, (N : ℝ) ^ ((1 : ℝ) / 2 - f N) < (F N : ℝ) := by
  rintro ⟨f, hf, hlow⟩
  obtain ⟨g, hg, hup⟩ := erdos_131.variants.pham_zakharov
  have hf' : ∀ᶠ N : ℕ in atTop, f N < 1 / 8 := hf.eventually (gt_mem_nhds (by norm_num))
  have hg' : ∀ᶠ N : ℕ in atTop, g N < 1 / 8 := hg.eventually (gt_mem_nhds (by norm_num))
  obtain ⟨N, hN1, h1, h2, h3, h4⟩ :=
    ((eventually_ge_atTop 1).and (hlow.and (hup.and (hf'.and hg')))).exists
  have hle : (N : ℝ) ^ ((1 : ℝ) / 4 + g N) ≤ (N : ℝ) ^ ((1 : ℝ) / 2 - f N) :=
    Real.rpow_le_rpow_of_exponent_le (by exact_mod_cast hN1) (by linarith)
  linarith

end Erdos131
