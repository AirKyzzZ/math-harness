import Mathlib

open Filter Asymptotics

namespace Erdos983

def numSmooth (A S : Finset ℕ) : ℕ :=
  (A.filter fun a => ∀ p ∈ a.primeFactors, p ∈ S).card

noncomputable def f (k n : ℕ) : ℕ :=
  sInf {r : ℕ | ∀ A : Finset ℕ, A ⊆ Finset.Icc 1 n → A.card = k →
    ∃ S : Finset ℕ, S.card = r ∧ (∀ p ∈ S, p.Prime) ∧ r < numSmooth A S}

theorem f_le {k n r : ℕ}
    (h : ∀ A : Finset ℕ, A ⊆ Finset.Icc 1 n → A.card = k →
      ∃ S : Finset ℕ, S.card = r ∧ (∀ p ∈ S, p.Prime) ∧ r < numSmooth A S) :
    f k n ≤ r :=
  Nat.sInf_le h

theorem erdos_983.parts.i_neg :
    ¬ (¬ Tendsto (fun n : ℕ ↦ 2 * (Nat.primeCounting (Nat.sqrt n) : ℤ) - (f (Nat.primeCounting n + 1) n : ℤ)) atTop atTop) := by
  sorry

theorem erdos_983.variants.le_primeCounting {k n : ℕ} (hk : Nat.primeCounting n < k) :
    f k n ≤ Nat.primeCounting n := by
  -- Take `S` to be the set of all primes `≤ n`: every element of `A` is then `S`-smooth.
  refine f_le fun A hA hAk => ⟨(Finset.range (n + 1)).filter Nat.Prime, ?_, ?_, ?_⟩
  · simp [Nat.primeCounting, Nat.primeCounting', Nat.count_eq_card_filter_range]
  · exact fun p hp => (Finset.mem_filter.mp hp).2
  · have hAll : A.filter (fun a => ∀ p ∈ a.primeFactors,
        p ∈ (Finset.range (n + 1)).filter Nat.Prime) = A := by
      refine Finset.filter_true_of_mem fun a ha p hp => ?_
      have ha' := Finset.mem_Icc.mp (hA ha)
      have hp' := Nat.mem_primeFactors.mp hp
      have hpa : p ≤ a := Nat.le_of_dvd (by omega) hp'.2.1
      exact Finset.mem_filter.mpr ⟨Finset.mem_range.mpr (by omega), hp'.1⟩
    rw [numSmooth, hAll, hAk]
    exact hk

end Erdos983
