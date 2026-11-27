import Mathlib

namespace Erdos425

open Filter

open scoped Topology

def PairProductDistinct (A : Finset ℕ) : Prop :=
  ∀ ⦃a b c d : ℕ⦄,
    a ∈ A → b ∈ A → c ∈ A → d ∈ A → a < b → c < d →
      a * b = c * d → a = c ∧ b = d

noncomputable def pairProductExtremal (n : ℕ) : ℕ := by
  classical
  exact Nat.findGreatest
    (fun m => ∃ A : Finset ℕ, A ⊆ Finset.Icc 1 n ∧ PairProductDistinct A ∧ A.card = m) n

def RProductsDistinct (r : ℕ) (A : Finset ℕ) : Prop :=
  ∀ ⦃S T : Finset ℕ⦄,
    S ⊆ A → T ⊆ A → S.card = r → T.card = r → S.prod id = T.prod id → S = T

theorem rProductsDistinct_two : RProductsDistinct 2 = PairProductDistinct := by
  funext A
  apply propext
  have sorted_pair (S : Finset ℕ) (hS : S.card = 2) :
      ∃ a b, a < b ∧ S = {a, b} := by
    obtain ⟨a, b, hab, rfl⟩ := Finset.card_eq_two.mp hS
    rcases lt_or_gt_of_ne hab with hab | hab
    · exact ⟨a, b, hab, rfl⟩
    · exact ⟨b, a, hab, Finset.pair_comm a b⟩
  constructor
  · intro h a b c d ha hb hc hd hab hcd hp
    have heq : ({a, b} : Finset ℕ) = {c, d} :=
      h (by simpa only [Finset.insert_subset_iff, Finset.singleton_subset_iff] using
          And.intro ha hb)
        (by simpa only [Finset.insert_subset_iff, Finset.singleton_subset_iff] using
          And.intro hc hd)
        (Finset.card_pair hab.ne) (Finset.card_pair hcd.ne)
        (by simpa [Finset.prod_pair hab.ne, Finset.prod_pair hcd.ne] using hp)
    have ha' : a ∈ ({c, d} : Finset ℕ) := heq ▸ (by simp)
    have hb' : b ∈ ({c, d} : Finset ℕ) := heq ▸ (by simp)
    simp only [Finset.mem_insert, Finset.mem_singleton] at ha' hb'
    omega
  · intro h S T hSA hTA hS hT hp
    obtain ⟨a, b, hab, rfl⟩ := sorted_pair S hS
    obtain ⟨c, d, hcd, rfl⟩ := sorted_pair T hT
    simp only [Finset.insert_subset_iff, Finset.singleton_subset_iff] at hSA hTA
    obtain ⟨rfl, rfl⟩ := h hSA.1 hSA.2 hTA.1 hTA.2 hab hcd
      (by simpa [Finset.prod_pair hab.ne, Finset.prod_pair hcd.ne] using hp)
    rfl

theorem erdos_425.parts.ii :
    ∀ r : ℕ, 1 ≤ r → ∃ C : ℝ, 0 < C ∧ ∀ᶠ n in atTop, ∀ A : Finset ℕ, A ⊆ Finset.Icc 1 n → RProductsDistinct r A → (A.card : ℝ) ≤ (Nat.primeCounting n : ℝ) + C * (n : ℝ) ^ (((r : ℝ) + 1) / (2 * r)) := by
  sorry

end Erdos425
