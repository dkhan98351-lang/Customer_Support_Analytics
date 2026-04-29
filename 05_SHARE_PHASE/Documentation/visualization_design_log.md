# SHARE PHASE: Visualization Design Log

**Objective:** This document details the specific UI/UX decisions, color psychology, and data storytelling techniques applied to the Tableau visualizations and the final executive slide deck. The goal was to reduce cognitive load for stakeholders and highlight actionable failures immediately.

## 1. SLA Breach Ratio (Donut Chart)
* **Design Choice:** A Donut Chart was selected over a standard Pie Chart to provide a cleaner, more modern enterprise look, allowing the center space to breathe.
* **Color Psychology:** I utilized a stark contrast palette. The `Met SLA` slice was colored a muted, recessive blue/grey to act as background noise. The `Breached SLA` slice was colored a stark, alarming red/orange. This weaponizes the data, forcing the stakeholder's eye immediately to the 80.08% failure rate without requiring them to search for the legend.

## 2. Average Time Per Channel (Vertical Bar Chart)
* **Design Choice:** A Vertical Bar Chart was used to compare discrete categorical channels. 
* **Data Contextualization (Reference Line):** Because all channels were failing equally at ~120 hours, the bars looked uniform and lacked impact. To solve this, I engineered a custom `48-Hour SLA Target` reference line. This visually anchored the chart, instantly proving to the viewer that every department was missing the goal by a factor of 2.5x.

## 3. Resolution by Priority (Horizontal Bar Chart)
* **Design Choice:** A Horizontal Bar Chart was utilized to allow for easy reading of the priority labels. 
* **Sorting & Highlighting:** The bars were sorted in descending order (longest wait time at the top). By isolating the "Urgent" bar (121.10 hours) at the very top of the hierarchy, it instantly highlights the inverted routing anomaly—proving that the most critical tickets are incorrectly taking the longest to resolve.

## 4. Segment Wait Times (Matrix Heatmap)
* **Design Choice:** A Matrix Heatmap was chosen to display the intersection of Customer Segments and Communication Channels. 
* **Data Density & Color Scaling:** I utilized a gradient color scale mapped to `resolution_time_hours`. By structuring it as a dense grid, stakeholders can instantly scan for the darkest/most severe bottlenecks. Placing the "Corporate" column prominently highlights the specific wait times (e.g., 122.7 hours for Phone) for the highest-value clients, directly tying operational delays to revenue risk.

## 5. Presentation Layout Strategy (McKinsey / BCG Style)
* **Structure:** The presentation was assembled using a split-column layout to maximize readability.
* **Text Execution:** Instead of bulleting raw data, the left column utilizes stark "Key Finding" callout boxes. This ensures that even if an executive only glances at the slide for 3 seconds, they absorb the exact business insight before even looking at the chart on the right.