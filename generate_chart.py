import matplotlib.pyplot as plt
import pandas as pd
import datetime

dates = pd.date_range(end=datetime.datetime.today(), periods=7).to_pydatetime()
values = [100, 105, 102, 108, 110, 107, 112]

plt.figure(figsize=(10, 5))
plt.plot(dates, values, marker='o', linestyle='-', color='blue')
plt.title("Sample Portfolio Value (Last 7 Days)")
plt.xlabel("Date")
plt.ylabel("Value")
plt.grid(True)
plt.tight_layout()

output_path = "/mnt/data/portfolio_chart.png"
plt.savefig(output_path)
print(f"Chart saved to: {output_path}")
