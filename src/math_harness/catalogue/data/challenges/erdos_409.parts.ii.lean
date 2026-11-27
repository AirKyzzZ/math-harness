import Mathlib

open scoped Topology ArithmeticFunction.sigma Nat

open Filter

namespace Erdos409

-- Formalisation note: the sequence of iterates always terminates if `n > 0`

-- since it is strictly decreasing unless the input is prime, at which point

-- it becomes static. See also https://oeis.org/A39651

theorem erdos_409.variants.termination (n : ℕ) (hn : 0 < n) :
    ∃ i, (φ · + 1)^[i] n |>.Prime := by
  induction n using Nat.strong_induction_on with
  | _ n ih =>
    by_cases hp : n.Prime
    · exact ⟨0, by simpa using hp⟩
    · have h1 : n = 1 ∨ 1 < n := by omega
      rcases h1 with h1 | h1
      · subst h1
        refine ⟨1, ?_⟩
        norm_num [Function.iterate_one, Nat.totient_one]
      · have hlt : φ n < n := Nat.totient_lt n h1
        have hne : φ n ≠ n - 1 := by
          intro h
          exact hp ((Nat.totient_eq_iff_prime hn).1 h)
        have hdec : φ n + 1 < n := by omega
        have hpos : 0 < φ n + 1 := by positivity
        obtain ⟨i, hi⟩ := ih (φ n + 1) hdec hpos
        refine ⟨i + 1, ?_⟩
        rw [Function.iterate_succ_apply]
        exact hi

-- Formalisation note: it's possible that solution to `erdos_409.parts.i` needs to be

-- expressed asymptotically. To handle this we include `IsTheta`, `IsBigO`

-- and `IsLittleO` variants below. Since a solution is not known this necessitates

-- the use of an `answer` definition left as `sorry`. Trivial or sub-optimal solutions

-- will therefore exist to the asymptotic formalisations. A true solution to

-- the asymptotic variants should have a degree of optimality or non-triviality to it.

theorem erdos_409.parts.ii :
    ∃ (p : ℕ) (hp : p.Prime), { n | ∃ i, (φ · + 1)^[i] n = p }.Infinite := by
  sorry

-- Formalisation note: termination of this sequence is not known in general since

-- it is strictly increasing except at primes, so it is assumed as a hypothesis.

-- Formalisation note: See the above formalisation note for the rationale

-- for including asymptotic variants

end Erdos409
