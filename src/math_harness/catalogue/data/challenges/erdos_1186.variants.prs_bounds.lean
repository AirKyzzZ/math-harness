import Mathlib

open Filter Asymptotics

namespace Erdos1186

def monoCount (k n : ℕ) (c : ℕ → Bool) : ℕ :=
  ((Finset.Icc 1 n ×ˢ Finset.Icc 1 n).filter fun p : ℕ × ℕ =>
    p.1 + (k - 1) * p.2 ≤ n ∧ ∀ i < k, c (p.1 + i * p.2) = c p.1).card

noncomputable def minMonoCount (k n : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ c : ℕ → Bool, monoCount k n c = m}

noncomputable def δ (k : ℕ) : ℝ :=
  atTop.liminf (fun n : ℕ ↦ (minMonoCount k n : ℝ) / (n : ℝ) ^ 2)

theorem minMonoCount_le (k n : ℕ) (c : ℕ → Bool) : minMonoCount k n ≤ monoCount k n c :=
  Nat.sInf_le ⟨c, rfl⟩

theorem monoCount_three_five : monoCount 3 5 (fun _ => true) = 4 := by
  decide

theorem erdos_1186.variants.prs_bounds :
    1675 / 32768 ≤ δ 3 ∧ δ 3 ≤ 117 / 2192 := by
  sorry

end Erdos1186
