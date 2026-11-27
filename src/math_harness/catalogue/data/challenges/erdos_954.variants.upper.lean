import Mathlib

open Filter Asymptotics

namespace Erdos954

def pairCount (a : ℕ → ℕ) (m n : ℕ) : ℕ :=
  ((Finset.range (m + 1) ×ˢ Finset.range (m + 1)).filter
    fun p : ℕ × ℕ => p.1 ≤ p.2 ∧ 1 ≤ p.2 ∧ a p.1 + a p.2 ≤ n).card

noncomputable def rosenAux : ℕ → ℕ → ℕ
  | 0 => fun i => if i = 0 then 0 else 1
  | k + 1 => fun i =>
      if i = k + 2 then sInf {n : ℕ | pairCount (rosenAux k) (k + 1) n < n} else rosenAux k i

noncomputable def rosen (k : ℕ) : ℕ := rosenAux k k

noncomputable def solutionCount (x : ℕ) : ℕ := pairCount rosen x x

theorem rosen_zero : rosen 0 = 0 := by
  decide

theorem rosen_one : rosen 1 = 1 := by
  decide

theorem rosen_two : rosen 2 = 3 := by
  show sInf {n : ℕ | pairCount (rosenAux 0) 1 n < n} = 3
  exact IsLeast.csInf_eq (by decide)

theorem erdos_954.variants.upper :
    ∀ ε > (0 : ℝ), ∀ᶠ x : ℕ in atTop, (solutionCount x : ℝ) ≤ (1 + ε) * x := by
  sorry

end Erdos954
