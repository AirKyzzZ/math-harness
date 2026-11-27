import Mathlib

namespace Erdos769

open Filter

open scoped Topology

structure Cube (n : ℕ) where
  lower : Fin n → ℝ
  side : ℝ

def Cube.Mem {n : ℕ} (Q : Cube n) (x : Fin n → ℝ) : Prop :=
  ∀ j, Q.lower j ≤ x j ∧ x j < Q.lower j + Q.side

def InUnit {n : ℕ} (x : Fin n → ℝ) : Prop :=
  ∀ j, 0 ≤ x j ∧ x j < 1

def Cube.InsideUnit {n : ℕ} (Q : Cube n) : Prop :=
  0 < Q.side ∧ ∀ j, 0 ≤ Q.lower j ∧ Q.lower j + Q.side ≤ 1

def IsTiling {n k : ℕ} (tiles : Fin k → Cube n) : Prop :=
  (∀ i, (tiles i).InsideUnit) ∧ ∀ x, InUnit x → ∃! i, (tiles i).Mem x

def Admissible (n k : ℕ) : Prop :=
  ∃ tiles : Fin k → Cube n, IsTiling tiles

def IsCutoff (n c : ℕ) : Prop :=
  (∀ k, c ≤ k → Admissible n k) ∧ (c = 0 ∨ ¬Admissible n (c - 1))

def Erdos769LowerBound : Prop :=
  ∃ A B N : ℕ, 0 < A ∧ 0 < B ∧
    ∀ n c : ℕ, N ≤ n → IsCutoff n c → A * n ^ n ≤ B * c

theorem erdos_769_neg :
    ¬ (¬ Erdos769LowerBound) := by
  sorry

end Erdos769
