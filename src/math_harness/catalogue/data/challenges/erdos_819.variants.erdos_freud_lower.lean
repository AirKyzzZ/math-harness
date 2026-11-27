import Mathlib

open Filter Asymptotics

open scoped Finset Pointwise

namespace Erdos819

def f (N : ℕ) : ℕ :=
  (Finset.powersetCard (Nat.sqrt N) (Finset.Icc 1 N)).sup
    fun A ↦ #((A + A) ∩ Finset.Icc 1 N)

theorem f_le (N : ℕ) : f N ≤ N := by
  refine Finset.sup_le fun A _ ↦ ?_
  calc #((A + A) ∩ Finset.Icc 1 N) ≤ #(Finset.Icc 1 N) :=
        Finset.card_le_card Finset.inter_subset_right
    _ = N := by simp

theorem card_add_self_le (A : Finset ℕ) : #(A + A) ≤ (#A + 1).choose 2 := by
  rw [← Finset.card_sym2]
  calc #(A + A) ≤ #(A.sym2.image (Sym2.lift ⟨fun a b ↦ a + b, fun a b ↦ add_comm a b⟩)) := by
        refine Finset.card_le_card fun x hx ↦ ?_
        obtain ⟨a, ha, b, hb, rfl⟩ := Finset.mem_add.1 hx
        exact Finset.mem_image.2 ⟨s(a, b), Finset.mk_mem_sym2_iff.2 ⟨ha, hb⟩, rfl⟩
    _ ≤ #A.sym2 := Finset.card_image_le

theorem f_le_half_add_sqrt (N : ℕ) : (f N : ℝ) ≤ (N + Real.sqrt N) / 2 := by
  have hf : f N ≤ (Nat.sqrt N + 1).choose 2 := by
    refine Finset.sup_le fun A hA ↦ ?_
    rw [← (Finset.mem_powersetCard.1 hA).2]
    exact (Finset.card_le_card Finset.inter_subset_left).trans (card_add_self_le A)
  have hsq : ((Nat.sqrt N : ℕ) : ℝ) ^ 2 ≤ N := by exact_mod_cast Nat.sqrt_le' N
  have hle : ((Nat.sqrt N : ℕ) : ℝ) ≤ Real.sqrt N := Real.nat_sqrt_le_real_sqrt
  calc (f N : ℝ) ≤ ((Nat.sqrt N + 1).choose 2 : ℕ) := by exact_mod_cast hf
    _ = ((Nat.sqrt N : ℝ) ^ 2 + Nat.sqrt N) / 2 := by
        rw [Nat.cast_choose_two]; push_cast; ring
    _ ≤ (N + Real.sqrt N) / 2 := by linarith

theorem erdos_819.variants.erdos_freud_lower :
    ∀ ε > (0 : ℝ), ∀ᶠ N : ℕ in atTop, (3 / 8 - ε) * N ≤ (f N : ℝ) := by
  sorry

theorem erdos_819.variants.erdos_freud_upper :
    ∀ ε > (0 : ℝ), ∀ᶠ N : ℕ in atTop, (f N : ℝ) ≤ (1 / 2 + ε) * N := by
  intro ε hε
  filter_upwards [eventually_ge_atTop ⌈1 / (4 * ε ^ 2)⌉₊] with N hN
  have hN' : 1 / (4 * ε ^ 2) ≤ (N : ℝ) := (Nat.le_ceil _).trans (by exact_mod_cast hN)
  have h1 : 1 ≤ 4 * ε ^ 2 * N := by
    rw [div_le_iff₀ (by positivity)] at hN'
    linarith
  -- $\sqrt{N} \leq 2\varepsilon N$, since $N \leq (2\varepsilon N)^2$ once $4\varepsilon^2 N \geq 1$.
  have hs : Real.sqrt N ≤ 2 * ε * N := by
    rw [Real.sqrt_le_left (by positivity)]
    nlinarith [(Nat.cast_nonneg N : (0 : ℝ) ≤ N)]
  linarith [f_le_half_add_sqrt N]

end Erdos819
