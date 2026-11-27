import Mathlib

namespace Erdos721

def HasColorAP (f : ℕ → Bool) (b : Bool) (n N : ℕ) : Prop :=
  ∃ a d : ℕ, 1 ≤ a ∧ 0 < d ∧
    ∀ i : ℕ, i < n → a + i * d ≤ N ∧ f (a + i * d) = b

def Forces (N k : ℕ) : Prop :=
  ∀ f : ℕ → Bool, HasColorAP f false 3 N ∨ HasColorAP f true k N

theorem hasColorAP_mono {f : ℕ → Bool} {b : Bool} {n N M : ℕ}
    (hNM : N ≤ M) (h : HasColorAP f b n N) : HasColorAP f b n M :=
  match h with
  | ⟨a, d, ha, hd, hp⟩ =>
    ⟨a, d, ha, hd, fun i hi =>
      ⟨Nat.le_trans (hp i hi).1 hNM, (hp i hi).2⟩⟩

theorem forces_mono {N M k : ℕ} (hNM : N ≤ M) (h : Forces N k) : Forces M k :=
  fun f => (h f).elim
    (fun hr => Or.inl (hasColorAP_mono hNM hr))
    (fun hb => Or.inr (hasColorAP_mono hNM hb))

def SubexponentialUpperBound : Prop :=
  ∃ c : ℝ, 0 < c ∧ c < 1 ∧
    ∃ K : ℕ, 3 ≤ K ∧ ∀ k : ℕ, K ≤ k →
      ∃ N : ℕ, Forces N k ∧ (N : ℝ) < Real.exp ((k : ℝ) ^ c)

def HunterLowerBound : Prop :=
  ∃ c : ℝ, 0 < c ∧
    ∃ K : ℕ, 3 ≤ K ∧ ∀ k : ℕ, K ≤ k →
      ∃ N : ℕ, ¬ Forces N k ∧
        Real.exp (c * (Real.log (k : ℝ)) ^ (2 : ℕ) /
          Real.log (Real.log (k : ℝ))) ≤ ((N + 1 : ℕ) : ℝ)

def BoundsTarget : Prop := HunterLowerBound ∧ SubexponentialUpperBound

theorem erdos_721.lower_bound :
    HunterLowerBound := by
  sorry

end Erdos721
