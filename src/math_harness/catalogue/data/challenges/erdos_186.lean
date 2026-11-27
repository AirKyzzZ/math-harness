import Mathlib

open Filter Topology

namespace Erdos186

def NonAveraging (A : Finset ℕ) : Prop :=
  ∀ a ∈ A, ∀ S ⊆ A.erase a, 2 ≤ S.card → (∑ x ∈ S, x) ≠ S.card * a

instance (A : Finset ℕ) : Decidable (NonAveraging A) := by
  unfold NonAveraging; infer_instance

def F (N : ℕ) : ℕ :=
  (((Finset.Icc 1 N).powerset).filter NonAveraging).sup Finset.card

theorem card_le_F {N : ℕ} {A : Finset ℕ} (hA : A ⊆ Finset.Icc 1 N) (hna : NonAveraging A) :
    A.card ≤ F N :=
  Finset.le_sup (f := Finset.card) (by simp [hA, hna])

theorem not_nonAveraging_one_two_three : ¬ NonAveraging {1, 2, 3} := by
  decide

theorem nonAveraging_one_two_four : NonAveraging {1, 2, 4} := by
  decide

theorem erdos_186 :
    Tendsto (fun N : ℕ ↦ Real.log (F N) / Real.log N) atTop (𝓝 (1 / 4)) := by
  sorry

end Erdos186
