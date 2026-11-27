import Mathlib

namespace Erdos959

open EuclideanGeometry Filter

noncomputable section

def indexPairs (n : ℕ) : Finset (Fin n × Fin n) :=
  (Finset.univ ×ˢ Finset.univ).filter fun ij => ij.1 < ij.2

def distanceValues {n : ℕ} (P : Fin n → ℝ²) : Finset ℝ :=
  (indexPairs n).image fun ij => dist (P ij.1) (P ij.2)

def frequency {n : ℕ} (P : Fin n → ℝ²) (d : ℝ) : ℕ :=
  ((indexPairs n).filter fun ij => dist (P ij.1) (P ij.2) = d).card

def runnerUpFrequency {n : ℕ} (P : Fin n → ℝ²) (d : ℝ) : ℕ :=
  ((distanceValues P).erase d).sup (frequency P)

def multiplicityGap {n : ℕ} (P : Fin n → ℝ²) : ℕ :=
  (distanceValues P).sup fun d => frequency P d - runnerUpFrequency P d

def Admissible {n : ℕ} (P : Fin n → ℝ²) : Prop :=
  Function.Injective P ∧ 2 ≤ (distanceValues P).card

def AttainableGap (n g : ℕ) : Prop :=
  ∃ P : Fin n → ℝ², Admissible P ∧ multiplicityGap P = g

def extremalGap (n : ℕ) : ℕ := by
  classical
  exact Nat.findGreatest (AttainableGap n) (Nat.choose n 2)

theorem erdos_959.lower_bound :
    ∃ c : ℝ, 0 < c ∧ ∃ N : ℕ, ∀ n ≥ N, (n : ℝ) ^ (1 + c / Real.log (Real.log n)) ≤ extremalGap n := by
  sorry

end

end Erdos959
