import Mathlib

open Cardinal

open scoped Cardinal

namespace Erdos594

theorem erdos_594.variants.erdos_hajnal (V : Type) (G : SimpleGraph V) (h : ∀ (α : Type), #α ≤ ℵ_ 1 → IsEmpty (G.Coloring α)) :
    ∃ N : ℕ, ∀ k : ℕ, N ≤ k → ∃ (v : V) (w : G.Walk v v), w.IsCycle ∧ w.length = 2 * k + 1 := by
  sorry

theorem erdos_594.variants.bot_countably_colorable :
    ¬ IsEmpty ((⊥ : SimpleGraph ℕ).Coloring ℕ) := by
  rw [not_isEmpty_iff]
  exact ⟨SimpleGraph.Coloring.mk (fun _ => 0) (by simp)⟩

end Erdos594
