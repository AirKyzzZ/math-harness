import Mathlib

namespace Erdos808

def edgeValues {V R : Type*} [Fintype V] [DecidableEq R]
    (op : V → V → R) (hop : ∀ u v, op u v = op v u)
    (G : SimpleGraph V) [DecidableRel G.Adj] : Finset R :=
  G.edgeFinset.image (Sym2.lift ⟨op, hop⟩)

def edgeSums {V R : Type*} [Fintype V] [DecidableEq R] [AddCommMagma R]
    (a : V → R) (G : SimpleGraph V) [DecidableRel G.Adj] : Finset R :=
  edgeValues (fun u v ↦ a u + a v) (fun u v ↦ add_comm (a u) (a v)) G

def edgeProducts {V R : Type*} [Fintype V] [DecidableEq R] [CommMagma R]
    (a : V → R) (G : SimpleGraph V) [DecidableRel G.Adj] : Finset R :=
  edgeValues (fun u v ↦ a u * a v) (fun u v ↦ mul_comm (a u) (a v)) G

theorem mem_edgeValues_iff {V R : Type*} [Fintype V] [DecidableEq R]
    (op : V → V → R) (hop : ∀ u v, op u v = op v u)
    (G : SimpleGraph V) [DecidableRel G.Adj] (r : R) :
    r ∈ edgeValues op hop G ↔ ∃ u v, G.Adj u v ∧ r = op u v := by
  constructor
  · intro hr
    obtain ⟨e, he, her⟩ := Finset.mem_image.mp hr
    induction e using Sym2.inductionOn with
    | _ u v =>
        refine ⟨u, v, ?_, ?_⟩
        · simpa using he
        · simpa [Sym2.lift_mk] using her.symm
  · rintro ⟨u, v, huv, rfl⟩
    apply Finset.mem_image.mpr
    refine ⟨s(u, v), ?_, by simp [Sym2.lift_mk]⟩
    simpa

theorem mem_edgeSums_iff {V R : Type*} [Fintype V] [DecidableEq R] [AddCommMagma R]
    (a : V → R) (G : SimpleGraph V) [DecidableRel G.Adj] (r : R) :
    r ∈ edgeSums a G ↔ ∃ u v, G.Adj u v ∧ r = a u + a v :=
  mem_edgeValues_iff (fun u v ↦ a u + a v) (fun u v ↦ add_comm (a u) (a v)) G r

theorem mem_edgeProducts_iff {V R : Type*} [Fintype V] [DecidableEq R] [CommMagma R]
    (a : V → R) (G : SimpleGraph V) [DecidableRel G.Adj] (r : R) :
    r ∈ edgeProducts a G ↔ ∃ u v, G.Adj u v ∧ r = a u * a v :=
  mem_edgeValues_iff (fun u v ↦ a u * a v) (fun u v ↦ mul_comm (a u) (a v)) G r

theorem erdos_808 :
    ¬ ∀ c : ℝ, 0 < c → ∀ ε : ℝ, 0 < ε → ∃ n₀ : ℕ, ∀ (V : Type) [Fintype V] (a : V ↪ ℕ) (G : SimpleGraph V) [DecidableRel G.Adj], n₀ ≤ Fintype.card V → (Fintype.card V : ℝ) ^ (1 + c) ≤ (G.edgeFinset.card : ℝ) → (Fintype.card V : ℝ) ^ (1 + c - ε) ≤ max ((edgeSums a G).card : ℝ) ((edgeProducts a G).card : ℝ) := by
  sorry

end Erdos808
