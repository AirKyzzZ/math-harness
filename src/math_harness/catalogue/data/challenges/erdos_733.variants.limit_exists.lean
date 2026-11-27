import Mathlib

open EuclideanGeometry Filter Topology

namespace Erdos733

abbrev Line : Type :=
  {ℓ : AffineSubspace ℝ ℝ² // (ℓ : Set ℝ²).Nonempty ∧ IsLine ℓ}

theorem nonempty_of_isLine {ℓ : AffineSubspace ℝ ℝ²} (h : IsLine ℓ) :
    (ℓ : Set ℝ²).Nonempty := by
  rw [AffineSubspace.nonempty_iff_ne_bot]
  rintro rfl
  rw [IsLine, AffineSubspace.direction_bot, finrank_bot] at h
  exact zero_ne_one h

open scoped Classical in
noncomputable def lineCount (P : Finset ℝ²) (ℓ : Line) : ℕ :=
  (P.filter fun p ↦ p ∈ (ℓ.1 : AffineSubspace ℝ ℝ²)).card

noncomputable def lineSizeMultiset (P : Finset ℝ²) (L : Finset Line) : Multiset ℕ :=
  L.val.map (lineCount P)

noncomputable def lineSizeSequence (P : Finset ℝ²) (L : Finset Line) : List ℕ :=
  (lineSizeMultiset P L).sort (· ≤ ·)

def LineCompatible (n : ℕ) (X : List ℕ) : Prop :=
  ∃ P : Finset ℝ², P.card = n ∧
    ∃ L : Finset Line, (∀ ℓ ∈ L, 2 ≤ lineCount P ℓ) ∧ X = lineSizeSequence P L

def compatibleSequences (n : ℕ) : Set (List ℕ) :=
  {X | LineCompatible n X}

def allLinesSequences (n : ℕ) : Set (List ℕ) :=
  {X | ∃ P : Finset ℝ², P.card = n ∧
    ∃ L : Finset Line, (∀ ℓ : Line, ℓ ∈ L ↔ 2 ≤ lineCount P ℓ) ∧ X = lineSizeSequence P L}

theorem erdos_733.variants.limit_exists :
    ∃ c : ℝ, Tendsto (fun n : ℕ ↦ Real.log ((allLinesSequences n).ncard : ℝ) / Real.sqrt n) atTop (𝓝 c) := by
  sorry

end Erdos733
