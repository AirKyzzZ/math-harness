from math_harness.catalogue.extract import extract_statements

FIXTURE = """/-
Copyright 2025 The Formal Conjectures Authors.
-/
module

public import FormalConjecturesUtil

/-!
# Erdős Problem 9999
-/

@[expose] public section

open Filter

namespace Erdos9999

/-- The lcm of `1..n`. -/
def lcm_upto (n : ℕ) : ℕ :=
  (Finset.Icc 1 n).lcm id

@[category API, AMS 11]
lemma lcm_upto_zero : lcm_upto 0 = 1 := by
  simp [lcm_upto]

@[category research solved, AMS 11]
theorem erdos_9999.variants.known : lcm_upto 1 = 1 := by
  sorry

set_option linter.style.formal_proof_palomar false in
/-- Is it true for all k? -/
@[category research open, question, AMS 11]
theorem erdos_9999 :
    ∀ k : ℕ, lcm_upto k ≤ lcm_upto (k + 1) := by
  sorry

open scoped Classical in
/-- A graded variant. -/
@[category research open, AMS 5]
theorem erdos_9999.variants.graded (n : ℕ) (hn : 1 ≤ n) :
    lcm_upto n ≥ n := by
  sorry

def erdos_9999.answer : ℕ := sorry

@[category research open, question value, AMS 11]
theorem erdos_9999.variants.value : lcm_upto 3 = erdos_9999.answer := by
  sorry

end Erdos9999
"""


def by_id(stmts):
    return {s.id: s for s in stmts}


def test_open_and_solved_targets_are_extracted_value_questions_are_not():
    ids = set(by_id(extract_statements(FIXTURE, "9999")))
    assert ids == {"erdos_9999", "erdos_9999.variants.graded", "erdos_9999.variants.known"}


def test_challenge_strips_metadata_and_keeps_defs_and_opens():
    s = by_id(extract_statements(FIXTURE, "9999"))["erdos_9999"]
    c = s.challenge
    assert c.startswith("import Mathlib\n")
    for gone in ("module", "public import", "@[expose]", "@[category", "AMS", "set_option linter", "formal_proof"):
        assert gone not in c
    assert "def lcm_upto (n : ℕ) : ℕ :=" in c
    assert "lemma lcm_upto_zero : lcm_upto 0 = 1 := by\n  simp [lcm_upto]" in c
    assert "open Filter" in c and "namespace Erdos9999" in c and c.rstrip().endswith("end Erdos9999")
    assert "theorem erdos_9999 :\n    ∀ k : ℕ, lcm_upto k ≤ lcm_upto (k + 1) := by\n  sorry" in c


def test_other_sorry_theorems_are_dropped_but_defs_survive():
    c = by_id(extract_statements(FIXTURE, "9999"))["erdos_9999"].challenge
    assert "erdos_9999.variants.known" not in c
    assert "erdos_9999.variants.graded" not in c
    assert "erdos_9999.answer" not in c
    assert c.count("sorry") == 1


def test_open_scoped_in_before_target_is_kept():
    c = by_id(extract_statements(FIXTURE, "9999"))["erdos_9999.variants.graded"].challenge
    assert "open scoped Classical in\ntheorem erdos_9999.variants.graded (n : ℕ) (hn : 1 ≤ n) :" in c


def test_question_gets_a_negated_challenge_over_the_full_proposition():
    s = by_id(extract_statements(FIXTURE, "9999"))["erdos_9999"]
    assert s.question and s.category == "research open"
    assert "theorem erdos_9999_neg :\n    ¬ (∀ k : ℕ, lcm_upto k ≤ lcm_upto (k + 1)) := by\n  sorry" in s.challenge_neg


def test_binders_move_into_a_forall_for_the_negation():
    from math_harness.catalogue.extract import negate_signature

    assert negate_signature("(n : ℕ) (hn : 1 ≤ n)", "lcm_upto n ≥ n") == "¬ (∀ (n : ℕ) (hn : 1 ≤ n), lcm_upto n ≥ n)"
    assert negate_signature("", "P") == "¬ (P)"


def test_non_question_has_no_negation():
    s = by_id(extract_statements(FIXTURE, "9999"))["erdos_9999.variants.graded"]
    assert not s.question and s.challenge_neg is None


def test_name_glued_to_the_colon_is_parsed():
    src = "namespace E\n\n@[category research open, AMS 5]\ntheorem erdos_91.variants.six: 1 = 1 := by\n  sorry\n\nend E\n"
    (s,) = extract_statements(src, "91")
    assert s.id == "erdos_91.variants.six" and "theorem erdos_91.variants.six :\n    1 = 1 := by" in s.challenge
