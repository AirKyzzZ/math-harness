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
    assert "theorem erdos_9999_neg :\n    ¬ (\n    ∀ k : ℕ, lcm_upto k ≤ lcm_upto (k + 1)\n    ) := by\n  sorry" in s.challenge_neg


def test_binders_move_into_a_forall_for_the_negation():
    from math_harness.catalogue.extract import negate_signature

    assert negate_signature("(n : ℕ) (hn : 1 ≤ n)", " lcm_upto n ≥ n") == "¬ (∀ (n : ℕ) (hn : 1 ≤ n),\n lcm_upto n ≥ n\n    )"
    assert negate_signature("", "\n    P") == "¬ (\n    P\n    )"


def test_non_question_has_no_negation():
    s = by_id(extract_statements(FIXTURE, "9999"))["erdos_9999.variants.graded"]
    assert not s.question and s.challenge_neg is None


def test_name_glued_to_the_colon_is_parsed():
    src = "namespace E\n\n@[category research open, AMS 5]\ntheorem erdos_91.variants.six: 1 = 1 := by\n  sorry\n\nend E\n"
    (s,) = extract_statements(src, "91")
    assert s.id == "erdos_91.variants.six" and "theorem erdos_91.variants.six: 1 = 1 := by\n  sorry" in s.challenge


def test_formal_proof_attribute_is_recorded():
    src = '@[category research solved, AMS 11, formal_proof using lean4 at "https://x"]\ntheorem erdos_5.v : 1 = 1 := by\n  sorry\n'
    (s,) = extract_statements(src, "5")
    assert s.formal_proof


def one(src, problem="7"):
    (s,) = extract_statements(src, problem)
    return s


def test_statement_is_copied_verbatim_so_a_comment_cannot_swallow_the_type():
    src = "@[category research open, AMS 11]\ntheorem erdos_7 : ∃ n : ℕ, n.Prime -- n must also be large\n    ∧ 10 < n := by\n  sorry\n"
    s = one(src)
    assert "theorem erdos_7 : ∃ n : ℕ, n.Prime -- n must also be large\n    ∧ 10 < n := by\n  sorry" in s.challenge


def test_let_bodies_on_their_own_line_are_preserved():
    src = "@[category research open, AMS 11]\ntheorem erdos_7 :\n    let x := 3\n    x = 3 := by\n  sorry\n"
    assert "    let x := 3\n    x = 3 := by\n  sorry" in one(src).challenge


def test_negation_keeps_the_type_verbatim_on_its_own_lines():
    src = "@[category research open, question, AMS 11]\ntheorem erdos_7 (n : ℕ) : n ≤ n -- trailing\n    ∧ True := by\n  sorry\n"
    neg = one(src).challenge_neg
    assert "theorem erdos_7_neg :\n    ¬ (∀ (n : ℕ),\n n ≤ n -- trailing\n    ∧ True\n    ) := by\n  sorry" in neg


def test_sorry_after_a_comment_or_tactic_counts_as_sorry():
    src = (
        "namespace E\n\n@[category research open, AMS 5]\ntheorem erdos_7.a : 1 = 1 := by\n  simp; sorry\n\n"
        "@[category research solved, question, AMS 5]\ntheorem erdos_7.b : 2 = 2 := by\n  -- known\n  sorry\n\nend E\n"
    )
    stmts = {s.id: s for s in extract_statements(src, "7")}
    assert set(stmts) == {"erdos_7.a", "erdos_7.b"}
    assert "erdos_7.a" not in stmts["erdos_7.b"].challenge


def test_attribute_followed_by_code_on_the_same_line_keeps_the_code():
    src = '@[inherit_doc] local notation "Λ" => id\n\n@[category research open, AMS 5]\ntheorem erdos_7 : Λ 1 = 1 := by\n  sorry\n'
    c = one(src).challenge
    assert '@[inherit_doc]\nlocal notation "Λ" => id' in c or '@[inherit_doc] local notation "Λ" => id' in c


def test_code_right_after_a_closing_doc_comment_is_kept():
    src = "/-- doc -/@[category research open, AMS 5]\ntheorem erdos_7 : 1 = 1 := by\n  sorry\n"
    assert one(src).id == "erdos_7"


def test_statements_named_without_the_erdos_prefix_are_kept():
    src = "@[category research open, question, AMS 5]\ntheorem erdos_18a : 1 = 1 := by\n  sorry\n\n@[category research open, AMS 5]\ntheorem minimum_overlap.upper : 2 = 2 := by\n  sorry\n"
    assert {s.id for s in extract_statements(src, "18")} == {"erdos_18a", "minimum_overlap.upper"}


def test_quoted_strings_in_attributes_do_not_break_splitting():
    src = '@[formal_proof using lean4 at "https://x/a,b", category research open, AMS 5]\ntheorem erdos_7 : 1 = 1 := by\n  sorry\n'
    s = one(src)
    assert s.category == "research open" and s.formal_proof


def test_meta_import_is_dropped():
    src = "meta import Foo.Bar\n\n@[category research open, AMS 5]\ntheorem erdos_7 : 1 = 1 := by\n  sorry\n"
    assert "meta import" not in one(src).challenge
