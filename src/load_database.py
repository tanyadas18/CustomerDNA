
from pathlib import Path
import sqlite3

import pandas as pd


# Locate the project directory automatically
PROJECT_DIR = Path(__file__).resolve().parent.parent

PROCESSED_DIR = PROJECT_DIR / "data" / "processed"
DATABASE_PATH = PROJECT_DIR / "data" / "customerDNA.db"

# Map CSV filenames to SQLite table names
CSV_FILES = {
    "customer_rfm_segments": "customer_rfm_segments.csv",
    "customer_segment_summary": "customer_segment_summary.csv",
    "monthly_sales_kpis": "monthly_sales_kpis.csv",
}


def main():
    DATABASE_PATH.parent.mkdir(parents=True, exist_ok=True)

    with sqlite3.connect(DATABASE_PATH) as connection:
        for table_name, filename in CSV_FILES.items():
            csv_path = PROCESSED_DIR / filename

            if not csv_path.exists():
                raise FileNotFoundError(
                    f"Could not find the required file: {csv_path}"
                )

            data = pd.read_csv(csv_path)

            # Load each CSV into its own SQLite table
            data.to_sql(
                table_name,
                connection,
                if_exists="replace",
                index=False,
            )

            print(
                f"Loaded {table_name}: "
                f"{len(data):,} rows, {len(data.columns)} columns"
            )

        # Verify that all tables were created
        cursor = connection.cursor()
        cursor.execute(
            "SELECT name FROM sqlite_master "
            "WHERE type = 'table' ORDER BY name"
        )

        print("\nTables available in CustomerDNA:")
        for (table_name,) in cursor.fetchall():
            print(f"- {table_name}")

    print(f"\nDatabase created at: {DATABASE_PATH}")


if __name__ == "__main__":
    main()
