# Task 3: SQL for Data Analysis (Hospital Operations)

## Objective
To extract and analyze data from a PostgreSQL database backup to provide actionable insights for a hospital administrator.

## Tool Used
**PostgreSQL**

## Analysis & Insights
The file `task_3_hospital_queries.sql` contains 9 queries designed to answer real-world business questions about hospital performance.

The analysis is broken down into key operational areas:
1.  **Bed Capacity & Operations:** Calculated overall bed utilization and patient refusal rates.
2.  **Service-Level Performance:** Identified which services (e.g., Cardiology, ER) are under the most pressure by high refusal rates and low satisfaction.
3.  **Patient Journey:** Analyzed the average length of stay per service.
4.  **Staffing & Morale:** Investigated staff morale, staffing levels per role, and the impact of "events" (like outages) on patient satisfaction.
5.  **Advanced SQL:** Created a `VIEW` (`V_Weekly_Performance_Dashboard`) to consolidate key metrics for easy, repeatable analysis by managers.

Screenshots of key query outputs are included in the `/Screenshots` folder.
