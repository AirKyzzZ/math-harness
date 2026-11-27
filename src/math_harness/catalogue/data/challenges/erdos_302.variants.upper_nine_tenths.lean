import Mathlib

open Filter Finset

open scoped Topology

namespace Erdos302

def NoUnitFractionTriple (A : Finset ℕ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ c ∈ A, a ≠ b → a ≠ c → b ≠ c →
    (1 : ℚ) / a ≠ (1 : ℚ) / b + (1 : ℚ) / c

def IsMaxNoTripleCard (N m : ℕ) : Prop :=
  IsGreatest {k | ∃ A ⊆ Finset.Icc 1 N, NoUnitFractionTriple A ∧ A.card = k} m

theorem erdos_302.variants.lower_half (f : ℕ → ℕ) (hf : ∀ N, IsMaxNoTripleCard N (f N))
    (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ N : ℕ in atTop, ((1 : ℝ) / 2 - ε) * N ≤ f N := by
  refine Filter.Eventually.of_forall fun N => ?_
  set A : Finset ℕ := (Finset.range ((N + 1) / 2)).image (fun x => 2 * x + 1) with hA
  have hsub : A ⊆ Finset.Icc 1 N := by
    intro a ha
    obtain ⟨x, hx, rfl⟩ := Finset.mem_image.1 ha
    rw [Finset.mem_range] at hx
    rw [Finset.mem_Icc]
    omega
  have hno : NoUnitFractionTriple A := by
    intro a ha b hb c hc _ _ _ h
    obtain ⟨x, -, rfl⟩ := Finset.mem_image.1 ha
    obtain ⟨y, -, rfl⟩ := Finset.mem_image.1 hb
    obtain ⟨z, -, rfl⟩ := Finset.mem_image.1 hc
    have hx : ((2 * x + 1 : ℕ) : ℚ) ≠ 0 := by positivity
    have hy : ((2 * y + 1 : ℕ) : ℚ) ≠ 0 := by positivity
    have hz : ((2 * z + 1 : ℕ) : ℚ) ≠ 0 := by positivity
    field_simp at h
    have h' : (2 * y + 1) * (2 * z + 1) = (2 * x + 1) * (2 * z + 1 + (2 * y + 1)) := by
      exact_mod_cast h
    have := congrArg (· % 2) h'
    simp [Nat.mul_mod, Nat.add_mod] at this
  have hcard : A.card = (N + 1) / 2 := by
    rw [hA, Finset.card_image_of_injective _ (fun x y hxy => by simpa using hxy),
      Finset.card_range]
  have hle : (N + 1) / 2 ≤ f N := by
    rw [← hcard]
    exact (hf N).2 ⟨A, hsub, hno, rfl⟩
  have h1 : (N : ℝ) ≤ 2 * ((N + 1) / 2 : ℕ) := by
    exact_mod_cast (by omega : N ≤ 2 * ((N + 1) / 2))
  have h2 : (((N + 1) / 2 : ℕ) : ℝ) ≤ f N := by exact_mod_cast hle
  have hN : (0 : ℝ) ≤ N := Nat.cast_nonneg N
  nlinarith

theorem erdos_302.variants.upper_nine_tenths (f : ℕ → ℕ) (hf : ∀ N, IsMaxNoTripleCard N (f N)) (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ N : ℕ in atTop, (f N : ℝ) ≤ ((9 : ℝ) / 10 + ε) * N := by
  sorry

end Erdos302
