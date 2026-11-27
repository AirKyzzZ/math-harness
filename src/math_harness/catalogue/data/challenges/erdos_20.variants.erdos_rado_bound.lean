import Mathlib

namespace Erdos20

noncomputable def f (n k : ℕ) : ℕ :=
  sInf {m | ∀ {α : Type}, ∀ (F : Set (Set α)),
    ((∀ f ∈ F, f.ncard = n) ∧ m ≤ F.ncard) → ∃ S ⊆ F, S.ncard = k ∧ IsSunflower S}

theorem f_0_1 : f 0 1 = 1 := by
  refine IsLeast.csInf_eq ⟨fun F hF ↦ ?_, fun n hn ↦ n.pos_of_ne_zero fun hn₀ ↦ ?_⟩
  · obtain ⟨A, hA⟩ := F.nonempty_of_ncard_ne_zero (by omega)
    exact ⟨{A}, by simpa using ⟨hA, isSunflower_singleton _⟩⟩
  · obtain ⟨S, hS⟩ := (hn (α := ℕ) {} (by simpa))
    simp_all [bot_unique hS.1]

-- TODO(firsching): add the various known bounds as variants.

theorem erdos_20.variants.erdos_rado_bound :
    ∀ n k, n > 0 → 2 ≤ k → f n k ≤ (k - 1) ^ n * n.factorial + 1 := by
  sorry

end Erdos20
