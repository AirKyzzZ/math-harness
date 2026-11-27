import Mathlib

open Cardinal Ordinal Combinatorics

namespace Erdos1219

universe u

theorem erdos_1219_neg :
    ¬ (∀ n : ℕ → ℕ, StrictMono n → StrictMono (fun k => (2 : Cardinal.{u}) ^ ℵ_ (n k)) → ℵ_ ω < (2 : Cardinal.{u}) ^ ℵ_ (n 0) → cardinalPartitionRel (sum fun k => (2 : Cardinal.{u}) ^ ℵ_ (n k)) 2 2 (fun _ => ℵ_ ω)) := by
  sorry

theorem erdos_1219.test.aleph_omega_lt_sum (n : ℕ → ℕ)
    (h0 : ℵ_ ω < (2 : Cardinal.{u}) ^ ℵ_ (n 0)) :
    ℵ_ ω < sum fun k => (2 : Cardinal.{u}) ^ ℵ_ (n k) :=
  h0.trans_le (le_sum _ 0)

end Erdos1219
