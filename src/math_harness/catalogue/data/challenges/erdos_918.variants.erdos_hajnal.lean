import Mathlib

universe u

open scoped Cardinal Ordinal

namespace Erdos918

-- Formalisation note: source material [ErHa68b] uses only induced subgraphs

-- Formalisation note: `ω` here is `Ordinal.omega0`, from `open scoped Ordinal`, as in 623.lean.

-- It is the fixed first infinite ordinal, not a variable: `variants.erdos_hajnal` settles every

-- finite `k` under GCH, and `ℵ_ω` is the limit of that family, so this asks the single next case.

-- Formalisation note: for the `≤ ℵ₀` direction this is the same question as `parts.i`, not a

-- separate one. Every subgraph on `W` is contained in the induced subgraph on `W`, so its

-- chromatic cardinal is no larger; and the top subgraph induced on `W` has `coe` equal to

-- `G.induce W`. So the two quantifications are equivalent and the answers cannot differ. The

-- `= ℵ₀` pair below is genuinely different, because an edgeless subgraph has chromatic

-- cardinal `1`, and that is the source's own reason for the impossibility there.

-- Formalisation note: the source is missing the assumption that the graph have ℵₖ vertices

-- which can be found in [ErHa68b, Corollary 1]. That corollary assumes the generalized continuum

-- hypothesis, stated here as `2 ^ c = Order.succ c` for every infinite cardinal `c`.

theorem erdos_918.variants.erdos_hajnal (hGCH : ∀ c : Cardinal.{u}, ℵ₀ ≤ c → 2 ^ c = Order.succ c) (k : ℕ) (hk : 0 < k) :
    ∃ (V : Type u) (G : SimpleGraph V), #V = ℵ_ k ∧ G.chromaticCardinal = ℵ₁ ∧ ∀ (W : Set V) (_ : #W < ℵ_ k), (G.induce W).chromaticCardinal ≤ ℵ₀ := by
  sorry

-- Formalisation note: the source states the impossibility for general subgraphs, in a

-- parenthetical, "assuming subgraph and not induced subgraph was intended". It does not

-- assert it for induced subgraphs, and the argument for the general case does not carry

-- over: an induced subgraph on `W` has chromatic cardinal at least that of any subgraph

-- on `W`, so the edgeless-subgraph argument is unavailable here.

-- Formalisation note: the source states the impossibility for general subgraphs, in a

-- parenthetical, "assuming subgraph and not induced subgraph was intended". It does not

-- assert it for induced subgraphs, and the argument for the general case does not carry

-- over: an induced subgraph on `W` has chromatic cardinal at least that of any subgraph

-- on `W`, so the edgeless-subgraph argument is unavailable here.

end Erdos918
