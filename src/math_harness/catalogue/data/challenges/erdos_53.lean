import Mathlib

namespace Erdos53

def sumsAndProducts (A : Finset ℤ) : Finset ℤ :=
  (A.powerset.erase ∅).image (fun B => ∑ b ∈ B, b) ∪
    (A.powerset.erase ∅).image (fun B => ∏ b ∈ B, b)

theorem erdos_53 :
    ∀ k : ℕ, ∃ N : ℕ, ∀ A : Finset ℤ, N ≤ A.card → A.card ^ k ≤ (sumsAndProducts A).card := by
  sorry

end Erdos53
