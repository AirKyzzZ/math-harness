import Mathlib

open scoped Pointwise Cardinal

namespace Erdos274

-- TODO(callesonne): add already proved results from the wiki page

structure Group.ExactCovering (G : Type*) [Group G] (ι : Type*) [Fintype ι] where
  parts : ι → Subgroup G
  reps : ι → G
  nonempty (i : ι) : (parts i : Set G).Nonempty
  disjoint : (Set.univ (α := ι)).PairwiseDisjoint fun (i : ι) ↦ reps i • (parts i : Set G)
  covers : ⋃ i, reps i • (parts i : Set G) = Set.univ

theorem erdos_274.variants.abelian {G : Type*} [Fintype G] [CommGroup G] (hG : 1 < Fintype.card G) {ι : Type*} [Fintype ι] (P : Group.ExactCovering G ι) (hι : 1 < Fintype.card ι) :
    ∃ i j, i ≠ j ∧ #(P.parts i) = #(P.parts j) := by
  sorry

end Erdos274
