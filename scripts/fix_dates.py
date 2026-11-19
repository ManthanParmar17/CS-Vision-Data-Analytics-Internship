from pathlib import Path

import pandas as pd

week_dir = Path(__file__).resolve().parents[1]
data_dir = week_dir / "data" / "cleaned"
input_file = data_dir / "financial_retail_clean.csv"
output_file = data_dir / "financial_retail_fixed.csv"

df = pd.read_csv(input_file)

df["Date"] = pd.to_datetime(df["Date"], errors="raise").dt.strftime("%Y-%m-%d")

df.to_csv(output_file, index=False)

print("Date conversion completed!")
print("Total rows:", len(df))
print(df[["Date"]].head())
print("Saved file:", output_file)