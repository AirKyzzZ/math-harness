import Mathlib

namespace Erdos1059

def IsFactorial (d : ℕ) : Prop :=
  d ∈ Set.range Nat.factorial

def factorialsLessThanN (n : ℕ) : Set ℕ :=
  { d | d < n ∧ IsFactorial d }

def AllFactorialSubtractionsComposite (n : ℕ) : Prop :=
  ∀d ∈ factorialsLessThanN n, (n - d).Composite

theorem erdos_1059 :
    Set.Infinite {p | p.Prime ∧ AllFactorialSubtractionsComposite p} := by
  sorry

abbrev DecidableIsFactorial (d : ℕ) : Prop :=
  ((Finset.Icc 0 d).filter (λ k => Nat.factorial k = d)).Nonempty

def decidableFactorialsLessThanN (n : ℕ) : Finset ℕ :=
  (Finset.range n).filter DecidableIsFactorial

def DecidableAllFactorialSubtractionsComposite (n : ℕ) : Prop :=
  ∀ d ∈ decidableFactorialsLessThanN n, (n - d).Composite

lemma isFactorial_equivalent (d : ℕ) :
  IsFactorial d ↔ DecidableIsFactorial d := by
  unfold IsFactorial DecidableIsFactorial
  simp
  constructor
  · rintro ⟨k, hk⟩
    use k
    rw [Finset.mem_filter]
    constructor
    · have hk : k <= d := by
        rw [← hk]
        apply Nat.self_le_factorial
      rw [Finset.mem_Icc]
      exact ⟨Nat.zero_le k, hk⟩
    · exact hk
  · rintro ⟨k, hk⟩
    use k
    rw [Finset.mem_filter] at hk
    exact hk.2

lemma factorialsLessThanN_equivalent (n : ℕ) :
  factorialsLessThanN n = ↑(decidableFactorialsLessThanN n) := by
  ext d
  unfold factorialsLessThanN decidableFactorialsLessThanN
  simp
  exact λ _ => isFactorial_equivalent d

lemma allFactorialSubtractionsComposite_equivalent (d : ℕ) :
    DecidableAllFactorialSubtractionsComposite d ↔ AllFactorialSubtractionsComposite d := by
  unfold AllFactorialSubtractionsComposite DecidableAllFactorialSubtractionsComposite
  rw [factorialsLessThanN_equivalent d]
  simp

theorem allFactorialSubtractionsComposite_101 : AllFactorialSubtractionsComposite 101 := by
  have h : DecidableAllFactorialSubtractionsComposite 101 := by
    norm_num [DecidableAllFactorialSubtractionsComposite, decidableFactorialsLessThanN]
    decide +kernel
  exact (allFactorialSubtractionsComposite_equivalent 101).mp h

theorem allFactorialSubtractionsComposite_211 : AllFactorialSubtractionsComposite 211 := by
  have h : DecidableAllFactorialSubtractionsComposite 211 := by
    norm_num [DecidableAllFactorialSubtractionsComposite, decidableFactorialsLessThanN]
    decide +kernel
  exact (allFactorialSubtractionsComposite_equivalent 211).mp h

theorem notAllFactorialSubtractionsComposite_89 : ¬(AllFactorialSubtractionsComposite 89) := by
  have h : ¬(DecidableAllFactorialSubtractionsComposite 89) := by
    unfold DecidableAllFactorialSubtractionsComposite decidableFactorialsLessThanN
    intro h
    specialize h 6
    have : Nat.Prime (89 - 6) := by norm_num
    contradiction
  simp [allFactorialSubtractionsComposite_equivalent] at h
  exact h

theorem testFactorialsLessThanN : factorialsLessThanN 100 = {1, 2, 6, 24} := by
  have h : decidableFactorialsLessThanN 100 = {1, 2, 6, 24} := by
    norm_num [decidableFactorialsLessThanN]
    decide +kernel
  rw [factorialsLessThanN_equivalent]
  simp [h]

end Erdos1059
