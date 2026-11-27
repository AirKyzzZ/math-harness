import Mathlib

open Filter Topology

namespace Erdos717

abbrev CliqueEdge (r : ℕ) := {e : Fin r × Fin r // e.1 < e.2}

def walkInteriorSet {V : Type*} {G : SimpleGraph V} {u v : V} (p : G.Walk u v) : Set V :=
  {x | x ∈ p.support ∧ x ≠ u ∧ x ≠ v}

structure CliqueSubdivision {V : Type*} (G : SimpleGraph V) (r : ℕ) where
  branch : Fin r ↪ V
  path : ∀ e : CliqueEdge r, G.Walk (branch e.1.1) (branch e.1.2)
  path_isPath : ∀ e, (path e).IsPath
  interior_avoids_branch : ∀ e, Disjoint (walkInteriorSet (path e)) (Set.range branch)
  interior_pairwise : Pairwise fun e f =>
    Disjoint (walkInteriorSet (path e)) (walkInteriorSet (path f))

def ContainsCliqueSubdivision {V : Type*} (G : SimpleGraph V) (r : ℕ) : Prop :=
  Nonempty (CliqueSubdivision G r)

open scoped Classical in
noncomputable def cliqueSubdivisionNumber {V : Type*} [Fintype V] (G : SimpleGraph V) : ℕ :=
  Nat.findGreatest (ContainsCliqueSubdivision G) (Fintype.card V)

theorem CliqueEdge.isEmpty_one : IsEmpty (CliqueEdge 1) :=
  ⟨fun e => (lt_irrefl e.1.1) (Subsingleton.elim e.1.2 e.1.1 ▸ e.2)⟩

theorem containsCliqueSubdivision_one {V : Type*} (G : SimpleGraph V) (v : V) :
    ContainsCliqueSubdivision G 1 := by
  have := CliqueEdge.isEmpty_one
  exact ⟨{
    branch := ⟨fun _ => v, fun a b _ => Subsingleton.elim a b⟩
    path := fun e => isEmptyElim e
    path_isPath := fun e => isEmptyElim e
    interior_avoids_branch := fun e => isEmptyElim e
    interior_pairwise := fun e => isEmptyElim e }⟩

theorem card_le_of_containsCliqueSubdivision {V : Type*} [Fintype V] {G : SimpleGraph V}
    {r : ℕ} (h : ContainsCliqueSubdivision G r) : r ≤ Fintype.card V := by
  obtain ⟨S⟩ := h
  simpa using Fintype.card_le_of_injective S.branch S.branch.injective

theorem le_cliqueSubdivisionNumber {V : Type*} [Fintype V] {G : SimpleGraph V} {r : ℕ}
    (h : ContainsCliqueSubdivision G r) : r ≤ cliqueSubdivisionNumber G := by
  classical
  exact Nat.le_findGreatest (card_le_of_containsCliqueSubdivision h) h

theorem one_le_cliqueSubdivisionNumber {V : Type*} [Fintype V] [Nonempty V]
    (G : SimpleGraph V) : 1 ≤ cliqueSubdivisionNumber G :=
  le_cliqueSubdivisionNumber (containsCliqueSubdivision_one G (Classical.choice inferInstance))

theorem erdos_717 :
    ∃ C : ℝ, 0 < C ∧ ∀ (V : Type) [Fintype V] (G : SimpleGraph V), 2 ≤ Fintype.card V → (G.chromaticNumber.toNat : ℝ) ≤ C * (Real.sqrt (Fintype.card V : ℝ) / Real.log (Fintype.card V : ℝ)) * (cliqueSubdivisionNumber G : ℝ) := by
  sorry

end Erdos717
