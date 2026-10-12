<div align="center">

<img width="738" height="506" alt="image" src="https://github.com/user-attachments/assets/ed1c76d2-e159-4029-b717-adff78f7e47a" />
<img width="381" height="362" alt="image" src="https://github.com/user-attachments/assets/9c916649-202c-436c-974c-d8ed07409f87" />


# Investor Awareness Pulse

</div>

### Financial Education Analytics Portfolio Project

An end-to-end analytics project exploring awareness, attendance, and outreach preferences for a **generic investor-awareness workshop**. The project demonstrates a complete workflow—from synthetic raw-data generation and column-level cleaning to BI reporting and graph analysis in Neo4j.

> **Data notice:** All respondent records and results in this repository are synthetic and intended for portfolio demonstration only. They are not real survey findings, financial advice, or estimates of public awareness.

**Suggested GitHub repository:** `investor-awareness-pulse`

###  Data Sources → Extraction → Cleaning → Storage → Visualization → Graph DB  → Graph Query 

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/pandas-%23150458.svg?style=for-the-badge&logo=pandas&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![DAX](https://img.shields.io/badge/DAX-KPI%20Measures-5E5E5E?style=for-the-badge)
![Data Modeling](https://img.shields.io/badge/Data%20Modeling-Relationships-2F855A?style=for-the-badge)
![Looker Studio](https://img.shields.io/badge/Looker%20Studio-4285F4?style=for-the-badge)
![Neo4j](https://img.shields.io/badge/Neo4j-Graph%20DB-008CC1?style=for-the-badge)
![Cypher](https://img.shields.io/badge/Cypher-Query%20Language-2F855A?style=for-the-badge)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)


---

## Table of Contents

1. [Overview](#overview)
2. [Business Problem](#business-problem)
3. [Why This Project Is Needed](#why-this-project-is-needed)
4. [Business Requirements and Success Criteria](#business-requirements-and-success-criteria)
5. [Where This Project Can Be Used](#where-this-project-can-be-used)
6. [Project Objectives](#project-objectives)
7. [Project Workflow](#project-workflow)
8. [Data and Schema](#data-and-schema)
9. [Illustrative Findings](#illustrative-findings)
10. [Power BI Measures](#power-bi-measures)
11. [Dashboards](#dashboards)
12. [Neo4j Graph Model](#neo4j-graph-model)
13. [Repository Structure](#repository-structure)
14. [Run the Project](#run-the-project)
15. [How to Run / Setup](#how-to-run--setup)
16. [Data Quality and Limitations](#data-quality-and-limitations)
17. [Skills Demonstrated](#skills-demonstrated)
18. [Future Enhancements](#future-enhancements)
19. [Author](#author)
20. [License](#license)


---

## Overview

| Item | Details |
|---|---|
| **Project type** | End-to-end data analytics portfolio project |
| **Domain** | Financial education and investor awareness |
| **Event focus** | Generic Investor Awareness Workshop |
| **Dataset** | 2,500 synthetic survey records; 12 fields |
| **Tools** | Python, pandas, Jupyter Notebook, Power BI, Tableau, Looker Studio, Neo4j, Cypher, Git/GitHub |
| **Repository** | `investor-awareness-pulse` |



| Platform | Link |
|---|---|
| Power BI | See `/Dashboard` folder (`.pbix` file) |
| Tableau Public | [Investor Awareness Pulse](https://public.tableau.com/app/profile/ajit.jha/viz/InvestorAwarenessPulse/Dashboard1)|
| Looker Studio | [Live Report](https://datastudio.google.com/s/uFtwNxQokJA)|
| GitHub Repo | [investor-awareness-pulse](https://github.com/Ajitjha3095/investor-awareness-pulse) |

## Business Problem

Workshop organizers need to understand whether an awareness campaign is reaching its intended audience—and whether awareness is translating into attendance. This project models the questions an analyst could investigate:

- Which area or education groups have lower event awareness?
- Which information sources and communication channels are reported by respondents?
- Where does the gap between awareness and attendance appear largest?
- Which records should be reviewed before reporting conversion metrics?

The analysis is designed to support **targeted outreach hypotheses**, not to make claims about real populations.

## Why This Project Is Needed

Awareness campaigns are not successful simply because people have seen a message. Program teams also need to understand who knows about an event, who attends, and whether the current outreach approach is reaching different audience groups. Without consistent data definitions, reports can also misread dates, combine unlike categories, or hide contradictory answers.

This project demonstrates a repeatable way to move from raw survey responses to decision-support views: clean the data, define comparable KPIs, compare audience segments, and flag records that need review. In a real deployment, the synthetic dataset would be replaced with consented survey and attendance data.

## Business Requirements and Success Criteria

The prototype is designed to meet these requirements:

- **Measure reach:** calculate the number and share of respondents aware of the workshop.
- **Measure participation:** calculate attendance and attendance among respondents who report awareness.
- **Locate gaps:** compare awareness and attendance across area type, education, and information-source groups.
- **Guide outreach planning:** summarize preferred communication channels, including within lower-awareness segments.
- **Protect reporting quality:** preserve unresolved dates as missing and flag conflicting awareness/attendance answers rather than silently changing them.
- **Support multiple analysis tools:** provide a cleaned CSV for BI reporting and a graph model for relationship-based analysis in Neo4j.

Success means that the same documented definitions can be reused across the notebook, BI reports, and Cypher queries, with synthetic-data limitations clearly disclosed.

## Where This Project Can Be Used

The **workflow and model** can be adapted by:

- Non-profits and community organizations running financial-literacy workshops.
- Schools, colleges, and adult-learning programs evaluating event reach.
- Community-outreach or corporate social responsibility teams planning educational events.
- Analysts who need a repeatable template for survey cleaning, segment reporting, and graph exploration.

For operational use, teams would need to collect real data with appropriate consent and add fields such as invitation exposure, registration, event date/location, and verified attendance. The current synthetic dataset is a demonstration and should not be used to make real targeting or policy decisions.

## Project Objectives

- Create a realistic, intentionally unclean dataset for data-quality practice.
- Clean and standardize survey fields in Jupyter Notebook while preserving the raw source.
- Produce an analysis-ready CSV for BI tools.
- Build a single-page dashboard in Power BI, Tableau, and Looker Studio.
- Model respondents, event responses, and demographic dimensions as a Neo4j graph.
- Document assumptions, limitations, and reproducible steps.

## Project Workflow

1. **Create raw data** — generate 2,500 fictional records with varied formats, missing/ambiguous entries, and free-text comments.
2. **Clean data** — standardize categories and area labels, parse dates using a documented day-first convention, and retain unresolved dates as blank rather than inventing dates.
3. **Save CSV** — maintain separate raw and cleaned files.
4. **Build BI reports** — compare awareness, attendance, areas, education groups, information sources, and preferred channels.
5. **Load into Neo4j** — create a graph model and run Cypher analyses for segment comparisons and response-quality checks.
6. **Document and publish** — prepare the project for GitHub and portfolio sharing.

## Data and Schema

The cleaned dataset, `investor_awareness_pulse_cleaned.csv`, contains 2,500 rows and these fields:

| Field | Description |
|---|---|
| `respondent_id` | Synthetic unique respondent identifier |
| `survey_date` | Parsed survey date; unresolvable dates remain blank |
| `age` | Respondent age in years |
| `gender` | Standardized gender category |
| `education` | Standardized education category |
| `state` | Standardized state or reporting category |
| `area_type` | Metro, Urban, Rural, or Not reported |
| `investment_info_source` | Grouped source of investment information |
| `aware_of_event` | Awareness response: Yes/No |
| `attended_event` | Attendance response: Yes/No |
| `preferred_channel` | Preferred event-information channel |
| `respondent_comment` | Short synthetic free-text response |

The raw source is `investor_awareness_pulse_raw_2500.csv`.

## Illustrative Findings

These values describe **only this synthetic sample**:

| Metric | Sample result |
|---|---:|
| Respondents | 2,500 |
| Workshop awareness rate | 54.08% |
| Attendance rate | 10.52% |
| Attended among aware respondents | 17.38% |
| Missing/unresolved survey dates | 34 |
| Awareness/attendance conflicts to review | 28 |

In this sample, awareness is lower for Rural respondents (48.9%) than for Metro respondents (59.9%). This can be used as a demonstration of segmentation analysis, not as a real-world conclusion.

## Power BI Measures

```DAX
Respondents =
DISTINCTCOUNT('investor_awareness_pulse_cleaned'[respondent_id])

Aware Respondents =
CALCULATE([Respondents], 'investor_awareness_pulse_cleaned'[aware_of_event] = "Yes")

Awareness Rate =
DIVIDE([Aware Respondents], [Respondents], 0)

Attendees =
CALCULATE([Respondents], 'investor_awareness_pulse_cleaned'[attended_event] = "Yes")

Attendance Rate =
DIVIDE([Attendees], [Respondents], 0)

Aware Attendees =
CALCULATE(
    [Respondents],
    'investor_awareness_pulse_cleaned'[aware_of_event] = "Yes",
    'investor_awareness_pulse_cleaned'[attended_event] = "Yes"
)

Attendance Conversion =
DIVIDE([Aware Attendees], [Aware Respondents], 0)
```

Format the three rate measures as percentages with one decimal place. Review the 28 conflicting responses before interpreting attendance conversion.

## Dashboards

The project uses a single-page dashboard approach with KPI cards, area and education comparisons, source/channel charts, and attendance status.

- **Tableau Public:** [Investor Awareness Pulse](https://public.tableau.com/app/profile/ajit.jha/viz/InvestorAwarenessPulse/Dashboard1?publish=yes)
- **Power BI:** [See `investor-awareness-pulse/Dashboard` folder (`.pbix` file)]
- **Looker Studio:** [Investor Awareness Pulse](https://datastudio.google.com/s/uFtwNxQokJA).


## Neo4j Graph Model

The graph connects each respondent to reusable demographic and outreach dimensions, plus their responses to the workshop:

```text
(Respondent)-[:REPORTED_STATE]->(State)
(Respondent)-[:IN_AREA]->(AreaType)
(Respondent)-[:HAS_EDUCATION]->(Education)
(Respondent)-[:GETS_INFO_FROM]->(InfoSource)
(Respondent)-[:PREFERS_CHANNEL]->(Channel)
(Respondent)-[:AWARENESS_RESPONSE {value: "Yes/No"}]->(Workshop)
(Respondent)-[:ATTENDANCE_RESPONSE {value: "Yes/No"}]->(Workshop)
```

Cypher constraints, CSV import, analysis queries, and Desktop instructions are in [`neo4j_step5/`](neo4j_step5/README.md). Copy the cleaned CSV into the Neo4j Desktop database’s `import` folder before running the `LOAD CSV` query.

## Repository Structure

```text
Investor Awareness Pulse/
│
├── data/
│   ├── Unclean data/
│   └──investor_awareness_pulse_raw_2500.csv
│   ├── investor_awareness_pulse_cleaned.csv
│   
├── Jupyter Notebook/
│   └── clean_investor_awareness.ipynb
│   
├── Dashboard/
│   └── Investor Awareness Pulse.pbix
│   └── Investor Awareness Pulse.twbx
│
├── neo4j/
│   ├── queries/
│   └── graph_screenshot.png
│   └── neo4j_graph.png
│
├── screenshot/
│   ├── powerbi_dashboard.jpg
│   ├── tableau_dashboard.jpg
│   ├── looker_dashboard.jpg
│   
│
└── README.md
│
└── License
```

---

## Run the Project

### Generate the raw dataset

```bash
python generate_investor_awareness_pulse_data.py
```

### Run the cleaning notebook

1. Install the required packages if needed: `pip install pandas jupyter`.
2. Open `02_clean_investor_awareness.ipynb` in Jupyter.
3. Update the `file_path` and `output_path` cells to match your local repository location.
4. Run the notebook cells and save the resulting CSV separately from the raw source.

### Build the BI reports

Import `investor_awareness_pulse_cleaned` into Power BI, Tableau, or Looker Studio. Set `survey_date` to a Date type, `age` to a Whole Number, and ID/category fields to Text. See the Power BI build guide for measures and layout.

### Load the graph in Neo4j Desktop

Follow `neo4j_step5/README.md`. The scripts are written for the generic workshop graph model in this repository.

## Data Quality and Limitations

- All records are fictional; no real respondents or official statistics are represented.
- 34 survey dates could not be resolved reliably and remain blank; they are not filled with the most common date.
- 28 records report `aware_of_event = No` while also reporting `attended_event = Yes`; these are retained for review rather than silently changed.
- `respondent_comment` is generated example text and should not be treated as qualitative research evidence.
- The dataset is useful for practising data cleaning, dashboards, and graph queries, but not for investment decisions or public-policy conclusions.


##  How to Run / Setup

You can set up and run this project locally on your system using any of the options below:

###  Option 1: Direct Download (Easiest)
If you do not have Git installed, you can download the project as a ZIP file:
1. Scroll to the top of this GitHub repository page and click the green **Code** button.
2. Select **Download ZIP** from the dropdown menu.
3. Once downloaded, extract (unzip) the file to a folder on your computer.

---

###  Option 2: Clone the Repository (Recommended)
If you have Git installed, open your Terminal or Command Prompt (CMD) and run the following commands:

```bash
# 1. Clone the repository
git clone https://github.com

# 2. Navigate into the project directory
cd investor-awareness-pulse
```

---
## Skills Demonstrated

- Synthetic survey-data generation and data-quality design
- Python and pandas data profiling and cleaning
- Data type handling, category standardization, and date validation
- KPI definition and dashboard storytelling
- BI reporting in Power BI, Tableau, and Looker Studio
- Neo4j graph modeling, constraints, CSV loading, and Cypher analysis
- Documentation, reproducibility, and responsible communication of limitations

## Future Enhancements

- Replace synthetic records with ethically collected, consented survey data.
- Add a registration or invitation field to distinguish awareness from intent and attendance.
- Validate area, channel, and event-response definitions with survey documentation.
- Add a feedback loop to measure whether targeted outreach improves attendance.
- Publish the Power BI and Looker Studio share links alongside the Tableau report.

#  Author

**Ajit Jha**

Analytics Professional | Research & Business Intelligence

### Core Areas

`Data Analytics` • `Business Intelligence` • `Python` • `SQL` • `Power BI` • `Tableau` • `Looker Studio` • `Neo4j` • `Graph Analytics`

---

**If you find this project useful, feel free to explore the dashboards, data model, and Neo4j graph implementation.**
- **GitHub:** [Ajitjha3095](https://github.com/Ajitjha3095)
- **LinkedIn:** [Ajit Jha](https://www.linkedin.com/in/ajitjha01/)

## License

This project is licensed under the **MIT License**.  
See the [LICENSE](LICENSE) file for details.

