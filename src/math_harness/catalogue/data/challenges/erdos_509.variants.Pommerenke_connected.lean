import Mathlib

namespace Erdos509

open Polynomial

open scoped Real

section BoundedDiscCover

universe u v

variable {M : Type u} [MetricSpace M]

structure BoundedDiscCover (S : Set M) (r : ℝ) (ι : Type v) where
  (C : ι → M)
  (R : ι → ℝ)
  (h_cover : S ⊆ ⋃ (i : ι), Metric.closedBall (C i) (R i))
  (h_summable : Summable (fun i : ι => R i))
  (h_bdd : ∑' i, R i ≤ r)
  (h_pos : ∀ i, 0 < R i)

variable (S : Set M) (r : ℝ)

noncomputable def boundedDiscCover_empty [Nonempty M] (r : ℝ) (hr : 0 < r) :
  (BoundedDiscCover (∅ : Set M) r (PUnit : Type v)) where
  C := fun _ => Classical.ofNonempty
  R := fun _ => r
  h_cover := Set.empty_subset _
  h_summable := (hasSum_fintype _).summable
  h_bdd := by
    have := hasSum_fintype fun (_ : (PUnit : Type v)) => if 0 ≤ r then -1 else r
    simp only [tsum_const, Nat.card_eq_fintype_card, Fintype.card_ofSubsingleton, one_smul,
      ge_iff_le]
    bound
  h_pos := by aesop

lemma BoundedDiscCover.bound_nonneg_of_nonempty
    (S : Set M) (hS : S.Nonempty) (r : ℝ) (ι : Type v)
    (bdc : BoundedDiscCover S r ι) :
    0 < r := by
  apply lt_of_lt_of_le _ bdc.h_bdd
  suffices Nonempty ι by
    apply Summable.tsum_pos bdc.h_summable (fun j => le_of_lt (bdc.h_pos j)) Classical.ofNonempty (bdc.h_pos _)
  by_contra!
  apply Set.Nonempty.ne_empty hS (Set.eq_empty_of_subset_empty _)
  convert bdc.h_cover
  aesop

end BoundedDiscCover

theorem erdos_509.variants.Pommerenke_connected :
    ∀ (f : ℂ[X]), f.Monic → f.natDegree ≠ 0 → IsConnected {z | ‖f.eval z‖ ≤ 1} → ∃ (ι : Type), Nonempty (BoundedDiscCover {z | ‖f.eval z‖ ≤ 1} 2 ι) := by
  sorry

end Erdos509
