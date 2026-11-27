import Mathlib

open Filter

open scoped EuclideanGeometry

namespace Erdos651

def IsInGeneralPosition {k : ℕ} (X : Finset (ℝ^k)) : Prop :=
  ∀ Y ⊆ X, Y.card ≤ k + 1 → AffineIndependent ℝ ((↑) : ↥(Y : Set (ℝ^k)) → ℝ^k)

def HasConvexSubset {k : ℕ} (n : ℕ) (X : Finset (ℝ^k)) : Prop :=
  ∃ Y ⊆ X, Y.card = n ∧ ConvexIndependent ℝ ((↑) : ↥(Y : Set (ℝ^k)) → ℝ^k)

def cardSet (k n : ℕ) : Set ℕ :=
  {N | ∀ X : Finset (ℝ^k), IsInGeneralPosition X → N ≤ X.card → HasConvexSubset n X}

noncomputable def f (k n : ℕ) : ℕ := sInf (cardSet k n)

theorem cardSet_mono {k n N M : ℕ} (hN : N ∈ cardSet k n) (hNM : N ≤ M) :
    M ∈ cardSet k n := by
  intro X hX hM
  exact hN X hX (hNM.trans hM)

theorem f_le {k n N : ℕ} (h : N ∈ cardSet k n) : f k n ≤ N :=
  Nat.sInf_le h

theorem erdos_651.variants.pohoata_zakharov {k : ℕ} (hk : 3 ≤ k) :
    ∀ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop, (f k n : ℝ) ≤ (2 : ℝ) ^ (ε * (n : ℝ)) := by
  sorry

end Erdos651
