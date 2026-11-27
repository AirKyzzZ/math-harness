import Mathlib

open Filter

namespace Erdos1212

def Valid (p : ℕ × ℕ) : Prop :=
  1 < p.1 ∧ 1 < p.2 ∧ Nat.gcd p.1 p.2 = 1 ∧ (¬ p.1.Prime ∨ ¬ p.2.Prime)

theorem valid_four_three : Valid (4, 3) := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;> decide

def Adj (p q : ℕ × ℕ) : Prop :=
  (p.1 = q.1 ∧ (p.2 = q.2 + 1 ∨ q.2 = p.2 + 1)) ∨
  (p.2 = q.2 ∧ (p.1 = q.1 + 1 ∨ q.1 = p.1 + 1))

theorem erdos_1212 :
    ∃ f : ℕ → ℕ × ℕ, Function.Injective f ∧ (∀ n, Adj (f n) (f (n + 1))) ∧ (∀ n, Valid (f n)) ∧ Tendsto (fun n => (f n).1 + (f n).2) atTop atTop := by
  sorry

theorem vertical_leg_valid {a b c : ℕ} (ha : a.Composite) (hb : 2 ≤ b)
    (hV : ∀ s, b ≤ s → s ≤ c → Nat.gcd a s = 1) :
    ∀ s, b ≤ s → s ≤ c → Valid (a, s) := by
  intro s hs1 hs2
  have ha2 := ha.1
  exact ⟨by omega, by omega, hV s hs1 hs2, Or.inl ha.2⟩

theorem horizontal_leg_valid {a b c : ℕ} (hc : c.Composite) (ha2 : 2 ≤ a)
    (hH : ∀ s, a ≤ s → s ≤ b → Nat.gcd s c = 1) :
    ∀ s, a ≤ s → s ≤ b → Valid (s, c) := by
  intro s hs1 hs2
  have hc2 := hc.1
  exact ⟨by omega, by omega, hH s hs1 hs2, Or.inr hc.2⟩

theorem anchor_coprime_of_short_leg {a s : ℕ} (hs : a < s)
    (h : ∀ p, p.Prime → p ∣ a → s < a + p) : Nat.gcd a s = 1 := by
  by_contra hg
  obtain ⟨p, hp, hpd⟩ := Nat.exists_prime_and_dvd (n := Nat.gcd a s) (by
    intro h1
    exact hg h1)
  have hpa : p ∣ a := hpd.trans (Nat.gcd_dvd_left a s)
  have hps : p ∣ s := hpd.trans (Nat.gcd_dvd_right a s)
  have hlt : s < a + p := h p hp hpa
  -- s is a multiple of p strictly between a (a multiple of p) and a + p: impossible
  obtain ⟨k, hk⟩ := hpa
  obtain ⟨l, hl⟩ := hps
  have hp0 : 0 < p := hp.pos
  have hkl : k < l := by
    have : p * k < p * l := by omega
    exact Nat.lt_of_mul_lt_mul_left this
  have : p * (k + 1) ≤ p * l := Nat.mul_le_mul_left p hkl
  have : a + p ≤ s := by
    have hpk : p * (k + 1) = a + p := by rw [hk]; ring
    omega
  omega

theorem right_neighbor_witness_free {P : Finset ℕ} {x y : ℕ} (hP : ∀ p ∈ P, p.Prime)
    (hx : ∀ p ∈ P, p ∣ x) (hy : ∀ p ∈ P, ¬ p ∣ y) :
    ∀ p ∈ P, ¬ p ∣ (x + 1) ∧ ¬ p ∣ y := by
  intro p hp
  refine ⟨fun hdvd => ?_, hy p hp⟩
  have h1 : p ∣ 1 := by
    have h := Nat.dvd_sub hdvd (hx p hp)
    simpa using h
  have := (hP p hp).one_lt
  have := Nat.dvd_one.mp h1
  omega

theorem left_neighbor_witness_free {P : Finset ℕ} {x y : ℕ} (hP : ∀ p ∈ P, p.Prime)
    (hx1 : 1 ≤ x) (hx : ∀ p ∈ P, p ∣ x) (hy : ∀ p ∈ P, ¬ p ∣ y) :
    ∀ p ∈ P, ¬ p ∣ (x - 1) ∧ ¬ p ∣ y := by
  intro p hp
  refine ⟨fun hdvd => ?_, hy p hp⟩
  have h1 : p ∣ 1 := by
    have h := Nat.dvd_sub (hx p hp) hdvd
    have hx_sub : x - (x - 1) = 1 := by omega
    rwa [hx_sub] at h
  have := (hP p hp).one_lt
  have := Nat.dvd_one.mp h1
  omega

theorem vertical_neighbor_both_even {x y : ℕ} (h2x : 2 ∣ x) (h2y : ¬ 2 ∣ y) :
    (2 ∣ x ∧ 2 ∣ (y + 1)) ∧ (1 ≤ y → 2 ∣ x ∧ 2 ∣ (y - 1)) := by
  refine ⟨⟨h2x, by omega⟩, fun hy1 => ⟨h2x, by omega⟩⟩

end Erdos1212
