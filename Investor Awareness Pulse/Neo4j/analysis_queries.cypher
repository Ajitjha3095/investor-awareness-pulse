// Run each query separately in Neo4j Browser.

// 1) Confirm how many respondents were imported.
MATCH (r:Respondent)
RETURN count(r) AS respondents;

// 2) Awareness rate by area type.
MATCH (r:Respondent)-[:IN_AREA]->(area:AreaType)
MATCH (r)-[aw:AWARENESS_RESPONSE]->(:Workshop)
WITH area.name AS area,
     count(r) AS respondents,
     sum(CASE WHEN aw.value = 'Yes' THEN 1 ELSE 0 END) AS aware
RETURN area,
       respondents,
       aware,
       round(1000.0 * aware / respondents) / 10.0 AS awareness_rate_pct
ORDER BY awareness_rate_pct DESC;

// 3) Awareness rate by education.
MATCH (r:Respondent)-[:HAS_EDUCATION]->(education:Education)
MATCH (r)-[aw:AWARENESS_RESPONSE]->(:Workshop)
WITH education.name AS education,
     count(r) AS respondents,
     sum(CASE WHEN aw.value = 'Yes' THEN 1 ELSE 0 END) AS aware
RETURN education,
       respondents,
       aware,
       round(1000.0 * aware / respondents) / 10.0 AS awareness_rate_pct
ORDER BY awareness_rate_pct DESC;

// 4) Attendance and attended-among-aware rate by area.
MATCH (r:Respondent)-[:IN_AREA]->(area:AreaType)
MATCH (r)-[aw:AWARENESS_RESPONSE]->(workshop:Workshop)
MATCH (r)-[att:ATTENDANCE_RESPONSE]->(workshop)
WITH area.name AS area,
     count(r) AS respondents,
     sum(CASE WHEN aw.value = 'Yes' THEN 1 ELSE 0 END) AS aware,
     sum(CASE WHEN att.value = 'Yes' THEN 1 ELSE 0 END) AS attendees,
     sum(CASE WHEN aw.value = 'Yes' AND att.value = 'Yes' THEN 1 ELSE 0 END) AS aware_attendees,
     sum(CASE WHEN aw.value = 'No' AND att.value = 'Yes' THEN 1 ELSE 0 END) AS conflicting
RETURN area,
       respondents,
       round(1000.0 * attendees / respondents) / 10.0 AS attendance_rate_pct,
       CASE WHEN aware = 0 THEN 0.0
            ELSE round(1000.0 * aware_attendees / aware) / 10.0
       END AS attendance_among_aware_pct,
       conflicting AS conflicting_responses
ORDER BY attendance_rate_pct DESC;

// 5) Preferred channels, with attendance rate.
MATCH (r:Respondent)-[:PREFERS_CHANNEL]->(channel:Channel)
MATCH (r)-[att:ATTENDANCE_RESPONSE]->(:Workshop)
WITH channel.name AS preferred_channel,
     count(r) AS respondents,
     sum(CASE WHEN att.value = 'Yes' THEN 1 ELSE 0 END) AS attendees
RETURN preferred_channel,
       respondents,
       attendees,
       round(1000.0 * attendees / respondents) / 10.0 AS attendance_rate_pct
ORDER BY respondents DESC;

// 6) Review logically conflicting responses before interpreting conversion.
MATCH (r:Respondent)-[aw:AWARENESS_RESPONSE]->(workshop:Workshop)
MATCH (r)-[att:ATTENDANCE_RESPONSE]->(workshop)
WHERE aw.value = 'No' AND att.value = 'Yes'
OPTIONAL MATCH (r)-[:IN_AREA]->(area:AreaType)
RETURN r.respondent_id AS respondent_id,
       area.name AS area_type,
       r.survey_date AS survey_date,
       aw.value AS awareness,
       att.value AS attendance
LIMIT 100;