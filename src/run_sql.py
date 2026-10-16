
from pathlib import Path
import sqlite3

import pandas as pd


PROJECT_DIR = Path(__file__).resolve().parent.parent
DATABASE_PATH = PROJECT_DIR / "data" / "customerDNA.db"
SQL_FILE = PROJECT_DIR / "sql" / "customer_analysis.sql"


def main():
    if not DATABASE_PATH.exists():
        raise FileNotFoundError(
            f"Database not found: {DATABASE_PATH}"
        )

    if not SQL_FILE.exists():
        raise FileNotFoundError(
            f"SQL file not found: {SQL_FILE}"
        )

    sql_text = SQL_FILE.read_text(encoding="utf-8")

    # Split the SQL file into individual statements.
    # Ignore comment-only sections and blank lines.
    statements = [
        statement.strip()
        for statement in sql_text.split(";")
        if statement.strip()
        and any(
            line.strip() and not line.strip().startswith("--")
            for line in statement.splitlines()
        )
    ]

    if not statements:
        raise ValueError("No SQL queries found in the file.")

    with sqlite3.connect(DATABASE_PATH) as connection:
        for number, statement in enumerate(statements, start=1):
            print(f"\n{'=' * 60}")
            print(f"QUERY {number}")
            print("=" * 60)

            results = pd.read_sql_query(statement, connection)
            print(results.to_string(index=False))


if __name__ == "__main__":
    main()
