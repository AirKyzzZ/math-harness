import Mathlib

namespace Erdos174

def IsRamsey {n : ℕ} (A : Set (EuclideanSpace ℝ (Fin n))) : Prop :=
  A.Finite ∧ ∀ k : ℕ, 1 ≤ k → ∃ d : ℕ, ∀ c : EuclideanSpace ℝ (Fin d) → Fin k,
    ∃ p : A → EuclideanSpace ℝ (Fin d),
      Congruent (fun a : A ↦ (a : EuclideanSpace ℝ (Fin n))) p ∧ ∃ i, ∀ a, c (p a) = i

def IsTransitive {m : ℕ} (X : Set (EuclideanSpace ℝ (Fin m))) : Prop :=
  X.Finite ∧ ∀ x ∈ X, ∀ y ∈ X,
    ∃ g : EuclideanSpace ℝ (Fin m) ≃ᵢ EuclideanSpace ℝ (Fin m), g '' X = X ∧ g x = y

def IsSubtransitive {n : ℕ} (A : Set (EuclideanSpace ℝ (Fin n))) : Prop :=
  ∃ (m : ℕ) (Y : Set (EuclideanSpace ℝ (Fin m))), IsTransitive Y ∧
    ∃ p : A → EuclideanSpace ℝ (Fin m),
      Congruent (fun a : A ↦ (a : EuclideanSpace ℝ (Fin n))) p ∧ ∀ a, p a ∈ Y

theorem isRamsey_singleton {n : ℕ} (x : EuclideanSpace ℝ (Fin n)) : IsRamsey {x} :=
  ⟨Set.finite_singleton x, fun _ _ ↦ ⟨0, fun c ↦
    ⟨fun _ ↦ 0, Congruent.of_subsingleton_index, c 0, fun _ ↦ rfl⟩⟩⟩

theorem erdos_174.variants.graham {n : ℕ} (A : Set (EuclideanSpace ℝ (Fin n))) (hA : A.Finite) (hs : EuclideanGeometry.Cospherical A) :
    IsRamsey A := by
  sorry

end Erdos174
