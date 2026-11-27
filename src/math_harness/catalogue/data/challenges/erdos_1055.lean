import Mathlib

namespace Erdos1055

def IsOfClass : ℕ+ → ℕ → Prop := fun r ↦
  PNat.caseStrongInductionOn (p := fun (_ : ℕ+) ↦ ℕ → Prop) r
    (fun p ↦ (p + 1).primeFactors ⊆ {2, 3})
    (fun n H p ↦
      (∀ (m : ℕ+) (hm : m ≤ n), ¬ H m hm p) ∧
      (∀ r ∈ (p + 1).primeFactors,
        ∃ (m : ℕ+) (hm : m ≤ n), H m hm r) ∧
      (∃ r ∈ (p + 1).primeFactors,
        ∀ (m : ℕ+) (hm : m ≤ n), H m hm r → m = n))

noncomputable def p (r : ℕ+) : ℕ :=
  open scoped Classical in
  Nat.find (exists_p r)

theorem erdos_1055 (r) :
    {p | p.Prime ∧ IsOfClass r p}.Infinite := by
  sorry

-- TODO(Paul-Lez): formalize the rest of the problems on the page.

end Erdos1055
