import re

from math_harness.catalogue.extract import Statement

KNOWN_RESULT = {"proved", "disproved", "solved"}
CHECKABLE = {"falsifiable", "decidable", "verifiable"}
ANALYTIC = re.compile(r"ℝ|ℂ|\bReal\b|atTop|Tendsto|Filter|∫|MeasureTheory|deriv|limsup|liminf|=O\[|=o\[|~\[")
WEIGHTS = {
    "formalize": 3.0,
    "checkable": 1.5,
    "discrete": 2.0,
    "quiet": 2.0,
    "short": 1.5,
    "prize": -1.0,
    "formalized": -10.0,
}


def signals(stmt: Statement, record: dict | None) -> dict:
    record = record or {}
    ep_status = (record.get("informal_status") or {}).get("state")
    forum = record.get("forum")
    if stmt.formal_proof:
        track = "formalized"
    elif stmt.category == "research solved" or ep_status in KNOWN_RESULT:
        track = "formalize"
    else:
        track = "open"
    return {
        "fc_category": stmt.category,
        "ep_status": ep_status,
        "forum_posts": (forum or {}).get("posts", 0) if record else None,
        "prize": record.get("prize"),
        "tags": record.get("tags", []),
        "length": len(stmt.statement),
        "analytic": bool(ANALYTIC.search(stmt.statement)),
        "falsifiable": ep_status in CHECKABLE,
        "question": stmt.question,
        "formal_proof": stmt.formal_proof,
        "track": track,
    }


def score(sig: dict) -> float:
    posts = sig["forum_posts"] or 0
    terms = {
        "formalize": WEIGHTS["formalize"] if sig["track"] == "formalize" else 0.0,
        "checkable": WEIGHTS["checkable"] if sig["falsifiable"] else 0.0,
        "discrete": 0.0 if sig["analytic"] else WEIGHTS["discrete"],
        "quiet": WEIGHTS["quiet"] / (1 + posts / 5),
        "short": WEIGHTS["short"] / (1 + sig["length"] / 150),
        "prize": WEIGHTS["prize"] if sig["prize"] not in (None, "no") else 0.0,
        "formalized": WEIGHTS["formalized"] if sig["track"] == "formalized" else 0.0,
    }
    return round(sum(terms.values()), 3)
