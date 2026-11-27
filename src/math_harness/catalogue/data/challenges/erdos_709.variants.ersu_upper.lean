import Mathlib

open Filter Asymptotics

namespace Erdos709

def window (start length : ℕ) : Finset ℕ := Finset.Icc (start + 1) (start + length)

def HasDistinctMultiples (A : Finset ℕ) (start length : ℕ) : Prop :=
  ∃ choice : ℕ → ℕ,
    Set.InjOn choice (A : Set ℕ) ∧
    ∀ a ∈ A, choice a ∈ window start length ∧ a ∣ choice a

def Works (n k : ℕ) : Prop :=
  ∀ (A : Finset ℕ) (M : ℕ),
    A.card = n → M ∈ A → (∀ a ∈ A, a ≤ M) → (∀ a ∈ A, 2 ≤ a) →
    ∀ start : ℕ, HasDistinctMultiples A start (k * M)

def IsOptimal (n k : ℕ) : Prop := Works n k ∧ ∀ j < k, ¬ Works n j

theorem matching_mono_length
    (A : Finset ℕ) (start small large : ℕ) (hsmall : small ≤ large)
    (h : HasDistinctMultiples A start small) : HasDistinctMultiples A start large := by
  obtain ⟨choice, hinj, hchoice⟩ := h
  refine ⟨choice, hinj, ?_⟩
  intro a ha
  obtain ⟨hmem, hdvd⟩ := hchoice a ha
  refine ⟨?_, hdvd⟩
  simp only [window, Finset.mem_Icc] at hmem ⊢
  constructor
  · exact hmem.1
  · omega

theorem works_mono (n k l : ℕ) (hkl : k ≤ l) (h : Works n k) : Works n l := by
  intro A M hcard hmax hbound htwo start
  exact matching_mono_length A start (k * M) (l * M) (Nat.mul_le_mul_right M hkl)
    (h A M hcard hmax hbound htwo start)

theorem exists_multiple_in_window
    (a M start : ℕ) (ha : 0 < a) (haM : a ≤ M) :
    ∃ b ∈ window start M, a ∣ b := by
  let r := start % a
  let b := start + (a - r)
  have hr : r < a := Nat.mod_lt start ha
  have heq : start % a + a * (start / a) = start := by
    simpa [Nat.mul_comm] using Nat.mod_add_div start a
  have hbdiv : b = a * (start / a + 1) := by
    have haux : b = a * (start / a) + a := by
      dsimp [b, r]
      omega
    calc
      b = a * (start / a) + a := haux
      _ = a * (start / a + 1) := by ring
  refine ⟨b, ?_, ?_⟩
  · simp only [window, Finset.mem_Icc]
    constructor
    · dsimp [b]
      omega
    · dsimp [b]
      omega
  · exact ⟨start / a + 1, hbdiv⟩

theorem erdos_709.variants.singleton : Works 1 1 := by
  intro A M hcard hM hbound htwo start
  have hA : A = {M} := by
    obtain ⟨z, hz⟩ := Finset.card_eq_one.mp hcard
    have hMz : M = z := Finset.mem_singleton.mp (hz ▸ hM)
    simpa [hMz] using hz
  obtain ⟨b, hb, hd⟩ :=
    exists_multiple_in_window M M start (by have := htwo M hM; omega) le_rfl
  refine ⟨fun _ => b, ?_, ?_⟩
  · intro u hu v hv _
    rw [hA] at hu hv
    simp only [Finset.coe_singleton, Set.mem_singleton_iff] at hu hv
    exact hu.trans hv.symm
  · intro a ha
    rw [hA] at ha
    have hEq : a = M := Finset.mem_singleton.mp ha
    subst a
    simpa using And.intro hb hd

theorem works_one_of_one_le (k : ℕ) (hk : 1 ≤ k) : Works 1 k :=
  works_mono 1 1 k hk erdos_709.variants.singleton

def IsAdmissible (n : ℕ) (c : ℝ) : Prop :=
  ∀ A : Finset ℕ, A.card = n → (∀ a ∈ A, 2 ≤ a) →
    ∀ start length : ℕ, c * ((A.sup id : ℕ) : ℝ) ≤ (length : ℝ) →
      HasDistinctMultiples A start length

noncomputable def f (n : ℕ) : ℝ := sInf {c : ℝ | IsAdmissible n c}

theorem not_hasDistinctMultiples_two_three : ¬ HasDistinctMultiples {2, 3} 4 3 := by
  rintro ⟨x, hinj, h⟩
  obtain ⟨h2w, h2d⟩ := h 2 (by simp)
  obtain ⟨h3w, h3d⟩ := h 3 (by simp)
  simp only [window, Finset.mem_Icc] at h2w h3w
  have h23 : x 2 = x 3 := by omega
  have := hinj (by simp) (by simp) h23
  omega

theorem erdos_709.variants.ersu_upper :
    f =O[atTop] fun n : ℕ ↦ (n : ℝ) ^ (1 / 2 : ℝ) := by
  sorry

end Erdos709
