from math_harness.catalogue.extract import Statement
from math_harness.catalogue.signals import score, signals


def stmt(statement="∀ n : ℕ, n ≤ n + 1", category="research open", question=False):
    return Statement("erdos_1.x", "1", category, question, statement, "", None)


def record(status="open", posts=0, prize="no", tags=("number theory",)):
    return {"informal_status": {"state": status}, "forum": {"posts": posts}, "prize": prize, "tags": list(tags)}


def test_fc_open_but_ep_proved_is_the_formalize_track():
    assert signals(stmt(), record(status="proved"))["track"] == "formalize"
    assert signals(stmt(), record(status="disproved"))["track"] == "formalize"


def test_genuinely_open_is_the_open_track():
    sig = signals(stmt(), record(status="falsifiable", posts=3))
    assert sig["track"] == "open" and sig["falsifiable"] and sig["forum_posts"] == 3


def test_missing_record_gives_null_signals_without_crashing():
    sig = signals(stmt(), None)
    assert sig["ep_status"] is None and sig["forum_posts"] is None and sig["track"] == "open"
    assert isinstance(score(sig), float)


def test_short_discrete_quiet_statement_outranks_long_analytic_busy_one():
    easy = signals(stmt("∀ n : ℕ, n ≤ n + 1"), record(posts=0))
    hard = signals(stmt("Tendsto (fun x : ℝ => " + "x * " * 40 + "x) atTop atTop"), record(posts=40))
    assert easy["analytic"] is False and hard["analytic"] is True
    assert score(easy) > score(hard)


def test_statement_with_a_linked_formal_proof_is_not_an_opportunity():
    s = Statement("erdos_1.x", "1", "research solved", False, "1 = 1", "", None, formal_proof=True)
    sig = signals(s, record(status="proved"))
    assert sig["track"] == "formalized" and sig["formal_proof"]


def test_fc_solved_variant_without_formal_proof_is_its_own_track():
    sig = signals(stmt(category="research solved"), record(status="open"))
    assert sig["track"] == "solved" and not sig["status_disagreement"]


def test_status_disagreement_is_exposed():
    assert signals(stmt(), record(status="proved"))["status_disagreement"] is True
